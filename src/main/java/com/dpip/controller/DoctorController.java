package com.dpip.controller;

import com.dpip.po.*;
import com.dpip.service.*;
import com.dpip.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Controller
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private MedicineHistoryService medicineHistoryService;
    @Autowired
    private PatientService patientService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private LeaveMessageService leaveMessageService;
    @Autowired
    private DiseaseTrackService diseaseTrackService;
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("login")
    public String login(Doctor doctor, Model model, HttpServletRequest request){
        if(doctor.getPwd()==null||doctor.getId()==null){
            model.addAttribute("login","-1");
            return "/login2.jsp";
        }
        doctor.setPwd(MD5Util.MD5(doctor.getPwd()));
        System.out.println(doctor.getId()+"  "+doctor.getPwd());
        Doctor doctor1 =  doctorService.login(doctor);
        String result ="/index.jsp";
        model.addAttribute("login","1");
        if(doctor1==null){
            model.addAttribute("login","-1");
            result="/login2.jsp";
        }else {
            request.getSession().setAttribute("role","doctor");
            request.getSession().setAttribute("user",doctor1);
        }
        return result;
    }


    @RequestMapping("medicineinstruct")
    public String medicineInstruc(int id,Model model){
        List<MedicineHistory> list = medicineHistoryService.select(id);
        Patient p =  new Patient();
        p.setId(id);
        List<Patient> patient = patientService.select(null,p);

        model.addAttribute("dataList",list);
        model.addAttribute("patient",patient.get(0));
        return "/doctor/medicineInstruction.jsp";
    }

    @ResponseBody
    @RequestMapping("addmedicineins")
    public Integer addMedicineIns(MedicineHistory medicineHistory,String sDate){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            medicineHistory.setStartDate(format.parse(sDate));
        }catch(Exception e){

        }
       int  i= medicineHistoryService.add(medicineHistory);

        return i;
    }


    @RequestMapping("comment")
    public String comment(Model model,HttpServletRequest request){
        //这里需要拿到当前医生的id 然后加到Comment中去 查询当前医生的评价列表
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
        Comment comment = new Comment();
        comment.setDoctorId(doctor.getId());
        List<Comment> datas = commentService.select(comment);
        model.addAttribute("dataList",datas);

        return "/doctor/commentList.jsp";
        }

        @RequestMapping("livemessage")
        public String leaveMessageList(Model model,HttpServletRequest request){
            //这里需要拿到当前医生的id 然后加到Comment中去 查询当前医生的评价列表
            Doctor doctor = (Doctor) request.getSession().getAttribute("user");
            LeaveMessage message= new LeaveMessage();
            message.setStatus("未回复");
            message.setDoctorId(doctor.getId());
            List<LeaveMessage> datas = leaveMessageService.select(message);
            model.addAttribute("dataList",datas);
             return "/doctor/leaveMessageList.jsp";
        }


    @ResponseBody
    @RequestMapping("nextlivemessage")
    public LeaveMessage nextLeaveMessage(Model model,int recordsNum,int id,HttpServletRequest request){
        //这里需要拿到当前医生的id 然后加到Comment中去 查询当前医生的评价列表
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
         LeaveMessage updateMessage = new LeaveMessage();
         updateMessage.setId(id);
         updateMessage.setStatus("忽略");
         leaveMessageService.update(updateMessage);

        LeaveMessage message= new LeaveMessage();
        message.setRecordsNum(recordsNum);
        message.setRecordsSize(1);
        message.setId(doctor.getId());
        List<LeaveMessage> datas = leaveMessageService.select(message);
        LeaveMessage leaveMessage = null;
            if (datas.size() >= 1) {
                leaveMessage=datas.get(0);
            }
        return leaveMessage;
    }

    @RequestMapping("toleavemessagereply")
    public String toLeaveMessageReply(int pId,LeaveMessage leaveMessage,Model model){
            Patient patient = new Patient();
            patient.setId(pId);
           List<Patient> patients = patientService.select(null,patient);
           List<LeaveMessage> datas =  leaveMessageService.select(leaveMessage);
           LeaveMessage message = null;
        if (datas.size() >= 0) {
            message = datas.get(0);
        } if (patients.size() >= 0) {
            patient = patients.get(0);
        }
        model.addAttribute("o",message);
        model.addAttribute("p",patient);
        return "/doctor/leaveMessageReply.jsp";
    }


    @RequestMapping("leavemessagereply")
    public String leaveMssageReply(LeaveMessage message){
        if(message.getReply()!=null){
            message.setStatus("已回复");
        }
        leaveMessageService.update(message);
        return "redirect:/doctor/livemessage";
    }

    @RequestMapping("diseasetracklist")
    public String diseaseTrackList(){

        return "/department/diseaseTrackList.jsp";
    }



    @RequestMapping("diseasetrack")
    public String diseaseTrack(DiseaseTrack diseaseTrack,Model model){

        List<DiseaseTrack> datas = diseaseTrackService.select(diseaseTrack);
        model.addAttribute("dataList",datas);
        return "/department/diseaseTrack.jsp";
    }

    @RequestMapping("mediceinstructlist")
    public String medicineInstructList(){

        return "/department/medicineInstructList.jsp";
    }

    @RequestMapping("toupdate")
    public String toUpdate(Model model,HttpServletRequest request){
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
        List<Department> datas = departmentService.selectByName(null).getDatas();
        model.addAttribute("dataList",datas);
        return "/doctor/doctorUpdate.jsp";
    }

    @RequestMapping("update")
    public String update(Doctor doctor,HttpServletRequest request){
        doctorService.update(doctor);
        Doctor doctor1 = doctorService.select(doctor);
        request.getSession().setAttribute("user",doctor1);
        return "/doctor/updateSuccess.jsp";
    }

    @RequestMapping("toupdatepassword")
    public String toUpdatePassword(){

        return "/doctor/doctorPwdUpdate.jsp";
    }

    @RequestMapping("updatepassword")
    public String updatePassword(Doctor doctor){
        doctorService.update(doctor);
        return "/doctor/updateSuccess.jsp";
    }

    @ResponseBody
    @RequestMapping("checkpassword")
    public int updatePassword(HttpServletRequest request,String oldPwd){
        if(oldPwd!=null){
            oldPwd = MD5Util.MD5(oldPwd);
        }
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
        int result = 0;
        if (doctor != null && doctor.getPwd().equals(oldPwd)) {
            result=1;
        }
        return  result;
    }

        @ResponseBody
        @RequestMapping("add")
        public int add(Doctor doctor){

            return doctorService.add(doctor);
        }
}

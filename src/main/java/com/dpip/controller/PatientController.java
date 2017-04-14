package com.dpip.controller;

import com.dpip.po.*;
import com.dpip.service.CommentService;
import com.dpip.service.DoctorService;
import com.dpip.service.LeaveMessageService;
import com.dpip.service.PatientService;
import com.dpip.util.MD5Util;
import com.dpip.util.Page;
import com.dpip.util.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * Created by chenyong on 2017/4/4.
 */
@Controller
public class PatientController  {

    @Autowired
    private PatientService patientService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private LeaveMessageService leaveMessageService;

    @RequestMapping("/patient/login")
    public String login(Model model,Patient patient,HttpServletRequest request ){
        if(patient.getPwd()==null||patient.getId()==null){
            model.addAttribute("login",-1);
            return "/login2.jsp";
        }
        patient.setPwd(MD5Util.MD5(patient.getPwd()));
        List<Patient> datas=patientService.select(null,patient);
        if(datas.size()==0){
            model.addAttribute("login",-1);
            return "/login2.jsp";
        }else{
            request.getSession().setAttribute("user",datas.get(0));
            request.getSession().setAttribute("role","patient");
        }
        return "/index.jsp";
    }

    @RequestMapping("/patient/list")
    public String list(Page page, Patient patient, Model model, HttpServletRequest request){
        if(patient.getpType()!=null){
            request.getSession().setAttribute("pType",patient.getpType());
        }else{
            patient.setpType((String)request.getSession().getAttribute("pType"));
        }
       // List<Patient> list=patientService.select(page,patient);
        //model.addAttribute("dataList",list);
        //model.addAttribute("page",page);
        return  "/patient/patientList.jsp";
    }


    @ResponseBody
    @RequestMapping("/patient/ajaxlist")
    public ResponseData ajaxList(Integer divisionFlag, Page page, Patient patient, Model model, HttpServletRequest request){
        if(divisionFlag==null) {
            if (patient.getpType() != null) {
                request.getSession().setAttribute("pType", patient.getpType());
            } else {
                patient.setpType((String) request.getSession().getAttribute("pType"));
            }
        }
        List<Patient> list=patientService.select(page,patient);
        ResponseData responseData = new ResponseData();
        responseData.setDatas(list);
        responseData.setPage(page);
        responseData.setTotal(page.getTotal());
        return  responseData;
    }

    @RequestMapping("/patient/toAdd")
    public String toAdd(){

        return "/patient/patientAdd.jsp";
    }


    @ResponseBody
    @RequestMapping("/patient/add")
    public Integer add(Patient patient,HttpServletRequest request){
        Doctor doctor = (Doctor)request.getSession().getAttribute("user");
        patient.setDoctorId(doctor.getId());
        return patientService.add(patient);
    }

    @RequestMapping("/patient/toviewupdate")
    public String toViewUpdate(Patient patient,Model model){

        List<Patient> list = patientService.select(null,patient);
        model.addAttribute("o",list.get(0));

        return "/patient/patientViewUpdate.jsp";
    }


    @ResponseBody
    @RequestMapping("/patient/update")
    public Integer update(Patient patient){

        int i = patientService.update(patient);
        return i;
    }

    @ResponseBody
    @RequestMapping("/patient/delete")
    public Integer delete(int id){
        List<Integer> list = new ArrayList<Integer>();
        list.add(id);
        int i = patientService.delete(list);

        return i;
    }



    @RequestMapping("/patient/tocomment")
    public String toComment(HttpServletRequest request,Model model){
       Patient p =  (Patient)request.getSession().getAttribute("user");
       Doctor doctor = new Doctor();
       doctor.setId(p.getDoctorId());
         doctor = doctorService.select(doctor);
         model.addAttribute("doctor",doctor);
        return "/patient/addComment.jsp";
    }

    @RequestMapping("/patient/comment")
    public String comment(HttpServletRequest request,  Comment comment){
        Patient p =  (Patient)request.getSession().getAttribute("user");
        comment.setDepartmentId(p.getDepartmentId());
        comment.setDoctorId(p.getDoctorId());
        comment.setCommitDate(new Date());
        commentService.add(comment);
        request.setAttribute("item","评价");
        return "/patient/success.jsp";
    }

    @RequestMapping("/patient/toleavemessage")
    public String toLeaveMassage(HttpServletRequest request,Model model){
        Patient p =  (Patient)request.getSession().getAttribute("user");
        Doctor doctor = new Doctor();
        doctor.setId(p.getDoctorId());
        doctor = doctorService.select(doctor);
        model.addAttribute("doctor",doctor);

        return "/patient/leaveMessage.jsp";
    }

    @RequestMapping("/patient/leavemessage")
    public String leaveMassage(LeaveMessage leaveMessage,HttpServletRequest request){
        Patient p =  (Patient)request.getSession().getAttribute("user");
       leaveMessage.setStatus("未回复");
       leaveMessage.setDepartmentId(p.getDepartmentId());
       leaveMessage.setLeaveDate(new Date());
       leaveMessage.setFatherId(0);
       leaveMessage.setDoctorId(p.getDoctorId());
       leaveMessageService.add(leaveMessage);
       request.setAttribute("item","留言");
        return "/patient/success.jsp";
    }


    @RequestMapping("/patient/checkleavemessage")
    public String checkLeaveMassage(HttpServletRequest request,Model model){
        Patient p =  (Patient)request.getSession().getAttribute("user");
        Doctor doctor =new Doctor();
        doctor.setId(p.getDoctorId());
        doctor = doctorService.select(doctor);
        LeaveMessage leaveMessage = new LeaveMessage();
        leaveMessage.setPatientId(p.getId());
        leaveMessage.setStatus("已回复");
        List<LeaveMessage> datas = leaveMessageService.select(leaveMessage);
        model.addAttribute("dataLists",datas);
        model.addAttribute("doctor",doctor);
        return "/patient/leaveMessageReply.jsp";
    }
    @ResponseBody
    @RequestMapping("/patient/leavemessagereaded")
    public int leaveMassageReaded( LeaveMessage leaveMessage){
        leaveMessage.setStatus("已读");
        int i = leaveMessageService.update(leaveMessage);
        return i;
    }

    @RequestMapping("/patient/toupdatepassword")
    public String toUpdatePassword(){

        return "/patient/pwdUpdate.jsp";
    }

    @RequestMapping("/patient/updatepassword")
    public String updatePassword(Patient patient,Model model){
        model.addAttribute("item","修改密码");
        patientService.update(patient);
        return "/patient/success.jsp";
    }

    @ResponseBody
    @RequestMapping("/patient/checkpassword")
    public int updatePassword(HttpServletRequest request,String oldPwd){
        if(oldPwd!=null){
            oldPwd = MD5Util.MD5(oldPwd);
        }
        Patient patient = (Patient) request.getSession().getAttribute("user");
        int result = 0;
        if (patient != null && patient.getPwd().equals(oldPwd)) {
            result=1;
        }
        return  result;
    }
}

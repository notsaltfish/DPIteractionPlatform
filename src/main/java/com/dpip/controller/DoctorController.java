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
 * Created by X on 2017/4/4.
 * 关于医生用户一些相关的操作的Controller
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

    /**
     * 处理医生登录的请求 和管理员登录类似
     * @param doctor 存储医生登录的密码和id信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("login")
    public String login(Doctor doctor, Model model, HttpServletRequest request){
        /**
         *  假设管理员的id和密码为null说明前台登录的时候没有输入这个两个字段
         *  便重新返回登录页面
         *  在model里面添加login为-1 这样告诉前台
         * 密码或者用户名错误
         */
        if(doctor.getPwd()==null||doctor.getId()==null){
            model.addAttribute("login","-1");
            return "/login.jsp";
        }
        /**
         * 如果不为空则将用户输入的密码加密
         * 然后再去数据库查询是否有该用户 如果有则返回index主页 若没有
         * 则还是返回login登录页面
         * 存在改用户的同时还要在session里面保存一个该用户对象
         * 以免丢失 另外还要将其角色role设置会admin 管理员
         * 这样页面就会根据对应的角色显示对应的菜单
         * 做好了权限控制
         */
        doctor.setPwd(MD5Util.MD5(doctor.getPwd()));
        System.out.println(doctor.getId()+"  "+doctor.getPwd());
        Doctor doctor1 =  doctorService.login(doctor);
        String result ="/index.jsp";
        model.addAttribute("login","1");
        if(doctor1==null){
            model.addAttribute("login","-1");
            result="/login.jsp";
        }else {
            request.getSession().setAttribute("role","doctor");
            request.getSession().setAttribute("user",doctor1);
        }
        return result;
    }


    /**
     * 前往指导用药的页面
     * @param id 获取病人的id 然后查出病人的用药历史
     *           同时也把病人的信息信息展示出来
     * @param model
     * @return 返回对应的数据
     */
    @RequestMapping("medicineinstruct")
    public String medicineInstruc(int id,Model model){
        //获取病人的用药历史
        List<MedicineHistory> list = medicineHistoryService.select(id);
        Patient p =  new Patient();
        p.setId(id);
        //获取病人的信息信息
        List<Patient> patient = patientService.select(null,p);
        //添加进model  前端jsp页面展示
        model.addAttribute("dataList",list);
        model.addAttribute("patient",patient.get(0));
        return "/doctor/medicineInstruction.jsp";
    }

    /**
     * 添加指导用药添
     * @param medicineHistory
     * @param sDate
     * @return
     */
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


    /**
     * 查看当前医生的留言
     * @param model
     * @param request
     * @return 返回展示评价的页面
     */
    @RequestMapping("comment")
    public String comment(Model model,HttpServletRequest request){
        //这里需要拿到当前医生的id 然后加到Comment中去 查询当前医生的评价列表
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
        Comment comment = new Comment();
        comment.setDoctorId(doctor.getId());
        //获取属于该医生的评价信息
        List<Comment> datas = commentService.select(comment);
        model.addAttribute("dataList",datas);

        return "/doctor/commentList.jsp";
        }

    /**
     * 查看医生的未回复留言页面
     *
     * @param model
     * @param request
     * @return 返回留言的列表
     */
        @RequestMapping("livemessage")
        public String leaveMessageList(Model model,HttpServletRequest request){
            //这里需要拿到当前医生的id 然后加到Comment中去 查询当前医生的评价列表
            Doctor doctor = (Doctor) request.getSession().getAttribute("user");
            LeaveMessage message= new LeaveMessage();
            message.setStatus("未回复");
            message.setDoctorId(doctor.getId());
            //获取未回复的留言列表
            List<LeaveMessage> datas = leaveMessageService.select(message);
            model.addAttribute("dataList",datas);

             return "/doctor/leaveMessageList.jsp";
        }


    /**
     * 前端页面点击忽略之后就会触发这个请求
     * 将点击的忽略的留言状态更新会忽略
     * 同时查询查询下一条留言
     * @param model
     * @param recordsNum 查询的第几条留言
     * @param id 点击忽略的留言id
     * @param request
     * @return 返回查询到的留言条
     */
    @ResponseBody
    @RequestMapping("nextlivemessage")
    public LeaveMessage nextLeaveMessage(Model model,int recordsNum,int id,HttpServletRequest request){
        //这里需要拿到当前医生的id 然后加到Comment中去 查询当前医生的评价列表
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
         LeaveMessage updateMessage = new LeaveMessage();
         updateMessage.setId(id);
         updateMessage.setStatus("忽略");
         leaveMessageService.update(updateMessage);
        /**
         * 更新前端点击的忽略的留言
         */
        /**
         * 查询下一条留言
         */
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

    /**
     * 前往回复留言的页面
     * @param pId 获取留言的病人的id
     * @param leaveMessage 获取留言的信息
     * @param model
     * @return   返回留言的页面
     */
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
        /**
         * 将病人和留言的信息添加进入model
         */
        model.addAttribute("o",message);
        model.addAttribute("p",patient);
        return "/doctor/leaveMessageReply.jsp";
    }


    /**
     * 保存医生回复留言的内容
     * @param message 留言的内容
     * @return 重定向到留言列表
     */
    @RequestMapping("leavemessagereply")
    public String leaveMssageReply(LeaveMessage message){
        //把留言的状态设置为已经回复
        if(message.getReply()!=null){
            message.setStatus("已回复");
        }
        leaveMessageService.update(message);
        return "redirect:/doctor/livemessage";
    }

    //前往病情跟踪的列表
    @RequestMapping("diseasetracklist")
    public String diseaseTrackList(){

        return "/department/diseaseTrackList.jsp";
    }


    /**
     * 前往具体某一位病人的病情跟踪详细页面
     * @param diseaseTrack 保存有病人的id
     * @param model
     * @return 返回并且跟踪的详细页面 并且展示并且跟踪信息
     */
    @RequestMapping("diseasetrack")
    public String diseaseTrack(DiseaseTrack diseaseTrack,Model model){
        //查询病人的病情信息
        List<DiseaseTrack> datas = diseaseTrackService.select(diseaseTrack);
        model.addAttribute("dataList",datas);
        return "/department/diseaseTrack.jsp";
    }

    /**
     * 千万指导用药的列表
     * @return
     */
    @RequestMapping("mediceinstructlist")
    public String medicineInstructList(){

        return "/department/medicineInstructList.jsp";
    }

    /**
     * 前往医生的个人信息更新页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("toupdate")
    public String toUpdate(Model model,HttpServletRequest request){
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
       //获取科室信息 需要再医生修改时用到
        List<Department> datas = departmentService.selectByName(null).getDatas();
        model.addAttribute("dataList",datas);
        return "/doctor/doctorUpdate.jsp";
    }

    /**
     * 修改医生的信息
     * @param doctor 医生的修改的信息
     * @param request
     * @return 修改成功后返回到提示成功的页面
     */
    @RequestMapping("update")
    public String update(Doctor doctor,HttpServletRequest request){
        doctorService.update(doctor);
        Doctor doctor1 = doctorService.select(doctor);
        //修改成功后也要更新Session里面的医生信息
        request.getSession().setAttribute("user",doctor1);
        return "/doctor/updateSuccess.jsp";
    }

    /**
     * 前往更新密码的页面
     * @return
     */
    @RequestMapping("toupdatepassword")
    public String toUpdatePassword(){

        return "/doctor/doctorPwdUpdate.jsp";
    }

    /**
     * 更新密码
     * @param doctor 修改后的 医生的密码信息
     * @return 返回成功后的页面
     */
    @RequestMapping("updatepassword")
    public String updatePassword(Doctor doctor){
        doctorService.update(doctor);
        return "/doctor/updateSuccess.jsp";
    }

    /**
     * 修改密码时检查旧密码输入输入正确
     * @param request
     * @param oldPwd 旧密码
     * @return 正确返回1 错误返回0
     */
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

    /**
     * 添加新的医生 则是由管理员操作的
     * 医生 没有权限
     * @param doctor
     * @return 返回成功添加的条数
     */
    @ResponseBody
        @RequestMapping("add")
        public int add(Doctor doctor){

            return doctorService.add(doctor);
        }
}

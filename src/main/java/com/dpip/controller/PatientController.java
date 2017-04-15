package com.dpip.controller;

import com.dpip.po.*;
import com.dpip.service.*;
import com.dpip.util.MD5Util;
import com.dpip.util.Page;
import com.dpip.util.ResponseData;
import com.github.pagehelper.PageHelper;
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
 * Created by X on 2017/4/4.
 * 患者的controller
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
    @Autowired
    private MedicineHistoryService medicineHistoryService;

    /**
     * 控制患者登录的请求 功能与医生和管理员类似
     * @param model
     * @param patient
     * @param request
     * @return
     */
    @RequestMapping("/patient/login")
    public String login(Model model,Patient patient,HttpServletRequest request ){
        /**
         *  假设患者的id和密码为null说明前台登录的时候没有输入这个两个字段
         *  便重新返回登录页面
         *  在model里面添加login为-1 这样告诉前台
         * 密码或者用户名错误
         */
        if(patient.getPwd()==null||patient.getId()==null){
            model.addAttribute("login",-1);
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
        patient.setPwd(MD5Util.MD5(patient.getPwd()));
        List<Patient> datas=patientService.select(null,patient);
        if(datas.size()==0){
            model.addAttribute("login",-1);
            return "/login.jsp";
        }else{
            request.getSession().setAttribute("user",datas.get(0));
            request.getSession().setAttribute("role","patient");
        }
        return "/index.jsp";
    }

    /**
     * 前往病人数据列表页面 很少用
     * 主要都用ajax了
     *
     * @param page
     * @param patient
     * @param model
     * @param request
     * @return
     */
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


    /**
     * 通过ajax获取用户的数据
     * @param divisionFlag 区分是查询门诊还是住院
     * @param page 分页相关信息
     * @param patient 病人相关信息
     * @param model
     * @param request
     * @return 返回查询的数据  ajax
     */
    @ResponseBody
    @RequestMapping("/patient/ajaxlist")
    public ResponseData ajaxList(Integer divisionFlag, Page page, Patient patient, Model model, HttpServletRequest request){
        /**
         * 如果区分是要查询住院还是门诊的标砖为null 并且病人的的类型不为空
         * 则将类型设置进入session
         * 如果病人的类型也是空的 则从session当中取出病人类型的数据
         */
        if(divisionFlag==null) {
            if (patient.getpType() != null) {
                request.getSession().setAttribute("pType", patient.getpType());
            } else {
                patient.setpType((String) request.getSession().getAttribute("pType"));
            }
        }
        /**
         * 查询对应的数据 将其获取到数据通过啊ajax返回回去
         */
        List<Patient> list=patientService.select(page,patient);
        ResponseData responseData = new ResponseData();
        responseData.setDatas(list);
        responseData.setPage(page);
        responseData.setTotal(page.getTotal());
        return  responseData;
    }

    /**
     * 前往患者的添加页面 返回病人的添加页面
     * @return
     */
    @RequestMapping("/patient/toAdd")
    public String toAdd(){

        return "/patient/patientAdd.jsp";
    }


    /**
     * 添加病人
     * @param patient 需要添加的病人信息
     * @param request
     * @return 返回添加条数
     */
    @ResponseBody
    @RequestMapping("/patient/add")
    public Integer add(Patient patient,HttpServletRequest request){
        Doctor doctor = (Doctor)request.getSession().getAttribute("user");
        patient.setDoctorId(doctor.getId());
        return patientService.add(patient);
    }

    /**
     * 前往患者的查看和更新页面
     * @param patient 具体查看的病人的id
     * @param model
     * @return  返回查看和修改页面
     */
    @RequestMapping("/patient/toviewupdate")
    public String toViewUpdate(Patient patient,Model model){

        List<Patient> list = patientService.select(null,patient);
        model.addAttribute("o",list.get(0));

        return "/patient/patientViewUpdate.jsp";
    }


    /**
     * 更新患者
     * @param patient  需要更新的患者信息
     * @return 返回更新成功的条数
     */
    @ResponseBody
    @RequestMapping("/patient/update")
    public Integer update(Patient patient){

        int i = patientService.update(patient);
        return i;
    }

    /**
     *根据id删除用户
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/patient/delete")
    public Integer delete(int id){
        /**
         * 因为service 和mapper写的方法是根据list删除患者
         * 所以这里需要封装患者的id到list里面去
         */
        List<Integer> list = new ArrayList<Integer>();
        list.add(id);
        int i = patientService.delete(list);

        return i;
    }


    /**
     * 前往给医生评价的页面
     * @param request
     * @param model
     * @return 返回评价页面
     */
    @RequestMapping("/patient/tocomment")
    public String toComment(HttpServletRequest request,Model model){
        //获取当前登录的患者
       Patient p =  (Patient)request.getSession().getAttribute("user");
       Doctor doctor = new Doctor();
       doctor.setId(p.getDoctorId());
       //获取当前登录患者的医生 并且把医生放入model
         doctor = doctorService.select(doctor);
         model.addAttribute("doctor",doctor);
        return "/patient/addComment.jsp";
    }

    /**
     * 保存对医生的评价内容
     * @param request
     * @param comment 评价的内容
     * @return 返回评价成功的页面
     */
    @RequestMapping("/patient/comment")
    public String comment(HttpServletRequest request,  Comment comment){
        Patient p =  (Patient)request.getSession().getAttribute("user");
        comment.setDepartmentId(p.getDepartmentId());
        comment.setDoctorId(p.getDoctorId());
        comment.setCommitDate(new Date());
        //保存评价
        commentService.add(comment);
        request.setAttribute("item","评价");
        return "/patient/success.jsp";
    }

    /**
     * 千万留言的页面
     * @param request
     * @param model
     * @return 返回留言页面
     */
    @RequestMapping("/patient/toleavemessage")
    public String toLeaveMassage(HttpServletRequest request,Model model){
        /**
         * 需要根据患者的id获取患者的医生
         * 然后将医生的信息展示到留言页面
         */
        Patient p =  (Patient)request.getSession().getAttribute("user");
        Doctor doctor = new Doctor();
        doctor.setId(p.getDoctorId());
        doctor = doctorService.select(doctor);
        model.addAttribute("doctor",doctor);

        return "/patient/leaveMessage.jsp";
    }

    /**
     * 保存患者的留言信息
     * @param leaveMessage 留言的信息
     * @param request
     * @return 千万留言成功的页面
     */
    @RequestMapping("/patient/leavemessage")
    public String leaveMassage(LeaveMessage leaveMessage,HttpServletRequest request){
        Patient p =  (Patient)request.getSession().getAttribute("user");
        //最开始留言的信息是没有回复的 所以需要设置成未回复
       leaveMessage.setStatus("未回复");
       leaveMessage.setDepartmentId(p.getDepartmentId());
       leaveMessage.setLeaveDate(new Date());
       leaveMessage.setFatherId(0);
       leaveMessage.setDoctorId(p.getDoctorId());
       //保存留言
       leaveMessageService.add(leaveMessage);
       request.setAttribute("item","留言");
        return "/patient/success.jsp";
    }

    /**
     *患者检查自己的留言是否回复
     * @param request
     * @param model
     * @return 返回回复的留言页面
     */
    @RequestMapping("/patient/checkleavemessage")
    public String checkLeaveMassage(HttpServletRequest request,Model model){
        Patient p =  (Patient)request.getSession().getAttribute("user");
        Doctor doctor =new Doctor();
        doctor.setId(p.getDoctorId());
        doctor = doctorService.select(doctor);
        LeaveMessage leaveMessage = new LeaveMessage();
        leaveMessage.setPatientId(p.getId());
        leaveMessage.setStatus("已回复");
        //查询当前登录的患者的一家回复的留言
        List<LeaveMessage> datas = leaveMessageService.select(leaveMessage);
        model.addAttribute("dataLists",datas);
        model.addAttribute("doctor",doctor);
        return "/patient/leaveMessageReply.jsp";
    }

    /**
     *读取留言之后 将留言设置为已读
     * @param leaveMessage
     * @return 返回成功的条数
     */
    @ResponseBody
    @RequestMapping("/patient/leavemessagereaded")
    public int leaveMassageReaded( LeaveMessage leaveMessage){
        leaveMessage.setStatus("已读");
        int i = leaveMessageService.update(leaveMessage);
        return i;
    }

    /**
     * 前往更新患者密码的页面
     * @return 返回密码更新的页面
     */
    @RequestMapping("/patient/toupdatepassword")
    public String toUpdatePassword(){

        return "/patient/pwdUpdate.jsp";
    }

    /**
     * 更新密码
     * @param patient
     * @param model
     * @return  返回成功页面
     */
    @RequestMapping("/patient/updatepassword")
    public String updatePassword(Patient patient,Model model){
        model.addAttribute("item","修改密码");
        patientService.update(patient);
        return "/patient/success.jsp";
    }

    /**
     * 查看旧密码输入是否正确
     * @param request
     * @param oldPwd
     * @return 正确返回1  错误返回0
     */
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

    /**
     * 前往指导用药页面
     * @return 指导用药页面
     */
    @RequestMapping("/patient/tomediceinstruct")
    public String toMedicineInstruction(){

        return "/patient/medicineInstruction.jsp";
    }

    /**
     * 放回指导用药的数据
     * @param page  分页的数据
     * @param request
     * @return 返回对应的数据 ajax
     */
    @ResponseBody
    @RequestMapping("/patient/medicineinstruction")
    public ResponseData medicineInstruction(Page page, HttpServletRequest request){
       Patient patient = (Patient) request.getSession().getAttribute("user");
       if(page.getPage()==0||page.getPageSize()==0){
           page.setPage(1);
           page.setPageSize(10);
       }
        PageHelper.startPage(page.getPage(),page.getPageSize());
       //查询对应的指导用药历史
        ResponseData<MedicineHistory> datas = medicineHistoryService.selectAjax(patient.getId());
        datas.setPage(page);
        return datas;
    }
}

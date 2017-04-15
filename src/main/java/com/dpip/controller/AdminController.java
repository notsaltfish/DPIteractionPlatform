package com.dpip.controller;

import com.dpip.po.*;
import com.dpip.service.*;
import com.dpip.util.MD5Util;
import com.dpip.util.Page;
import com.dpip.util.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by X on 2017/4/4.
 *这个类主要是进行管理整个系统的用户
 * 和医院的科室药品等等相关功能
 *
 */
@Controller
public class AdminController {

    @Autowired
    private PatientService patientService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private DepartmentService departmentService;

    /**
     * 管理员登录
     */

    @RequestMapping("/admin/login")
    public String login(Model model,Admin admin,HttpServletRequest request ){
        /**
         *  假设管理员的id和密码为null说明前台登录的时候没有输入这个两个字段
         *  便重新返回登录页面
         *  在model里面添加login为-1 这样告诉前台
         * 密码或者用户名错误
         */

       if(admin.getId()==null||admin.getPwd()==null){
           model.addAttribute("login",-1);
           return  "/login.jsp";
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
        admin.setPwd(MD5Util.MD5(admin.getPwd()));
        List<Admin> datas=adminService.select(admin);
        if(datas.size()==0){
            model.addAttribute("login",-1);
            return "/login.jsp";
        }else{
            request.getSession().setAttribute("user",datas.get(0));
            request.getSession().setAttribute("role","admin");
        }
        return "/index.jsp";
    }

    /**
     * 前往修改管理员密码的页面
     * @return 返回该页面
     */
    @RequestMapping("/admin/toupdatepassword")
    public String toUpdatePassword(){

        return "/admin/adminUpdate.jsp";
    }

    /**
     * 修改密码
     * @param admin 传入是要修改密码的管理员
     * @param request 获取request对象
     * @return
     */
    @RequestMapping("/admin/updatepassword")
    public String updatePassword(Admin admin,HttpServletRequest request){
        adminService.update(admin);
        //修改好密码之后 管理员的密码已经更新了 所以要对session里面的管理员进行更新
        //重新赋值
        request.getSession().setAttribute("user",adminService.select(admin).get(0));
        return "/admin/updateSuccess.jsp";
    }

    /**
     * 检查管理员在修改密码时输入的旧密码是否正确
     * @param request
     * @param pwd
     * @return
     */
    @ResponseBody
    @RequestMapping("/admin/checkpassword")
    public int checkOldPassword(HttpServletRequest request,String pwd){
        //如果旧密码不是null 则对其进行MD5加密
        if(pwd!=null){
            pwd = MD5Util.MD5(pwd);
        }
        //然后再获取session里面的用户 查看输入的密码和管理员的密码是否匹配
        //若匹配返回1 不匹配返回0
        //前台根据对应的数字作出处理
        Admin admin = (Admin) request.getSession().getAttribute("user");
        int i = 0;
        if(pwd!=null&&pwd.equals(admin.getPwd())){
            i=1;
        }
        return i;
    }

    /**
     * 前往患者的管理页面
     * @param page 需要进行分页的对象
     * @param patient 查询的相关参数存在这里面
     * @param model
     * @param request
     * @return 返回病人的管理页面
     */
    @RequestMapping("/admin/topatientmana")
    public String list(Page page, Patient patient, Model model, HttpServletRequest request){
        if(patient.getpType()!=null){
            request.getSession().setAttribute("pType",patient.getpType());
        }else{
            patient.setpType((String)request.getSession().getAttribute("pType"));
        }
       // List<Patient> list=patientService.select(page,patient);
        //model.addAttribute("dataList",list);
        //model.addAttribute("page",page);
        return  "/admin/patientList.jsp";
    }

    /**
     * 前往科室的管理页面
     * @return 返回科室管理页面
     */
    @RequestMapping("/admin/todepartmentmana")
    public String toDepartmentManagement(){

        return "/admin/departmentList.jsp";
    }

    /**
     * 前面病种管理页面
     * @return 返回病种管理页面
     */
    @RequestMapping("/admin/todiseasemana")
    public String toDiseaseManagement(){

        return "/admin/diseaseList.jsp";
    }

    /**
     * 前往医生的管理页面
     * @return 返回医生的管理页面
     */
    @RequestMapping("/admin/todoctormana")
    public String toDoctorManagement(){

        return "/admin/doctorList.jsp";
    }

    /**
     * 千万药品管理页面
     * @return 返回药品的管理页面
     */
    @RequestMapping("/admin/tomedicinemana")
    public String toMedicineManagement(){

        return "/admin/medicineList.jsp";
    }

    /**
     * 前台通过ajax请求发送数据到后台  后台发挥对应的数据
     * @param page 分页参数
     * @param type 请求的类型参数
     * @param name 查询的名字关键词
     * @return 返回请求对应的数据
     */
    @ResponseBody
    @RequestMapping("/admin/ajaxlist")
    public ResponseData ajaxList(Page page, String type, String name){

        ResponseData  datas = adminService.selectData(page,type,name);

        return datas;
    }

    /**
     * 更新数据
     * @param type  需要更新的数据类型 比如说有医生  病人 药品 科室等
     * @param id 对应数据的id
     * @param name 更新的字段为名字 管理员可以修改他们的名字
     * @return 返回成功的条数
     */
    @ResponseBody
    @RequestMapping("/admin/update")
    public int update(String type,String id,String name){

        return adminService.updateData(type,id,name);
    }

    /**
     * 添加数据
     * @param type 添加的数据类型 有 病种 药品 科室
     * @param name 需要添加的名字
     * @return 返回成功的条数
     */
    @ResponseBody
    @RequestMapping("/admin/add")
    public int add(String type,String name){

        return adminService.addData(type,name);
    }

    /**
     * 删除数据
     * @param type  需要删除的数据 有科室 病种 药品
     * @param id 需要删除的对应数据id
     * @return 返回成功的条数
     */
    @ResponseBody
    @RequestMapping("/admin/delete")
    public int update(String type,Integer id){

        return adminService.delete(type,id);
    }

    /**
     * 退出登录 医生 患者 管理员都可以点击这个请求地址
     * @param request
     * @return
     */
    @RequestMapping("/admin/logout")
    public String logout(HttpServletRequest request){
        /**
         * 清除SESSION的user
         * 和role
         */
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("role");
        //重定向到登录地址
        return "redirect:/";
    }

}

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
 * Created by chenyong on 2017/4/4.
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

    @RequestMapping("/admin/login")
    public String login(Model model,Admin admin,HttpServletRequest request ){
        admin.setPwd(MD5Util.MD5(admin.getPwd()));
        List<Admin> datas=adminService.select(admin);
        if(datas.size()==0){
            model.addAttribute("login",-1);
            return "/login2.jsp";
        }else{
            request.getSession().setAttribute("user",datas.get(0));
            request.getSession().setAttribute("role","admin");
        }
        return "/index.jsp";
    }


    @RequestMapping("/admin/toupdatepassword")
    public String toUpdatePassword(){

        return "/admin/adminUpdate.jsp";
    }

    @RequestMapping("/admin/updatepassword")
    public String updatePassword(Admin admin,HttpServletRequest request){
        adminService.update(admin);
        request.getSession().setAttribute("user",adminService.select(admin).get(0));
        return "/admin/updateSuccess.jsp";
    }

    @ResponseBody
    @RequestMapping("/admin/checkpassword")
    public int checkOldPassword(HttpServletRequest request,String pwd){
        Admin admin = (Admin) request.getSession().getAttribute("user");
        int i = 0;
        if(pwd!=null&&pwd.equals(admin.getPwd())){
            i=1;
        }
        return i;
    }

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

    @RequestMapping("/admin/todepartmentmana")
    public String toDepartmentManagement(){

        return "/admin/departmentList.jsp";
    }

    @RequestMapping("/admin/todiseasemana")
    public String toDiseaseManagement(){

        return "/admin/diseaseList.jsp";
    }

    @RequestMapping("/admin/todoctormana")
    public String toDoctorManagement(){

        return "/admin/doctorList.jsp";
    }

    @RequestMapping("/admin/tomedicinemana")
    public String toMedicineManagement(){

        return "/admin/medicineList.jsp";
    }

    @ResponseBody
    @RequestMapping("/admin/ajaxlist")
    public ResponseData ajaxList(Page page, String type, String name){

        ResponseData  datas = adminService.selectData(page,type,name);

        return datas;
    }

    @ResponseBody
    @RequestMapping("/admin/update")
    public int update(String type,String id,String name){

        return adminService.updateData(type,id,name);
    }

    @ResponseBody
    @RequestMapping("/admin/add")
    public int add(String type,String name){

        return adminService.addData(type,name);
    }

    @ResponseBody
    @RequestMapping("/admin/delete")
    public int update(String type,Integer id){

        return adminService.delete(type,id);
    }

    @RequestMapping("/admin/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("role");
        return "redirect:/";
    }

}

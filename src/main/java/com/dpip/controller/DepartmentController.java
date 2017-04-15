package com.dpip.controller;

import com.dpip.po.Department;
import com.dpip.util.ResponseData;
import com.dpip.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by X on 2017/4/4.
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/department/selectbyname")
    public ResponseData<Department> selectByName(Department department){

        return departmentService.selectByName(department);
    }


}

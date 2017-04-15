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
 * 科室的controller
 * 主要只有一个功能
 * 就是根据名字搜索模糊搜素科室
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 根据管理员前台输入的名字模糊搜素科室
     * @param department 保存了名字的科室对象
     * @return 返回查询的对应的 数据
     */
    @ResponseBody
    @RequestMapping("/department/selectbyname")
    public ResponseData<Department> selectByName(Department department){

        return departmentService.selectByName(department);
    }


}

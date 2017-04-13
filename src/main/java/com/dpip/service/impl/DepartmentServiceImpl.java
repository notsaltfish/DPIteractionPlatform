package com.dpip.service.impl;

import com.dpip.mapper.DepartmentMapper;
import com.dpip.po.Department;
import com.dpip.util.ResponseData;
import com.dpip.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenyong on 2017/4/5.
 */

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public ResponseData<Department> selectByName(Department department) {
        if(department==null){
            department = new Department();
        }
        List<Department> list = departmentMapper.selectByName(department);
        ResponseData<Department> data = new ResponseData<Department>();
        data.setDatas(list);

        return data;
    }
}

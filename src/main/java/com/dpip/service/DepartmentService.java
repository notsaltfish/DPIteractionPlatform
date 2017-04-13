package com.dpip.service;

import com.dpip.po.Department;
import com.dpip.util.ResponseData;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface DepartmentService {

public ResponseData<Department> selectByName(Department department);
}

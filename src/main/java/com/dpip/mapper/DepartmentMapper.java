package com.dpip.mapper;

import com.dpip.po.Department;
import com.dpip.po.Disease;

import java.util.List;

/**
 * Created by chenyong on 2017/4/5.
 */
public interface DepartmentMapper {
    public List<Department> selectByName(Department department);

    public int  getCount(Department department);

    public int update(Department department);

   public  int add(Department department);

    public int delete(Department department);
}

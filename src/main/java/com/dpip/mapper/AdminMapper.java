package com.dpip.mapper;

import com.dpip.po.Admin;
import com.dpip.po.Patient;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 管理员Mapper
 */
public interface AdminMapper {

    public  int update(Admin admin);

    public List<Admin> select(Admin admin);


}

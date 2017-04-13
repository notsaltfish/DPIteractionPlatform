package com.dpip.service;

import com.dpip.po.Admin;
import com.dpip.util.Page;
import com.dpip.util.ResponseData;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface AdminService {

    public  int update(Admin admin);

    public List<Admin> select(Admin admin);


    public ResponseData selectData(Page page, String type, String name);

    public int  updateData(String type, String id, String name);

    public int addData(String type, String name);

    public   int delete(String type, Integer id);
}

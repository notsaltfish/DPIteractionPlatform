package com.dpip.service.impl;

import com.dpip.mapper.DoctorMapper;
import com.dpip.po.Doctor;
import com.dpip.service.DoctorService;
import com.dpip.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by X on 2017/4/4.
 * 医生service类
 */

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorMapper doctorMapper;

    /**
     * 处理医生登录
     * @param doctor 根据前台的登录信息
     *               查询数据是否有这样的人
     * @return 查询到的数据
     */
    @Override
    public Doctor login(Doctor doctor) {
        Doctor doctor1 = doctorMapper.select(doctor);

        return doctor1;
    }

    /**
     * 更新医生的信息 如果有更新密码 则需要对密码
     * 重新进行MD5机密
     * @param doctor
     * @return
     */
    @Override
    public int update(Doctor doctor) {
        if(doctor.getPwd()!=null&&doctor.getPwd().length()<16){
            doctor.setPwd(MD5Util.MD5(doctor.getPwd()));
        }
        return doctorMapper.update(doctor);
    }

    @Override
    public Doctor select(Doctor doctor) {

        return doctorMapper.select(doctor);
    }

    @Override
    public int add(Doctor doctor) {
        return doctorMapper.add(doctor);
    }
}

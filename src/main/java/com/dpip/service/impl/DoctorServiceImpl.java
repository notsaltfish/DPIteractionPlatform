package com.dpip.service.impl;

import com.dpip.mapper.DoctorMapper;
import com.dpip.po.Doctor;
import com.dpip.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorMapper doctorMapper;

    @Override
    public Doctor login(Doctor doctor) {
        Doctor doctor1 = doctorMapper.select(doctor);

        return doctor1;
    }

    @Override
    public int update(Doctor doctor) {

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
package com.dpip.service;

import com.dpip.po.Doctor;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface DoctorService {
    public Doctor login(Doctor doctor);

    public int  update(Doctor doctor);

   public  Doctor select(Doctor doctor);

    public int add(Doctor doctor);
}

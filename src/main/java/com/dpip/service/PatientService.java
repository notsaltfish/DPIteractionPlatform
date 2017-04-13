package com.dpip.service;

import com.dpip.util.Page;
import com.dpip.po.Patient;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface PatientService {

    public int add(Patient patient);

    public int delete(List<Integer> ids);

    public  int update(Patient patient);

    public List<Patient> select(Page page,Patient patient);


}

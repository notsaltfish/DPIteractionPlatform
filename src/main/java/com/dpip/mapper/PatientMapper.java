package com.dpip.mapper;

import com.dpip.po.Patient;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 患者Mapper
 */
public interface PatientMapper {

    public int add(Patient patient);

    public int delete(List<Integer> ids);

    public  int update(Patient patient);

    public List<Patient> select(Patient patient);

    public int  getCount(Patient patient);

    public int disable(Patient patient);

    public Patient selectById(Patient patient);
}

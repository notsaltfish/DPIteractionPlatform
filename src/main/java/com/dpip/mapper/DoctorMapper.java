package com.dpip.mapper;

import com.dpip.po.Doctor;
import java.util.List;
/**
 * Created by X on 2017/4/4.
 * 医生Mapper
 */
public interface DoctorMapper {

    public Doctor login(Doctor doctor);


   public  int update(Doctor doctor);

   public  Doctor select(Doctor doctor);

   public  List<Doctor> selectList(Doctor Doctor);

    public int  getCount(Doctor Doctor);

    public  int disable(Doctor doctor);

    public int add(Doctor doctor);
}

package com.dpip.service.impl;

import com.dpip.mapper.*;
import com.dpip.po.*;
import com.dpip.service.AdminService;
import com.dpip.util.MD5Util;
import com.dpip.util.Page;
import com.dpip.util.ResponseData;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private DiseaseMapper diseaseMapper;
    @Autowired
    private PatientMapper patientMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private MedicineMapper medicineMapper;

    @Override
    public int update(Admin admin) {
        if(admin.getPwd()!=null&&admin.getPwd().length()<16){
            admin.setPwd(MD5Util.MD5(admin.getPwd()));
        }
        return adminMapper.update(admin);
    }

    @Override
    public List<Admin> select(Admin admin) {
        return adminMapper.select(admin);
    }

    @Override
    public ResponseData selectData(Page page, String type, String name) {

        int pageNum = page.getPage()==0?1:page.getPage();
        int pageSize = page.getPageSize()==0?10:page.getPageSize();
        page.setPage(pageNum);
        page.setPageSize(pageSize);
        PageHelper.startPage(pageNum,pageSize);
        ResponseData dataLists = new ResponseData();
        dataLists.setPage(page);
        List datas = null;
        int totals = 0;
        if (type.equals("department")) {

            Department department = new Department();
            department.setName(name);
            datas = departmentMapper.selectByName(department);
            totals = departmentMapper.getCount(department);
        } else {
            if (type.equals("disease")) {
                Disease disease = new Disease();
                disease.setName(name);
                datas = diseaseMapper.selectByName(disease);
                totals = diseaseMapper.getCount(disease);
            } else if (type.equals("medicine")) {
                Medicine medicine = new Medicine();
                medicine.setMedicineName(name);
                datas = medicineMapper.selectByName(medicine);
                totals = medicineMapper.getCount(medicine);
            } else if (type.equals("patient")) {
                Patient patient = new Patient();
                patient.setName(name);
                datas = patientMapper.select(patient);
                totals = patientMapper.getCount(patient);
            } else if (type.equals("doctor")) {
                Doctor doctor = new Doctor();
                doctor.setName(name);
                datas = doctorMapper.selectList(doctor);
                totals = doctorMapper.getCount(doctor);
            }
        }
        dataLists.setDatas(datas);
        dataLists.setTotal(totals);
        return dataLists;
    }


    @Override
    public int updateData(String type, String id, String name) {
       int i=0;
        if (type.equals("department")) {

            Department department = new Department();
            department.setName(name);
            department.setId(Integer.parseInt(id));
           i =  departmentMapper.update(department);
        } else if (type.equals("disease")) {
                Disease disease = new Disease();
                disease.setName(name);
                disease.setId(Integer.parseInt(id));
                i=diseaseMapper.update(disease);
            } else if (type.equals("medicine")) {
                Medicine medicine = new Medicine();
                medicine.setMedicineName(name);
                medicine.setId(Integer.parseInt(id));
                i=medicineMapper.update(medicine);
            }else if (type.equals("patient")) {
            Patient patient = new Patient();
            if(name!=null&&name.equals("active")){
                patient.setId(Integer.parseInt(id));
                patient.setPwd(MD5Util.MD5("123456"));
                patientMapper.update(patient);
            }else if(name!=null&&name.equals("disable")){
                patient.setId(Integer.parseInt(id));
                patient.setPwd(null);
                patientMapper.disable(patient);
            }

        }else if (type.equals("doctor")) {
            Doctor doctor = new Doctor();
            doctor.setId(Integer.parseInt(id));
            if(name!=null&&name.equals("active")){
                doctor.setPwd(MD5Util.MD5("123456"));
                doctorMapper.update(doctor);
            }else if(name!=null&&name.equals("disable")){
                doctor.setPwd(null);
                doctorMapper.disable(doctor);
            }
        }

        return i;
    }


    @Override
    public int addData(String type, String name) {
        int i=0;
        if (type.equals("department")) {

            Department department = new Department();
            department.setName(name);
            i =  departmentMapper.add(department);
        } else if (type.equals("disease")) {
            Disease disease = new Disease();
            disease.setName(name);
            i =diseaseMapper.add(disease);
        } else if (type.equals("medicine")) {
            Medicine medicine = new Medicine();
            medicine.setMedicineName(name);
           i = medicineMapper.add(medicine);
        }

        return i;
    }

    @Override
    public int delete(String type, Integer id) {
        int i=0;
        if (type.equals("department")) {

            Department department = new Department();
            department.setId(id);
            i =  departmentMapper.delete(department);
        } else if (type.equals("disease")) {
            Disease disease = new Disease();
            disease.setId(id);
            i =diseaseMapper.delete(disease);
        } else if (type.equals("medicine")) {
            Medicine medicine = new Medicine();
            medicine.setId(id);
            i = medicineMapper.delete(medicine);
        }

        return i;
    }
}

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
 * Created by X on 2017/4/4.
 * 管理员的service类
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
    //管理员更新
    public int update(Admin admin) {
        if(admin.getPwd()!=null&&admin.getPwd().length()<16){
            admin.setPwd(MD5Util.MD5(admin.getPwd()));
        }
        return adminMapper.update(admin);
    }

    //管理员查询
    @Override
    public List<Admin> select(Admin admin) {
        return adminMapper.select(admin);
    }

    /**
     *    管理员查询其他的数据 科室 药品 病种 患者 医生等
     *    根据传过来的type类型的不同 查询对应的数据type类型的数据
     */

    @Override
    public ResponseData selectData(Page page, String type, String name) {

        int pageNum = page.getPage()==0?1:page.getPage();
        int pageSize = page.getPageSize()==0?10:page.getPageSize();
        page.setPage(pageNum);
        page.setPageSize(pageSize);
        //进行分页
        PageHelper.startPage(pageNum,pageSize);
        ResponseData dataLists = new ResponseData();
        dataLists.setPage(page);
        List datas = null;
        int totals = 0;
        //当type等于科室 便是查询科室的信息
        if (type.equals("department")) {

            Department department = new Department();
            department.setName(name);
            datas = departmentMapper.selectByName(department);
            totals = departmentMapper.getCount(department);
        } else {//查询病种
            if (type.equals("disease")) {
                Disease disease = new Disease();
                disease.setName(name);
                datas = diseaseMapper.selectByName(disease);
                totals = diseaseMapper.getCount(disease);
            } else if (type.equals("medicine")) {//查询药物
                Medicine medicine = new Medicine();
                medicine.setMedicineName(name);
                datas = medicineMapper.selectByName(medicine);
                totals = medicineMapper.getCount(medicine);
            } else if (type.equals("patient")) {//查询患者
                Patient patient = new Patient();
                patient.setName(name);
                datas = patientMapper.select(patient);
                totals = patientMapper.getCount(patient);
            } else if (type.equals("doctor")) {//查询医生
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

    /**
     * 更新数据 例如药品的名字  科室名字 病种名字等
     * @param type 需要更新的具体数据类型  同上
     * @param id
     * @param name
     * @return
     */
    @Override
    public int updateData(String type, String id, String name) {
       int i=0;
       //当type登于科室则更新科室的信息
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
            //到更新患者的信息时候 只有激活或者冻结两种 所以
            //根据name来判断是激活还是冻结
            //active是激活 disbale是冻结
            //激活则设置默认密码为123456
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
            //医生同病人一样
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


    /**
     * 添加数据 有科室和药品 病种
     * 也是根据type来判断具体添加哪一种数据
     * @param type
     * @param name
     * @return
     */
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

    /**
     * 删除数据 根据type来判断删除哪种数据 然后再根据对应的id删除
     * @param type
     * @param id
     * @return 删除的条数
     */
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

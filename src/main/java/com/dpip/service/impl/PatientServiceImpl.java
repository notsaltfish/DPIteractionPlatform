package com.dpip.service.impl;

import com.dpip.mapper.DiseaseTrackMapper;
import com.dpip.mapper.PatientMapper;
import com.dpip.po.DiseaseTrack;
import com.dpip.util.MD5Util;
import com.dpip.util.Page;
import com.dpip.po.Patient;
import com.dpip.service.PatientService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 患者Service
 */

@Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientMapper patientMapper;
    @Autowired
    private DiseaseTrackMapper  diseaseTrackMapper;

    /**
     * 添加患者 当患者的类型是住院的时候
     * 患者的状态就是住院
     * 当患者的类型是其他的 比如说门诊 则患者状态就是无
     * @param patient
     * @return
     */
    @Override
    public int add(Patient patient) {
        String type = patient.getpType();
        patient.setHpDate(new Date());
        /**
         *   * 患者的状态就是住院
         * 当患者的类型是其他的 比如说门诊 则患者状态就是无
         */
        if(type.equals("住院")){
            patient.setStatus("住院");
        }else{
            patient.setStatus("无");
        }

        /**
         * 添加患者同时也要添加病情跟踪的信息
         * 首次录入的患者也有病情 所以需要添加病情追踪
         */
        patientMapper.add(patient);
        DiseaseTrack diseaseTrack = new DiseaseTrack();
        diseaseTrack.setDate(new Date());
        diseaseTrack.setDescription(patient.getDescription());
        diseaseTrack.setIcdName(patient.getIcdName());
        diseaseTrack.setPatientId(patient.getId());
        diseaseTrackMapper.add(diseaseTrack);


         return 1;
    }

    /**
     * 根据id删除患者
     * @param ids
     * @return
     */
    @Override
    public int delete(List<Integer> ids) {
        return patientMapper.delete(ids);
    }

    /**
     * 更新病人
     *
     * @param patient
     * @return
     */
    @Override
    public int update(Patient patient) {
        Patient p = patientMapper.selectById(patient);
        /**
         * 如果病人的病情描述或者病种变化了 那么就需要添加一条新的
         * 病情跟踪到病情跟踪表格
         */
        if(!p.getIcdCode().equals(patient.getIcdCode())||!p.getDescription().equals(patient.getDescription())){
            DiseaseTrack diseaseTrack = new DiseaseTrack();
            diseaseTrack.setDate(new Date());
            diseaseTrack.setDescription(patient.getDescription());
            diseaseTrack.setIcdName(patient.getIcdName());
            diseaseTrack.setPatientId(patient.getId());
            diseaseTrackMapper.add(diseaseTrack);
        }
        /**
         * 如果密码也变化了就需要重新加密
         */
        if(patient.getPwd()!=null&&patient.getPwd().length()<16){
            patient.setPwd(MD5Util.MD5(patient.getPwd()));
        }
        return patientMapper.update(patient);
    }

    /**
     * 根据分页信息和病人的模糊插叙
     * 查询病人的信息
     * @param page
     * @param patient
     * @return
     */
    @Override
    public List<Patient> select(Page page,Patient patient) {
       //分页
        if(page!=null) {
            PageHelper.startPage(page.getPage(), page.getPageSize());
        }
        //当前台传来的类型是1说明需要查询的是门诊患者
        if(patient.getpType()!=null&&patient.getpType().equals("1")){
            patient.setpType("门诊");
            //如果是2 这说明是需要查询住院
        }else if(patient.getpType()!=null&&patient.getpType().equals("2")){
            patient.setpType("住院");
        }
        //查询患者数据
        List<Patient> list =  patientMapper.select(patient);
        if(page!=null) {
            page.setTotal(patientMapper.getCount(patient));
        }
        return list;
    }

}

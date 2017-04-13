package com.dpip.service.impl;

import com.dpip.mapper.DiseaseTrackMapper;
import com.dpip.mapper.PatientMapper;
import com.dpip.po.DiseaseTrack;
import com.dpip.util.Page;
import com.dpip.po.Patient;
import com.dpip.service.PatientService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientMapper patientMapper;
    @Autowired
    private DiseaseTrackMapper  diseaseTrackMapper;

    @Override
    public int add(Patient patient) {
        String type = patient.getpType();
        patient.setHpDate(new Date());
        if(type.equals("住院")){
            patient.setStatus("住院");
        }else{
            patient.setStatus("无");
        }

        patientMapper.add(patient);
        DiseaseTrack diseaseTrack = new DiseaseTrack();
        diseaseTrack.setDate(new Date());
        diseaseTrack.setDescription(patient.getDescription());
        diseaseTrack.setIcdName(patient.getIcdName());
        diseaseTrack.setPatientId(patient.getId());
        diseaseTrackMapper.add(diseaseTrack);


         return 1;
    }

    @Override
    public int delete(List<Integer> ids) {
        return patientMapper.delete(ids);
    }

    @Override
    public int update(Patient patient) {
        Patient p = patientMapper.selectById(patient);
        if(!p.getIcdCode().equals(patient.getIcdCode())||!p.getDescription().equals(patient.getDescription())){
            DiseaseTrack diseaseTrack = new DiseaseTrack();
            diseaseTrack.setDate(new Date());
            diseaseTrack.setDescription(patient.getDescription());
            diseaseTrack.setIcdName(patient.getIcdName());
            diseaseTrack.setPatientId(patient.getId());
            diseaseTrackMapper.add(diseaseTrack);
        }
        return patientMapper.update(patient);
    }

    @Override
    public List<Patient> select(Page page,Patient patient) {
        if(page!=null) {
            PageHelper.startPage(page.getPage(), page.getPageSize());
        }
        if(patient.getpType()!=null&&patient.getpType().equals("1")){
            patient.setpType("门诊");
        }else if(patient.getpType()!=null&&patient.getpType().equals("2")){
            patient.setpType("住院");
        }
        List<Patient> list =  patientMapper.select(patient);
        if(page!=null) {
            page.setTotal(patientMapper.getCount(patient));
        }
        return list;
    }

}

package com.dpip.service.impl;

import com.dpip.mapper.MedicineMapper;
import com.dpip.po.Medicine;
import com.dpip.util.ResponseData;
import com.dpip.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineMapper medicineMapper;

    @Override
    public ResponseData<Medicine> selectByName(Medicine medicine) {

        List<Medicine> list = medicineMapper.selectByName(medicine);
        ResponseData<Medicine> data = new ResponseData<Medicine>();
        data.setDatas(list);

        return data;
    }
}

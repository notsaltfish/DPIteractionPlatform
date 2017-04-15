package com.dpip.service.impl;

import com.dpip.mapper.MedicineMapper;
import com.dpip.po.Medicine;
import com.dpip.util.ResponseData;
import com.dpip.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 药物service
 */

@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineMapper medicineMapper;

    /**
     * 根据名字模糊查询药物列表数据
     * @param medicine
     * @return
     */
    @Override
    public ResponseData<Medicine> selectByName(Medicine medicine) {

        List<Medicine> list = medicineMapper.selectByName(medicine);
        ResponseData<Medicine> data = new ResponseData<Medicine>();
        data.setDatas(list);

        return data;
    }
}

package com.dpip.service.impl;

import com.dpip.mapper.MedicineHistoryMapper;
import com.dpip.po.MedicineHistory;
import com.dpip.service.MedicineHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class MedicineHistoryServiceImpl implements MedicineHistoryService {

    @Autowired
    private MedicineHistoryMapper medicineHistoryMapper;

    @Override
    public List<MedicineHistory> select(Integer id) {

        return medicineHistoryMapper.select(id);
    }

    @Override
    public int add(MedicineHistory medicineHistory) {
        return medicineHistoryMapper.add(medicineHistory);
    }



}

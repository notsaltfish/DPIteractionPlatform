package com.dpip.service.impl;

import com.dpip.mapper.MedicineHistoryMapper;
import com.dpip.po.Medicine;
import com.dpip.po.MedicineHistory;
import com.dpip.service.MedicineHistoryService;
import com.dpip.util.ResponseData;
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

    @Override
    public int getCount(MedicineHistory medicineHistory) {
        return medicineHistoryMapper.getCount(medicineHistory);
    }

    @Override
    public ResponseData<MedicineHistory> selectAjax(Integer id) {
        ResponseData<MedicineHistory> datas = new ResponseData<MedicineHistory>();
        datas.setDatas(select(id));
        MedicineHistory medicineHistory = new MedicineHistory();
        medicineHistory.setpId(id);
        datas.setTotal(getCount(medicineHistory));
        return datas;
    }
}

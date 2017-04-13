package com.dpip.service;

import com.dpip.po.MedicineHistory;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface MedicineHistoryService {

    public List<MedicineHistory> select(Integer id);

    public int add(MedicineHistory medicineHistory);


}

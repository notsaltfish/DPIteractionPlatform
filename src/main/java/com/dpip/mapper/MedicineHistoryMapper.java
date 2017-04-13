package com.dpip.mapper;

import com.dpip.po.MedicineHistory;
import com.dpip.util.ResponseData;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface MedicineHistoryMapper {


    public List<MedicineHistory> select(Integer id);

    public int add(MedicineHistory medicineHistory);

  public   ResponseData<MedicineHistory> selectByName(MedicineHistory medicineHistory);
}

package com.dpip.service;

import com.dpip.po.Medicine;
import com.dpip.util.ResponseData;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface MedicineService {

    public ResponseData<Medicine> selectByName(Medicine medicine);




}

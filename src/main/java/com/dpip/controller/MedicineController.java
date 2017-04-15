package com.dpip.controller;

import com.dpip.po.Medicine;
import com.dpip.util.ResponseData;
import com.dpip.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by X on 2017/4/4.
 */
@Controller
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    @ResponseBody
    @RequestMapping("/medicine/selectbyname")
    public ResponseData<Medicine> selectByName(Medicine medicine){

        return medicineService.selectByName(medicine);
    }


}

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
 * 管理员管理药种的时候 需要进行查询的controller
 */
@Controller
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    /**
     * 根据名字模糊搜索对应的药品数据
     * 通过ajax返回
     */
    @ResponseBody
    @RequestMapping("/medicine/selectbyname")
    public ResponseData<Medicine> selectByName(Medicine medicine){

        return medicineService.selectByName(medicine);
    }


}

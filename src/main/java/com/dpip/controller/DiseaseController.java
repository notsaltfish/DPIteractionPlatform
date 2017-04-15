package com.dpip.controller;

import com.dpip.po.Disease;
import com.dpip.util.ResponseData;
import com.dpip.service.DiseaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by X on 2017/4/4.
 * 这个Controller是管理员在管理病种的时候
 * 根据名字模糊搜索病种
 */
@Controller
public class DiseaseController {

    @Autowired
    private DiseaseService diseaseService;

    /**
     * 根据名字模糊搜索病种信息
     * @param disease
     * @return 返回对应数据
     */
    @ResponseBody
    @RequestMapping("/disease/selectbyname")
    public ResponseData<Disease> selectByName(Disease disease){

        return diseaseService.selectByName(disease);
    }


}

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
 */
@Controller
public class DiseaseController {

    @Autowired
    private DiseaseService diseaseService;

    @ResponseBody
    @RequestMapping("/disease/selectbyname")
    public ResponseData<Disease> selectByName(Disease disease){

        return diseaseService.selectByName(disease);
    }


}

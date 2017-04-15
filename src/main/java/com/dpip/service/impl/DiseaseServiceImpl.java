package com.dpip.service.impl;

import com.dpip.mapper.DiseaseMapper;
import com.dpip.po.Disease;
import com.dpip.util.ResponseData;
import com.dpip.service.DiseaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by X on 2017/4/5.
 * 病种service类
 */

@Service
public class DiseaseServiceImpl implements DiseaseService{

    @Autowired
    private DiseaseMapper diseaseMapper;

    @Override
    public ResponseData<Disease> selectByName(Disease disease) {
        List<Disease> list = diseaseMapper.selectByName(disease);
        ResponseData<Disease> data = new ResponseData<Disease>();
        data.setDatas(list);

        return data;
    }
}

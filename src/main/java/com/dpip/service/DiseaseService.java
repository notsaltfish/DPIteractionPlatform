package com.dpip.service;

import com.dpip.po.Disease;
import com.dpip.util.ResponseData;

/**
 * Created by X on 2017/4/4.
 */
public interface DiseaseService {

public ResponseData<Disease> selectByName(Disease disease);
}

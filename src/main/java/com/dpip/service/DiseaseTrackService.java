package com.dpip.service;

import com.dpip.po.DiseaseTrack;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface DiseaseTrackService {

    public List<DiseaseTrack> select(DiseaseTrack diseaseTrack);

    public int add(DiseaseTrack diseaseTrack);
}

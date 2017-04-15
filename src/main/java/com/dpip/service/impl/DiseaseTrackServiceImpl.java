package com.dpip.service.impl;

import com.dpip.mapper.DiseaseTrackMapper;
import com.dpip.po.DiseaseTrack;
import com.dpip.service.DiseaseTrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by X on 2017/4/5.
 */

@Service
public class DiseaseTrackServiceImpl implements DiseaseTrackService {

    @Autowired
    private DiseaseTrackMapper diseaseTrackMapper;

    @Override
    public List<DiseaseTrack> select(DiseaseTrack diseaseTrack) {
        return diseaseTrackMapper.select(diseaseTrack);
    }

    @Override
    public int add(DiseaseTrack diseaseTrack) {
        return diseaseTrackMapper.add(diseaseTrack);
    }
}

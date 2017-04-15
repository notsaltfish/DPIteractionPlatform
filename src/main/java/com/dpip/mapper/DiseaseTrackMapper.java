package com.dpip.mapper;

import com.dpip.po.DiseaseTrack;
import com.dpip.po.Patient;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 */
public interface DiseaseTrackMapper {

  public List<DiseaseTrack> select(DiseaseTrack diseaseTrack);

  public int add(DiseaseTrack diseaseTrack);

}

package com.dpip.mapper;

import com.dpip.po.Disease;

import java.util.List;

/**
 * Created by X on 2017/4/5.
 */
public interface DiseaseMapper {
    public List<Disease> selectByName(Disease disease);

    public int  getCount(Disease disease);

    public int update(Disease disease);

    public int  add(Disease disease);

   public  int delete(Disease disease);
}

package com.dpip.mapper;

import com.dpip.po.RandomInterview;
import com.dpip.vo.StatisticValueObject;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 随访Mapper
 */
public interface RandomInterviewMapper {

    public Integer add(RandomInterview randomInterview);

   public  List<RandomInterview> selectRecentMonth();

    public    List<StatisticValueObject> selectInterviewerTaskAmount();

    public  List<StatisticValueObject> selectHpStatistic();
}

package com.dpip.mapper;

import com.dpip.po.RandomInterview;
import com.dpip.vo.StatisticValueObject;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface RandomInterviewMapper {

    public Integer add(RandomInterview randomInterview);

   public  List<RandomInterview> selectRecentMonth();

    public    List<StatisticValueObject> selectInterviewerTaskAmount();

    public  List<StatisticValueObject> selectHpStatistic();
}

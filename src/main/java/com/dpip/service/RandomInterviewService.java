package com.dpip.service;

import com.dpip.po.RandomInterview;
import com.dpip.vo.StatisticObject;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface RandomInterviewService {

    public Integer add(RandomInterview randomInterview);


  public   StatisticObject admireAndCriticismStatistic();

   public  StatisticObject interviewerTaskStatistic();

  public   StatisticObject hpStatistic();
}

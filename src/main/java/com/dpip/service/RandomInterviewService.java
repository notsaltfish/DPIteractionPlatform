package com.dpip.service;

import com.dpip.po.RandomInterview;
import com.dpip.vo.StatisticObject;

/**
 * Created by X on 2017/4/4.
 */
public interface RandomInterviewService {

    public Integer add(RandomInterview randomInterview);


  public   StatisticObject admireAndCriticismStatistic();

   public  StatisticObject interviewerTaskStatistic();

  public   StatisticObject hpStatistic();
}

package com.dpip.service.impl;

import com.dpip.mapper.PatientMapper;
import com.dpip.mapper.RandomInterviewMapper;
import com.dpip.po.*;
import com.dpip.service.RandomInterviewService;
import com.dpip.vo.StatisticObject;
import com.dpip.vo.StatisticValueObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 随访统计service
 */

@Service
public class RandomInterviewServiceImpl implements RandomInterviewService {

    @Autowired
    private RandomInterviewMapper randomInterviewMapper;
    @Autowired
    private PatientMapper patientMapper;

    /**
     * 添加新的访问记录 并且把对应的病人设置成已访问 这样就不会再被
     * 访问
     * @param randomInterview
     * @return
     */
    @Override
    public Integer add(RandomInterview randomInterview) {
        Patient p = new Patient();
        p.setId(randomInterview.getPatientId());
        p.setStatus("已访问");
        patientMapper.update(p);
         return randomInterviewMapper.add(randomInterview);
    }

    /**
     * 查询表扬与批评的数据
     * 发送到前台生成图表
     * @return 返回类型是一个专门用于图表生成的类StatisticObject
     */
    @Override
    public StatisticObject admireAndCriticismStatistic() {
        List<RandomInterview> list = randomInterviewMapper.selectRecentMonth();
        StatisticObject statisticObject = new StatisticObject();
        statisticObject.setTitle("最近一个月医务人员评价统计");
        List<StatisticValueObject> datas = new ArrayList<StatisticValueObject>();
        StatisticValueObject v1  = new StatisticValueObject("1-2分",0d);
        StatisticValueObject v2 = new StatisticValueObject("3-4分",0d);
        StatisticValueObject v3  = new StatisticValueObject("5-6分",0d);
        StatisticValueObject v4  = new StatisticValueObject("7-8分",0d);
        StatisticValueObject v5  = new StatisticValueObject("9-10分",0d);

        //根据分值为对应的数据加1
        for(RandomInterview r:list){

            if(1<=r.getScore()&&r.getScore()<=2){
                v1.setValue(v1.getValue()+1);
            }else if(3<=r.getScore()&&r.getScore()<=4){
                v2.setValue(v2.getValue()+1);
            }else if(5<=r.getScore()&&r.getScore()<=6){
                v3.setValue(v3.getValue()+1);
            }else if(7<=r.getScore()&&r.getScore()<=8){
                v4.setValue(v4.getValue()+1);
            }else if(9<=r.getScore()&&r.getScore()<=10){
                v5.setValue(v5.getValue()+1);
            }
        }
        datas.add(v1);
        datas.add(v2);
        datas.add(v3);
        datas.add(v4);
        datas.add(v5);
        statisticObject.setDatas(datas);
        /*list.forEach(o->{
            if(o.getScore()<=2){
                value = new StatisticValueObject();
            }

        });*/


        return statisticObject;
    }

    /**
     * 随访员工作量的统计
     * 同样是把数据发到前台
     * @return
     */
    @Override
    public StatisticObject interviewerTaskStatistic() {
        List<StatisticValueObject> datas =randomInterviewMapper.selectInterviewerTaskAmount();
        StatisticObject statisticObject = new StatisticObject();
        statisticObject.setDatas(datas);
        statisticObject.setTitle("随访员工作统计");
        return statisticObject;
    }

    /**
     * 近期病人入住的统计
     *
     * @return
     */
    @Override
    public StatisticObject hpStatistic() {
        List<StatisticValueObject> datas = randomInterviewMapper.selectHpStatistic();
        StatisticObject statisticObject = new StatisticObject();
        statisticObject.setDatas(datas);
        statisticObject.setTitle("近期入住病人统计");
        return statisticObject;
    }
}

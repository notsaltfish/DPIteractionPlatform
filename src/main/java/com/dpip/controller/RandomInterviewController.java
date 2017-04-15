package com.dpip.controller;

import com.dpip.po.*;
import com.dpip.service.PatientService;
import com.dpip.service.RandomInterviewService;


import com.dpip.vo.StatisticObject;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;

/**
 * Created by X on 2017/4/4.
 */
@Controller
public class RandomInterviewController {

    @Autowired
    private RandomInterviewService randomInterviewService;
    @Autowired
    private PatientService patientService;


    @RequestMapping("/randominterview/add")
    public String add(RandomInterview randomInterview,String iDate){
        //   这里还需要添加关于采访员的一些信息 到时候将登陆的用户的id拿出来
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        if(iDate!=null){
            try {
                randomInterview.setInterviewDate(simpleDateFormat.parse(iDate));
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        randomInterviewService.add(randomInterview);
        return "redirect:/randominterview/uninter";
    }

    @RequestMapping("/randominterview/toadd")
    public String  toAdd(RandomInterview randomInterview, Model model){
        model.addAttribute("o",randomInterview);
        return "/service/addInterviewRecords.jsp";
    }
    //查看需要随访的出院病人
  /*  @ResponseBody
    @RequestMapping("/randominterview/uninter")
    public ResponseData<Patient> unInter(RandomInterview randomInterview,Model model){
        Patient patient = new Patient();
        patient.setStatus("出院");
        List<Patient> dataList = patientService.select(null,patient);
        model.addAttribute("dataList",dataList);

        return "/service/unInterviewList2.jsp";
    }*/

    @RequestMapping("/randominterview/uninter")
    public String toUnInter(RandomInterview randomInterview,Model model){


        return "/service/unInterviewList.jsp";
    }


    @RequestMapping("/randominterview/statistic")
    public String admireAndCriticismStatistic(Model model){
        StatisticObject object = randomInterviewService.admireAndCriticismStatistic();
        JSONObject object1 =JSONObject.fromObject(object);
        System.out.println("数据输出"+object1.toString());
        model.addAttribute("object",object1);
        return "/service/interviewStatistic.jsp";
    }


    @ResponseBody
    @RequestMapping("/randominterview/taskstatistic")
    public StatisticObject interviewerTaskStatistic(){
            StatisticObject object = randomInterviewService.interviewerTaskStatistic();
        return object;
    }

    @ResponseBody
    @RequestMapping("/randominterview/hpstatistic")
    public StatisticObject hpStatistic(){
        StatisticObject object = randomInterviewService.hpStatistic();
        return object;
    }
}

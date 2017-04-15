package com.dpip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by X on 2017/4/4.
 * 主页的控制controller
 */

@Controller
public class HomeController {


    //主页左边导航页
    @RequestMapping("/home/left")
    public String leftPage(){

        return "/left.jsp";
    }

    //主页顶端页面
    @RequestMapping("/home/top")
    public String topPage(){
        System.out.println("top");
        return "/top.jsp";
    }

    //主页的主要显示页面
    @RequestMapping("/home/main")
    public String mainPage(){

        return "/main.jsp";
    }


}

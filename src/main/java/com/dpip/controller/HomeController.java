package com.dpip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by chenyong on 2017/4/4.
 */

@Controller
public class HomeController {


    @RequestMapping("/home/left")
    public String leftPage(){

        return "/left2.jsp";
    }

    @RequestMapping("/home/top")
    public String topPage(){
        System.out.println("top");
        return "/top.jsp";
    }

    @RequestMapping("/home/main")
    public String mainPage(){
        System.out.println("main");
        return "/main.jsp";
    }


}

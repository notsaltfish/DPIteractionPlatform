package com.dpip.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;

/**
 * Created by X on 2017/4/4.
 */
@JsonSerialize(include= JsonSerialize.Inclusion.NON_NULL)
public class Admin {
    private Integer id;
    private String name;
    private String pwd;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
  /*  id                   INT(10)                        NULL,
    p_name               VARCHAR(20)                    NULL,
    department_id        INT(10)                        NULL,
    p_type               VARCHAR(20)                    NULL,
    doctor_id            INT(10)                        NULL,
    illness_id           INT(10)                        NULL,
    despcription         VARCHAR(1000)                  NULL,
    age                  INT(5)                         NULL,
    sex                  VARCHAR(10)                    NULL*/
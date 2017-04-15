package com.dpip.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;

/**
 * Created by X on 2017/4/4.
 */
@JsonSerialize(include= JsonSerialize.Inclusion.NON_NULL)
public class Patient {
    private Integer id;
    private String name;
    private Integer departmentId;
    private String departmentName;//虚拟字段
    private String pType;//是门诊还是住院
    private Integer doctorId;
    private String icdCode;
    private String icdName;//虚拟字段
    private String description;
    private Integer age;
    private String sex;
    private String phone;
    private String status;//当前的状态
    private Date hpDate; //住院日期
    private String pwd;


    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getIcdName() {
        return icdName;
    }

    public void setIcdName(String icdName) {
        this.icdName = icdName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getHpDate() {
        return hpDate;
    }

    public void setHpDate(Date hpDate) {
        this.hpDate = hpDate;
    }

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

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getpType() {
        return pType;
    }

    public void setpType(String pType) {
        this.pType = pType;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public String getIcdCode() {
        return icdCode;
    }

    public void setIcdCode(String icdCode) {
        this.icdCode = icdCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
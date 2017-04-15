package com.dpip.po;

/**
 * Created by X on 2017/4/4.
 */
public class Doctor {
    private Integer id;
    private String name;
    private Integer departmentId;
    private String pwd;
    private String role;
    private String sex;
    private String title;
    private String introduction;
    private String image;
//添加的虚拟字段
    private String departmentName;

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
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

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
  /*  id                   INT(10)                        NULL,
    d_name               VARCHAR(20)                    NULL,
    department_id        INT(10)                         NULL,
    pwd                  VARCHAR(20)                    NULL,
    role                 VARCHAR(20)                    NULL,
    sex                  VARCHAR(20)                    NULL,
    title                VARCHAR(50)                    NULL,
    introduction         VARCHAR(500)                   NULL,
    image                VARCHAR(500)                   NULL*/
package com.dpip.po;

import java.util.Date;

/**
 * Created by chenyong on 2017/4/7.
 */
public class Medicine {

    private Integer id;
    private String medicineName;//药物名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }
}

package com.dpip.po;

/**
 * Created by chenyong on 2017/4/5.
 */
public class Disease {
    private Integer id;
    private String icdCode;
    private String fzm;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIcdCode() {
        return icdCode;
    }

    public void setIcdCode(String icdCode) {
        this.icdCode = icdCode;
    }

    public String getFzm() {
        return fzm;
    }

    public void setFzm(String fzm) {
        this.fzm = fzm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

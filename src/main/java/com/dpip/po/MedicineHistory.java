package com.dpip.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Created by X on 2017/4/7.
 */
public class MedicineHistory {

    private Integer id;
    private Integer pId;//病人id
    private String medicineName;//药物名称
    private String timeTake;//服药时间
    private  String amountTake;//服用量
    private String timePerDay;//每日服用量
    private Date startDate;//服药起始时间
    private String attention;//注意事项
    private String periodTake;//服用时间长度
    private Integer mId;//药物id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getTimeTake() {
        return timeTake;
    }

    public void setTimeTake(String timeTake) {
        this.timeTake = timeTake;
    }

    public String getAmountTake() {
        return amountTake;
    }

    public void setAmountTake(String amountTake) {
        this.amountTake = amountTake;
    }

    public String getTimePerDay() {
        return timePerDay;
    }

    public void setTimePerDay(String timePerDay) {
        this.timePerDay = timePerDay;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getAttention() {
        return attention;
    }

    public void setAttention(String attention) {
        this.attention = attention;
    }

    public String getPeriodTake() {
        return periodTake;
    }

    public void setPeriodTake(String periodTake) {
        this.periodTake = periodTake;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }
}

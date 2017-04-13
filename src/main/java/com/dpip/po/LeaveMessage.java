package com.dpip.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Created by chenyong on 2017-04-09.
 */
public class LeaveMessage {
    private Integer id;
    private Integer fatherId;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date leaveDate;
    private String content;
    private Integer doctorId;
    private Integer departmentId;
    private Integer patientId;
    private String status;
    private String departmentName;
    private String reply;

    //虚拟的属性 用来查看留言时区分是第几条
    private Integer recordsNum;
    private Integer recordsSize;


    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Integer getRecordsSize() {
        return recordsSize;
    }

    public void setRecordsSize(Integer recordsSize) {
        this.recordsSize = recordsSize;
    }

    public Integer getRecordsNum() {
        return recordsNum;
    }

    public void setRecordsNum(Integer recordsNum) {
        this.recordsNum = recordsNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFatherId() {
        return fatherId;
    }

    public void setFatherId(Integer fatherId) {
        this.fatherId = fatherId;
    }

    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
}

package com.dpip.service;

import com.dpip.po.Comment;
import com.dpip.po.LeaveMessage;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 */
public interface LeaveMessageService {

    public List<LeaveMessage> select(LeaveMessage leaveMessage);
    public Integer add(LeaveMessage leaveMessage);

    public int update(LeaveMessage updateMessage);
}

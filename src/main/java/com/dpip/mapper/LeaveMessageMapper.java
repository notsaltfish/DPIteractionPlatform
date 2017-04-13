package com.dpip.mapper;

import com.dpip.po.Disease;
import com.dpip.po.LeaveMessage;

import java.util.List;

/**
 * Created by chenyong on 2017/4/5.
 */
public interface LeaveMessageMapper {
    public List<LeaveMessage> select(LeaveMessage leaveMessage);
    public Integer add(LeaveMessage leaveMessage);

    public  int update(LeaveMessage updateMessage);
}

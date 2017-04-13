package com.dpip.service.impl;

import com.dpip.mapper.CommentMapper;
import com.dpip.mapper.LeaveMessageMapper;
import com.dpip.po.Comment;
import com.dpip.po.LeaveMessage;
import com.dpip.service.CommentService;
import com.dpip.service.LeaveMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class LeaveMessageServiceImpl implements LeaveMessageService {

    @Autowired
    private LeaveMessageMapper leaveMessageMapper;

    @Override
    public List<LeaveMessage> select(LeaveMessage leaveMessage) {
        if(leaveMessage.getRecordsNum()==null){
            leaveMessage.setRecordsNum(0);
        }if(leaveMessage.getRecordsSize()==null){
            leaveMessage.setRecordsSize(3);
        }
        return leaveMessageMapper.select(leaveMessage);
    }

    @Override
    public Integer add(LeaveMessage leaveMessage) {
        return leaveMessageMapper.add(leaveMessage);
    }

    @Override
    public int update(LeaveMessage updateMessage) {


        return leaveMessageMapper.update(updateMessage);
    }
}

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
 * Created by X on 2017/4/4.
 * 留言service类
 */

@Service
public class LeaveMessageServiceImpl implements LeaveMessageService {

    @Autowired
    private LeaveMessageMapper leaveMessageMapper;

    /**
     * 查询留言
     * @param leaveMessage
     * @return
     */
    @Override
    public List<LeaveMessage> select(LeaveMessage leaveMessage) {
        //这个判断是用来判断是否查的是具体某一条留言还是所有留言
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

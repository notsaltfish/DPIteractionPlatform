package com.dpip.service.impl;

import com.dpip.mapper.CommentMapper;
import com.dpip.po.Comment;
import com.dpip.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> select(Comment comment) {

        return commentMapper.select(comment);
    }

    @Override
    public int add(Comment comment) {

        return commentMapper.add(comment);
    }
}

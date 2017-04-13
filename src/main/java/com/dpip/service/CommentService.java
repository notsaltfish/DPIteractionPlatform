package com.dpip.service;

import com.dpip.po.Comment;
import com.dpip.po.Disease;
import  java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface CommentService {

    public   List<Comment> select(Comment comment);

    public int add(Comment comment);
}

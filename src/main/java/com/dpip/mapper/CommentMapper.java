package com.dpip.mapper;

import com.dpip.po.Comment;
import com.dpip.po.Medicine;

import java.util.List;

/**
 * Created by chenyong on 2017/4/4.
 */
public interface CommentMapper {

  public   List<Comment> select(Comment comment);

  public int add(Comment comment);
}

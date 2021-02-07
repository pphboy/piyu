package com.pipihao.piyu.service;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.Comment;

import java.util.List;
import java.util.Map;

/**
 * 评论Mapper
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/1 14:49
 */
public interface CommentService  {

    /**
     * 添加皮论
     * @param comment
     * @return
     */
    StateResult sendComment(Comment comment,String token);

    /**
     * 查询当前皮物下所有的皮论
     * @param  piPage
     * @return
     */
    StateResult findCommentsByPiId(PiPage piPage);

    /**
     * 点赞和踩
     * @param map
     * @return
     */
    StateResult commentLike(Map<String, Object> map,String token);

    /**
     * 获取最新的皮论
     * @return
     */
    StateResult findNewComments();
}

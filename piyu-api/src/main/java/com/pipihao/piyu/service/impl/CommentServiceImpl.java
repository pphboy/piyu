package com.pipihao.piyu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.CommentMapper;
import com.pipihao.piyu.pojo.Comment;
import com.pipihao.piyu.service.CommentService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/1 15:05
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 添加皮论
     * @param comment
     * @return
     */
    @Override
    public StateResult sendComment(Comment comment,String token) {
        comment.setUserId(Integer.parseInt(JWTUtils.getValue("userId",token)));
        return StateResult.getExample(this.commentMapper.sendComment(comment),"添加皮论成功","添加皮论失败",null);
    }

    /**
     * 查询当前皮物所有的皮论
     * @param piPage
     * @return
     */
    @Override
    public StateResult findCommentsByPiId(PiPage piPage) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<Comment> comms= this.commentMapper.findCommentsByPiId(piPage.getPid());
        PageInfo pageInfo = new PageInfo(comms);
        return StateResult.getExample(comms,"获取皮论成功","当前PID无皮论",pageInfo);
    }

    @Override
    public StateResult commentLike(Map<String, Object> map, String token) {
        /*判断是否在这个评论点过赞了，点过了赞或踩则返回false*/
        Integer userId = Integer.parseInt(JWTUtils.getValue("userId", token));
        boolean like = this.commentMapper.haveLikeInThisCid((Integer)map.get("cid"),userId);
        if(like){
            //已点赞
            return StateResult.getExample(false,"一个评论只允许，点赞或踩一次，且不可逆",null);
        }else{
            //未点赞
            map.put("userId",userId);
            return StateResult.getExample(this.commentMapper.sendCommentLike(map),"点赞成功","点赞失败",null);
        }
    }

    /**
     * 获取最新皮论
     * @return
     */
    @Override
    public StateResult findNewComments() {
        List<Comment> newComments = this.commentMapper.findNewComments();
        return StateResult.getExample(newComments,"获取成功","获取失败，可能没有最新评论",newComments);
    }
}

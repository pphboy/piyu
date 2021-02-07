package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.Comment;
import com.pipihao.piyu.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/1 16:41
 */
@RestController
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 评论点赞，踩
     * @return
     */
    @PostMapping("like")
    public StateResult commentLike(@RequestBody Map<String,Object> map,HttpServletRequest request){
        return this.commentService.commentLike(map,request.getHeader("token"));
    }
    /**
     * 分页获取 当前皮物的评论
     * @return
     */
    @PostMapping("pi")
    public StateResult getCommentsByPid(@RequestBody PiPage piPage){
        return this.commentService.findCommentsByPiId(piPage);
    }

    /**
     * 添加皮论
     * @param comment
     * @param request
     * @return
     */
    @PutMapping
    public StateResult sendComment(@RequestBody Comment comment, HttpServletRequest request){
        return this.commentService.sendComment(comment,request.getHeader("token"));
    }


    /**
     * 获取首页最新的皮论
     * @return
     */
    @GetMapping("/index")
    public StateResult findNewComment(){
        return this.commentService.findNewComments();
    }
}

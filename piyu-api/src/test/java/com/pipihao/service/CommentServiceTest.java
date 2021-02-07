package com.pipihao.service;

import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.pojo.Comment;
import com.pipihao.piyu.service.CommentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class CommentServiceTest {

    @Autowired
    CommentService commentService;

    private String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTIzMTkwNDUsInVzZXJJZCI6IjEwMDA2IiwidXNlcm5hbWUiOiJwaXBpaGFvIn0.UgkSH3U4AizCvjS2esmlCP8089Jwaf8tednOcCcrWb4";

    @Test
    public void testSend(){
        Comment comment = new Comment();
        comment.setContent("测试评论");
        comment.setPiId("72736c93f5174562");
        for (int i = 0; i<30;i++){
            System.out.println(commentService.sendComment(comment,token));
        }
    }

    @Test
    public void findComment(){
        System.out.println(commentService.findCommentsByPiId(new PiPage().setPage(1).setSize(10).setPid("72736c93f5174562")));
    }
}

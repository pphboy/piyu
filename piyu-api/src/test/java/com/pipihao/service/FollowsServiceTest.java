package com.pipihao.service;

import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.pojo.Follows;
import com.pipihao.piyu.service.FollowsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/5 12:31
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class FollowsServiceTest {
    @Autowired
    private FollowsService followsService;

    private String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTI5MzQ3MjgsInVzZXJJZCI6IjEwMDA2IiwidXNlcm5hbWUiOiJwaXBpaGFvIn0.efcvgIjsvAcXXBkaFzyZRkTipCxQoLslOiToXZ7Z8qs";

    @Test
    public void testSendFollow(){
        System.out.println(this.followsService.sendFollowers(new Follows().setUsername("test123"),token));
    }

    @Test
    public void testGetFans(){
        System.out.println(this.followsService.findFollowers(10006));
    }


}

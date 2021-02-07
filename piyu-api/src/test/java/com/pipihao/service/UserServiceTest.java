package com.pipihao.service;

import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class UserServiceTest {

    @Autowired
    UserService userService;

    /**
     * 测试注册
     */
    @Test
    public void testRegister(){
        User user = new User();
        user.setUsername("小皮");
        user.setPassword("123456");
        user.setEmail("22920@qq.com");
        System.out.println(userService.registerUser(user));
    }
}

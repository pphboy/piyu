package com.pipihao.service;

import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.LoginService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class LoginServiceTest {

    @Autowired
    LoginService loginService;

    @Test
    public void testLogin(){
        User user = new User();
        user.setUsername("小皮");
        user.setPassword("123456");
        System.out.println(loginService.login(user,"0.0.0.0"));
    }
}

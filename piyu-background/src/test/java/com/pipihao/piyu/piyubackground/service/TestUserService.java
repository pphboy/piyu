package com.pipihao.piyu.piyubackground.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.PiyuBackgroundApplication;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/21 11:03
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiyuBackgroundApplication.class)
public class TestUserService {

    @Autowired
    private UserService userService;

    @Test
    public void testFindAdmin(){
        System.out.println(userService.getAdministrators(new Page<IUser>().setCurrent(2).setSize(3),new HashMap<String,Object>()));
    }

}

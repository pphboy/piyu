package com.pipihao.piyu.piyubackground.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.PiyuBackgroundApplication;
import com.pipihao.piyu.piyubackground.pojo.IRole;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

    @Test
    public void testPutAdmin(){
        IUser iUser = new IUser();
        iUser.setUsername("ppx");
        iUser.setPassword("123123");
        List<IRole> list = new ArrayList<>();
        list.add(new IRole().setId(1));
        list.add(new IRole().setId(2));
        iUser.setEmail("xxx@qq.com");
        iUser.setRoleList(list);
        userService.putAdmin(iUser);
    }

}

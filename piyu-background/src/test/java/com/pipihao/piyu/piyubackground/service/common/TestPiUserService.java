package com.pipihao.piyu.piyubackground.service.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.PiyuBackgroundApplication;
import com.pipihao.piyu.piyubackground.pojo.PUser;
import com.pipihao.piyu.pojo.User;
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
 * @date 2021/2/23 11:18
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiyuBackgroundApplication.class)
public class TestPiUserService {

    @Autowired
    private PiUserService piUserService;

    @Test
    public void testFindAllByPage(){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("keywords", null);
        System.out.println(
                piUserService.getUserListBySearch(new Page<PUser>(2,3), map
                )
        );
    }
}

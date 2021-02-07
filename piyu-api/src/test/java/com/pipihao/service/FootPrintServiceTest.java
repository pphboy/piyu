package com.pipihao.service;

import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.mapper.FootPrintMapper;
import com.pipihao.piyu.pojo.FootPrint;
import com.pipihao.piyu.service.FootPrintService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 18:16
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class FootPrintServiceTest {

    @Autowired
    FootPrintService footPrintService;

    private String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTIzMTkwNDUsInVzZXJJZCI6IjEwMDA2IiwidXNlcm5hbWUiOiJwaXBpaGFvIn0.UgkSH3U4AizCvjS2esmlCP8089Jwaf8tednOcCcrWb4";

    @Test
    public void testSend(){
        FootPrint fp = new FootPrint();
        fp.setPiProductId("c5f336a644184170");
        System.out.println(footPrintService.sendFootPrint(fp,token));;
    }
}

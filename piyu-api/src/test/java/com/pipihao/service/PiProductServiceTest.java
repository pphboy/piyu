package com.pipihao.service;

import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.pojo.PiProduct;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.LoginService;
import com.pipihao.piyu.service.PiProductService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class PiProductServiceTest {

    @Autowired
    PiProductService piProductService;

    private String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTIzMTkwNDUsInVzZXJJZCI6IjEwMDA2IiwidXNlcm5hbWUiOiJwaXBpaGFvIn0.UgkSH3U4AizCvjS2esmlCP8089Jwaf8tednOcCcrWb4";

    @Test
    public void testSend(){
        PiProduct piProduct = new PiProduct();
        piProduct.setUserId(10006);
        piProduct.setAddress("湖北");
        piProduct.setClassId(1);
        piProduct.setContent("TEST");
        piProduct.setTitle("TITLE");
        piProduct.setPrice(BigDecimal.valueOf(9999));
//        System.out.println(this.piProductService.sendPiProduct(piProduct));;
    }

    @Test
    public void testFind(){
//        System.out.println(this.piProductService.findPiProductByUserId(10006));
    }

    @Test
    public void findUserPiProduct(){
        PiPage piPage = new PiPage();
        System.out.println(piProductService.findPiProductByUserId(piPage, token));
    }
}

package com.pipihao.utils;

import com.pipihao.piyu.utils.VerifyCode;
import org.junit.Test;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

public class VerifyCodeTest {
    @Test
    public void fun() throws FileNotFoundException, IOException {
        VerifyCode verifyCode = new VerifyCode();
        BufferedImage bi = verifyCode.getImage();// 随机的
        System.out.println(verifyCode.getText());// 打印图片上的文本内容
        String uuid = UUID.randomUUID().toString().replace("-","").substring(20);
        VerifyCode.output(bi, new FileOutputStream("C:\\Users\\pipihao\\Desktop\\verifyCode\\"+uuid+".jpg"));
    }
}

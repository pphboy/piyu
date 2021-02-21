package com.pipihao.piyu.piyubackground;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.pipihao.piyu.piyubackground.mapper")
public class PiyuBackgroundApplication {

    public static void main(String[] args) {
        SpringApplication.run(PiyuBackgroundApplication.class, args);
    }

}

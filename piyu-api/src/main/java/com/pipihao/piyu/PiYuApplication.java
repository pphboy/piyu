package com.pipihao.piyu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.pipihao.piyu.mapper")
public class PiYuApplication {

    public static void main(String[] args) {
        SpringApplication.run(PiYuApplication.class,args);
    }

}

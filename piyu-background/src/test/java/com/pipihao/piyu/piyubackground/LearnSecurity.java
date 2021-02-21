package com.pipihao.piyu.piyubackground;

import org.junit.jupiter.api.Test;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/7 21:44
 */

public class LearnSecurity {

    @Test
    public void testUser(){
        User.UserBuilder users = User.withDefaultPasswordEncoder();
        User user = (User) users.username("user").password("password").roles("USER").build();
        System.out.println(user.getPassword());
    }

    @Test
    public void testArgon2(){
        SCryptPasswordEncoder encoder = new SCryptPasswordEncoder();
        String result = encoder.encode("123123");
        System.out.println(result);
        System.out.println(encoder.matches("123123", result));
    }
}

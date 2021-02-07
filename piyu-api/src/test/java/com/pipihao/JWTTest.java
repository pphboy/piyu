package com.pipihao;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.pipihao.piyu.utils.JWTUtils;
import org.junit.Test;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class JWTTest {

    @Test
    public void testUtils(){
        DecodedJWT decodedJWT = JWTUtils.verifyToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTE1NjE2MjksInVzZXJJZCI6IjEwMDAwIiwidXNlcm5hbWUiOiLlsI_nmq4ifQ.Mwvn_4e-DMwZ4EIWyzAb3PfslUG3bBZRITwe57Zdm-0");
        System.out.println("username : "+decodedJWT.getClaim("username").asString());
        System.out.println("userId : "+decodedJWT.getClaim("userId").asString());
    }

    @Test
    public void testJWT(){
        Calendar instance = Calendar.getInstance();
        instance.add(Calendar.SECOND,60);

        Map<String,Object> map = new HashMap<>();

        map.put("usernmae","小皮");
        map.put("userId",1);

/*
        map.forEach((k,v)->{
            builder.wi
        });
*/
        String token = JWT.create()
                .withClaim("username","小皮")
                .withClaim("userId",12)
                .withExpiresAt(instance.getTime()) //配置过期时间
                .sign(Algorithm.HMAC256("123ASDF@_+_iajskdlfj/.,m,.p[];")); // 令牌
        System.out.println(token);
    }

    @Test
    public void verifyJwtToken(){
        JWTVerifier jwtVerifier= JWT.require(Algorithm.HMAC256("123ASDF@_+_iajskdlfj/.,m,.p[];")).build();

        DecodedJWT verify = jwtVerifier.verify("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTA5Mzk0NTYsInVzZXJJZCI6MTIsInVzZXJuYW1lIjoi5bCP55quIn0.V3DzqJDWAkuLuKu83g59YYToRgINowrSf8IgXUtxOjY");

        // TokenExpiredException 说明 token已经过期了
        System.out.println(verify.getClaim("username").asString());
        System.out.println(verify.getClaim("userId").asInt());

    }

    @Test
    public void testtoken(){
        DecodedJWT decodedJWT = JWTUtils.verifyToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTIzMjM5NTQsInVzZXJJZCI6IjEwMDA2IiwidXNlcm5hbWUiOiJwaXBpaGFvIn0.AzbF3M2p-z6Xx9HmV1QtLaSo5oHWQ7MMs2FzA8wTlAc");
        System.out.println(decodedJWT.getClaim("username").asString());
        System.out.println(decodedJWT.getClaim("userId").asString());
    }
}

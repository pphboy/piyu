package com.pipihao.piyu.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Calendar;
import java.util.Map;

public class JWTUtils<T> {

    private static final String SIGN_KEY = "!A@ASJKSDL:AS@)I(*842309123',.";

    /**
     * 生成token header.payload.sing
     * @param map
     * @return
     */
    public static String getToken(Map<String,String> map){
        Calendar instance = Calendar.getInstance(); // Calendar是日历
        instance.add(Calendar.DATE,7); // 过期时间为 7
        // 创建jwt Builder
        JWTCreator.Builder builder = JWT.create();
        // payload,把map放到载荷，也就是把map放到有效信息的地方
        map.forEach((k,v)->{
            builder.withClaim(k,v);
        });
        return builder.withExpiresAt(instance.getTime()) //设置token时间
                .sign(Algorithm.HMAC256(SIGN_KEY));
    }

    /**
     * 验证token是否合法我是中国人
     * @param token
     * @return
     */
    public static DecodedJWT verifyToken(String token){
        return JWT.require(Algorithm.HMAC256(SIGN_KEY)).build().verify(token);
    }

    /**
     * 获取token的值
     * @param key
     * @param token
     * @return
     */
    public static String getValue(String key,String token){
       return JWTUtils.verifyToken(token).getClaim(key).asString();
    }

}

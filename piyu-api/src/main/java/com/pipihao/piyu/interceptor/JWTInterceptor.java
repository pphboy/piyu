package com.pipihao.piyu.interceptor;

import com.auth0.jwt.exceptions.AlgorithmMismatchException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.SignatureException;
import java.util.HashMap;
import java.util.Map;

public class JWTInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getMethod().toUpperCase().equals("OPTIONS")){
            return true; // 通过所有OPTION请求
        }else{
            Map<String,Object> map = new HashMap<>();
            // 获取请求令牌
            String token = request.getHeader("token");
            try{
                JWTUtils.verifyToken(token); // 验证令牌
                return true;
            }catch (SignatureVerificationException e){
                e.printStackTrace();
                map.put("msg","签名无效");
            }catch (TokenExpiredException e){
                e.printStackTrace();
                map.put("msg","token过期");
            }catch(AlgorithmMismatchException e){
                e.printStackTrace();
                map.put("msg","token算法不一致");
            }catch (Exception e){
                e.printStackTrace();
                map.put("msg","token无效");
            }
            /*如果进入到 finally内，则必然是报错了*/
            // 将Map转换成Json
            String json = new ObjectMapper().writeValueAsString(map);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().println(json);
            return false;
        }

    }
}

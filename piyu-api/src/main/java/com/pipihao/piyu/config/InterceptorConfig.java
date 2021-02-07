package com.pipihao.piyu.config;

import com.pipihao.piyu.interceptor.JWTInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    /**
     * 解决跨域
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "DELETE", "PUT")
                .maxAge(3600);
    }

    /**
     * 拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new JWTInterceptor())
                .addPathPatterns("/**") //拦截的接口，（理论上是所有的都拦截了）
                .excludePathPatterns(
                        "/login",
                        "/user/register",
                        "/user/index", //个人主页信息
                        "/user/product", //个人主页皮物
                        "/user/article", //个人主页皮帖
                        "/product/get",
                        "/product/index",
                        "/product/article",
                        "/product/index/article",
                        "/file/upload",
                        "/comment/pi",
                        "/comment/index", //首页的皮皮论
                        "/class/all", //所有分类
                        "/follows/followers", //查询粉丝列表
                        "/trade/log",//获取皮志
                        "/trade/log/date" //根据日期获取皮志
                ); // 不拦截的链接前端得加上“/”
    }

}

package com.pipihao.piyu.piyubackground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 11:38
 */
@Controller
public class LoginController {

    /**
     * 登录界面
     * @return
     */
    @GetMapping("/login")
    public String login(){
        return "login";
    }
}

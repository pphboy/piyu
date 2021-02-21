package com.pipihao.piyu.piyubackground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 15:04
 */
@Controller
public class IndexController {

    /**
     * 登录后的首页
     * @return
     */
    @GetMapping({"/index","/"})
    public String index(){
        return "index";
    }

    /**
     * WelCome界面
     */
    @GetMapping("welcome")
    public String welcome(){
        return "welcome";
    }
}

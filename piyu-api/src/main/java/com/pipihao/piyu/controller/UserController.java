package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.PiProduct;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.PiProductService;
import com.pipihao.piyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * update : 2021年02月05日
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PiProductService piProductService;

    /**
     * 获取用户个人空间的信息
     * @return
     */
    @GetMapping("index")
    public StateResult getUserSpaceInfo(@RequestParam("username")String username,HttpServletRequest request){
        return this.userService.getUserSpaceInfo(username,request.getHeader("token"));
    }

    @PutMapping("register")
    public StateResult registerUser(@RequestBody User user){
        return userService.registerUser(user);
    }


    /**
     * POST协议设置详情，GET协议获取详情
     * @param user
     * @return
     */
    @PostMapping("info")
    public StateResult setUserInfo(@RequestBody User user, HttpServletRequest request){
        return this.userService.setUserInfo(user,request.getHeader("token"));
    }

    /**
     * 获取用户详情
     * @param request
     * @return
     */
    @GetMapping("info")
    public StateResult getUserInfo(HttpServletRequest request){
        return this.userService.getUserInfo(request);
    }

    /**
     * 获取用户主页的皮物
     * @param piPage
     * @return
     */
    @PostMapping("product")
    public StateResult getUserSpacePiProduct(@RequestBody PiPage piPage){
        return this.piProductService.findUserSpacePiProduct(piPage);
    }

    @PostMapping("article")
    public StateResult getUserSpacePiArticle(@RequestBody PiPage piPage){
        return this.piProductService.findUserSpacePiArticle(piPage);
    }
}

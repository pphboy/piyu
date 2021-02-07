package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.Follows;
import com.pipihao.piyu.service.FollowsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/5 15:09
 */
@RestController
@RequestMapping("follows")
public class FollowsController {

    @Autowired
    private FollowsService followsService;

    @PutMapping
    public StateResult sendFollows(@RequestBody Follows follows, HttpServletRequest request){
        return this.followsService.sendFollowers(follows,request.getHeader("token"));
    }

    @PostMapping
    public StateResult findFollowers(@RequestBody PiPage piPage){
        return null;
    }

    /**
     * 查询粉丝
     * @param piPage
     * @param request
     * @return
     */
    @PostMapping("/followers")
    public StateResult getFollowersByPage(@RequestBody PiPage piPage,HttpServletRequest request){
        return this.followsService.getFollowersByUserId(piPage,request.getHeader("token"));
    }

    /**
     * 查看关注
     * @param piPage
     * @param request
     * @return
     */
    @PostMapping("/following")
    public StateResult getFollowingByPage(@RequestBody PiPage piPage,HttpServletRequest request){
        return this.followsService.getFollowingByUserId(piPage,request.getHeader("token"));
    }

}

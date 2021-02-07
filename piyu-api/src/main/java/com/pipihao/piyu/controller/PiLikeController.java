package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.PiLike;
import com.pipihao.piyu.service.PiLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/4 8:46
 */
@RestController
@RequestMapping("like")
public class PiLikeController {

    @Autowired
    private PiLikeService piLikeService;

    @PostMapping
    public StateResult sendPiLike(@RequestBody PiLike piLike, HttpServletRequest request){
        return this.piLikeService.sendPiLike(piLike,request.getHeader("token"));
    }

}

package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.PiCollect;
import com.pipihao.piyu.service.PiCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/4 9:31
 */
@RestController
@RequestMapping("collect")
public class PiCollectController {

    @Autowired
    private PiCollectService piCollectService;

    @PostMapping
    public StateResult sendCollectPiThing(@RequestBody PiCollect piCollect, HttpServletRequest request){
        return this.piCollectService.sendPiCollect(piCollect,request.getHeader("token"));
    }

    /**
     * 获取我的收藏
     * @param piPage
     * @param request
     * @return
     */
    @PostMapping("user")
    public StateResult getCollectPiProducts(@RequestBody PiPage piPage,HttpServletRequest request){
        return this.piCollectService.findCollectPiProductByPage(piPage,request.getHeader("token"));
    }
}

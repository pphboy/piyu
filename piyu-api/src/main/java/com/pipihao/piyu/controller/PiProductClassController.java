package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.service.PiProductClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("class")
public class PiProductClassController {

    @Autowired
    private PiProductClassService piProductClassService;

    /**
     * 获取所有分类
     * @return
     */
    @PostMapping("all")
    public StateResult findAllPiProductClass(){
        return this.piProductClassService.findAllPiProductClass();
    }
}

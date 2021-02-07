package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.FootPrint;
import com.pipihao.piyu.service.FootPrintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 17:50
 */
@RestController
@RequestMapping("footprint")
public class FootPrintController {

    @Autowired
    private FootPrintService footPrintService;

    @PutMapping
    public StateResult sendFootPrint(@RequestBody FootPrint footPrint, HttpServletRequest request){
        return this.footPrintService.sendFootPrint(footPrint,request.getHeader("token"));
    }

    @PostMapping
    public StateResult findFootPrint(@RequestBody PiPage piPage,HttpServletRequest request){
        return this.footPrintService.findFootPrintByUserId(piPage,request.getHeader("token"));
    }
}

package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.PiProduct;
import com.pipihao.piyu.pojo.Trading;
import com.pipihao.piyu.service.TradingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 交易类
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 11:02
 */
@RestController
@RequestMapping("trade")
public class TradingController {

    @Autowired
    private TradingService tradingService;

    /**
     * 支付接口
     * @param trading
     * @param request
     * @return
     */
    @PutMapping
    public StateResult tradingPiProduct(@RequestBody Trading trading, HttpServletRequest request){
        return this.tradingService.piProductTrade(trading,request.getHeader("token"));
    }

    /**
     * 获取交易记录
     * @param piPage
     * @param request
     * @return
     */
    @PostMapping
    public StateResult tradingHistory(@RequestBody PiPage piPage,HttpServletRequest request){
        return this.tradingService.findTradingHistory(piPage,request.getHeader("token"));
    }


    /**
     * 获取皮志
     * @return
     */
    @GetMapping("log")
    public StateResult findUserPayLog(@RequestParam("username") String username){
        return this.tradingService.findUserPayLog(username);
    }

    /**
     * 获取皮志详情
     * @param username
     * @return
     */
    @GetMapping("log/date")
    public StateResult findUserPayLogByDate(@RequestParam("date") String date,@RequestParam("username") String username){
        return this.tradingService.findUserRealPayLog(date,username);
    }
}

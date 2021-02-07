package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("wallet")
public class WalletController {

    @Autowired
    private WalletService walletService;

    /**
     * 获取当前用户钱包
     * @param request
     * @return
     */
    @PostMapping("get")
    public StateResult findWallet(HttpServletRequest request){
        return walletService.findWallet(request);
    }

}

package com.pipihao.piyu.service;

import com.pipihao.piyu.common.StateResult;

import javax.servlet.http.HttpServletRequest;

public interface WalletService {
    /**
     * 获取用户钱包
     * @param request
     * @return
     */
    public StateResult findWallet(HttpServletRequest request);
}

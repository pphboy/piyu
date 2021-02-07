package com.pipihao.piyu.service.impl;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.WalletMapper;
import com.pipihao.piyu.pojo.Wallet;
import com.pipihao.piyu.service.WalletService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class WalletServiceImpl implements WalletService {

    @Autowired
    private WalletMapper walletMapper;

    /**
     * 获取用户钱包
     * @param request
     * @return
     */
    @Override
    public StateResult findWallet(HttpServletRequest request) {
        Wallet wallet= walletMapper.findWalletByUserId(Integer.parseInt(JWTUtils.verifyToken(request.getHeader("token")).getClaim("userId").asString()));
        if(wallet != null){
            return StateResult.getExample(true,"获取钱包成功",wallet);
        }else{
            return StateResult.getExample(false,"无钱包，请联系管理员，开通钱包",null);
        }
    }
}

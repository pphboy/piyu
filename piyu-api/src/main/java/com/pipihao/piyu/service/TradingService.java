package com.pipihao.piyu.service;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.Trading;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 11:03
 */
public interface TradingService {

    /**
     * 交易
     * @param trading
     * @param token
     * @return
     */
    StateResult piProductTrade(Trading trading,String token);

    /**
     * 分页查询交易记录
     * @param token
     * @return
     */
    StateResult findTradingHistory(PiPage piPage,String token);


    /**
     * 获取皮志时间
     * @param username
     * @return
     */
    StateResult findUserPayLog(String username);

    /**
     * 获取详情的皮志
     * @return
     */
    StateResult findUserRealPayLog(String date,String username);
}

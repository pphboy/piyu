package com.pipihao.piyu.service;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.FootPrint;


/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 17:27
 */
public interface FootPrintService {

    /**
     * 新增足迹
     * @param footPrint
     * @return
     */
    StateResult sendFootPrint(FootPrint footPrint, String token);

    /**
     * 获取最新的足迹
     * @param piPage
     * @param token
     * @return
     */
    StateResult findFootPrintByUserId(PiPage piPage,String token);
}

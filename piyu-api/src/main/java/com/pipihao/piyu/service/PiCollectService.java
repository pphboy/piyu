package com.pipihao.piyu.service;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.PiCollect;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 20:02
 */
public interface PiCollectService {


    StateResult sendPiCollect(PiCollect piCollect,String token);

    /**
     * 查询收藏的皮物
     * @param piPage
     * @param token
     * @return
     */
    StateResult findCollectPiProductByPage(PiPage piPage,String token);

}

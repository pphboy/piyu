package com.pipihao.piyu.service;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.PiLike;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 20:02
 */
public interface PiLikeService {

    StateResult sendPiLike(PiLike piLike,String token);


}

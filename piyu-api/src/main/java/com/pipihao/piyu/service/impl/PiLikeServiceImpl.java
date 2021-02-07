package com.pipihao.piyu.service.impl;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.PiLikeMapper;
import com.pipihao.piyu.pojo.PiCollect;
import com.pipihao.piyu.pojo.PiLike;
import com.pipihao.piyu.service.PiCollectService;
import com.pipihao.piyu.service.PiLikeService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 20:02
 */
@Service
public class PiLikeServiceImpl implements PiLikeService {

    @Autowired
    private PiLikeMapper piLikeMapper;

    /**
     * 点赞没有撤消操作
     * @param piLike
     * @param token
     * @return
     */
    @Override
    public StateResult sendPiLike(PiLike piLike, String token) {
        piLike.setUserId(Integer.parseInt(JWTUtils.getValue("userId",token)));
        /*先查询是否有记录*/
        if(this.piLikeMapper.selectPiLike(piLike)) return StateResult.getExample(false,"已点赞了，无法再次点赞",null);
        /*若无记录，则添加*/
        else return StateResult.getExample(this.piLikeMapper.sendPiLike(piLike),"点赞成功","点赞失败",null);

    }
}

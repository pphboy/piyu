package com.pipihao.piyu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.PiCollectMapper;
import com.pipihao.piyu.mapper.PiProductMapper;
import com.pipihao.piyu.pojo.PiCollect;
import com.pipihao.piyu.pojo.PiProduct;
import com.pipihao.piyu.service.PiCollectService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 20:02
 */
@Service
public class PiCollectServiceImpl implements PiCollectService {

    @Autowired
    private PiCollectMapper piCollectMapper;

    @Autowired
    private PiProductMapper piProductMapper;

    @Override
    public StateResult sendPiCollect(PiCollect piCollect, String token) {
        piCollect.setUserId(Integer.parseInt(JWTUtils.getValue("userId",token)));
        /*先查询是否有记录*/
        if(this.piCollectMapper.selectPiCollect(piCollect)) return StateResult.getExample(piCollectMapper.deletePiCollect(piCollect),"删除收藏成功","删除收藏失败",true,false);
        /*若无记录，则添加*/
        else return StateResult.getExample(this.piCollectMapper.sendPiCollect(piCollect),"收藏成功","收藏失败",null);
    }

    /**
     * 分页查询当前用户的收藏的皮物<br>
     * 这个皮物的createDate是收藏的时间
     * @param piPage
     * @param token
     * @return
     */
    @Override
    public StateResult findCollectPiProductByPage(PiPage piPage, String token) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<PiProduct> piProducts = this.piProductMapper.findCollectPiProductByUserId(piPage.getKeywords(),Integer.parseInt(JWTUtils.getValue("userId", token)));
        return StateResult.getExample(piProducts,"获取收藏皮物成功","获取收藏皮物失败",new PageInfo(piProducts),null);
    }

}

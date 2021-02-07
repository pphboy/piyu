package com.pipihao.piyu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.FootPrintMapper;
import com.pipihao.piyu.pojo.FootPrint;
import com.pipihao.piyu.service.FootPrintService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 17:27
 */
@Service
public class FootPrintServiceImpl implements FootPrintService {

    @Autowired
    private FootPrintMapper footPrintMapper;

    /**
     * 新增足迹
     * @param footPrint
     * @param token
     * @return
     */
    @Override
    public StateResult sendFootPrint(FootPrint footPrint, String token){
        footPrint.setUserId(Integer.parseInt(JWTUtils.getValue("userId",token)));
        //删除足迹
        this.footPrintMapper.deleteFootPrint(footPrint);
        if(!this.footPrintMapper.sendFootPrint(footPrint)) return StateResult.getExample(false,"加入足迹失败",null);
        return StateResult.getExample(true,"加入足迹成功",null);
    }

    /**
     * 获取最新的足迹
     * @param piPage
     * @param token
     * @return
     */
    @Override
    public StateResult findFootPrintByUserId(PiPage piPage, String token) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<FootPrint> footPrints= this.footPrintMapper.findFootPrintByUserId(Integer.parseInt(JWTUtils.getValue("userId", token)));
        PageInfo pageInfo=new PageInfo(footPrints);
        return StateResult.getExample(footPrints,"获取足迹成功","获取足迹失败",pageInfo,null);
    }

}

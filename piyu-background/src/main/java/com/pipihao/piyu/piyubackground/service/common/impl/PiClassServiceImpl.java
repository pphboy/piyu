package com.pipihao.piyu.piyubackground.service.common.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.mapper.common.PiProductClassMapper;
import com.pipihao.piyu.piyubackground.service.common.PiClassService;
import com.pipihao.piyu.pojo.PiProductClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 19:27
 */
@Service
public class PiClassServiceImpl implements PiClassService {

    @Autowired
    private PiProductClassMapper piProductClassMapper;

    /**
     * 分页获取皮物分类
     * @param page
     * @return
     */
    @Override
    public Page<PiProductClass> getAllPiClass(Page<PiProductClass> page){
        return this.piProductClassMapper.getAllPiClassByPage(page);
    }
}

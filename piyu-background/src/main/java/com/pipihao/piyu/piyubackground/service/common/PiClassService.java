package com.pipihao.piyu.piyubackground.service.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.pojo.PiProductClass;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 19:27
 */
public interface PiClassService {

    /**
     * 分页获取皮物分类
     * @param page
     * @return
     */
    Page<PiProductClass> getAllPiClass(Page<PiProductClass> page);
}
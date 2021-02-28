package com.pipihao.piyu.piyubackground.service.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;

import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/27 9:24
 */
public interface PiProductService {

    Page<PiProduct> getAllPiProduct(Page<PiProduct> page, Map<String,Object> map);
}
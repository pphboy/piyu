package com.pipihao.piyu.piyubackground.service.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/27 9:24
 */
public interface PiProductService {

    /**
     * 获取所有的皮物
     * @param page
     * @param map
     * @return
     */
    Page<PiProduct> getAllPiProduct(Page<PiProduct> page, Map<String,Object> map);

    R setPiProductStatus(PiProduct piProduct);

    R deletePiProductById(String id);

    /**
     * 删除多个皮物
     * @return
     */
    R deleteByIds(List<String> ids);


    /**
     * 获取所有的 皮帖
     * @param piProductPage
     * @param map
     * @return
     */
    Page<PiProduct> getAllPiArticle(Page<PiProduct> piProductPage, Map<String, Object> map);
}

package com.pipihao.piyu.piyubackground.service.common.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.common.PiProductMapper;
import com.pipihao.piyu.piyubackground.service.common.PiProductService;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/27 9:24
 */
@Service
public class PiProductServiceImpl implements PiProductService {

    @Autowired
    private PiProductMapper piProductMapper;

    /**
     * 通过Map的参数获取所有的皮物
     * @param page
     * @param map
     * @return
     */
    @Override
    public Page<PiProduct> getAllPiProduct(Page<PiProduct> page, Map<String, Object> map) {
        return this.piProductMapper.getAllPiProduct(page,map);
    }

    /**
     * 改变皮物状态
     * @param piProduct
     * @return
     */
    @Override
    public R setPiProductStatus(PiProduct piProduct) {
        return new R().getR(this.piProductMapper.setPiProductStatus(piProduct),"修改成功","修改失败");
    }
}

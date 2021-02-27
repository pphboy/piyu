package com.pipihao.piyu.piyubackground.mapper.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/27 9:24
 */
@Mapper
public interface PiProductMapper {


    /**
     * 分页查询皮物
     * @param page
     * @param map
     * @return
     */
    /*代码在xml内*/
    Page<PiProduct> getAllPiProduct(Page<PiProduct> page, @Param("d") Map<String,Object> map);

    /**
     * 删除皮物
     * @param pid
     * @return
     */
    boolean deletePiProductById(Integer pid);

    /**
     * 设置皮物状态
     * @param piProduct
     * @return
     */
    boolean setPiProductStatus(PiProduct piProduct);



}

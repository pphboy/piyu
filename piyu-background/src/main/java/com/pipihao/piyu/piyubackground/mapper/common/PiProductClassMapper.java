package com.pipihao.piyu.piyubackground.mapper.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.pojo.PiProductClass;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 19:24
 */
@Mapper
public interface PiProductClassMapper extends com.pipihao.piyu.mapper.PiProductClassMapper {

    /**
     * 这个与api的那个获取唯一的区别就是这个需要分页查询
     * @param page
     * @return
     */
    @Select("select * from pi_product_class")
    Page<PiProductClass> getAllPiClassByPage(Page<PiProductClass> page);

}

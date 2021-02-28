package com.pipihao.piyu.piyubackground.mapper.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;
import com.pipihao.piyu.piyubackground.pojo.PiProductClass;
import com.pipihao.piyu.piyubackground.pojo.User;
import org.apache.ibatis.annotations.*;

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
     * 获取一个用户
     * @param id
     * @return
     */
    @Select("Select * from user where id = #{id}")
    User selectUserById(Integer id);

    /**
     * 获取一个分类
     * @param id
     * @return
     */
    @Select("Select * from pi_product_class where id = #{id}")
    PiProductClass selectPClassById(Integer id);

    /**
     * 删除皮物
     * @param pid
     * @return
     */
    @Delete("delete from pi_product where id = #{pid}")
    boolean deletePiProductById(String pid);

    /**
     * 根据ids删除皮物
     * @param  pid
     * @return
     */
    @Delete("delete from pi_product where id in ${pid}")
    boolean deleteByIds(String pid);

    /**
     * 设置皮物状态
     * @param piProduct
     * @return
     */
    @Update("update pi_product set status = #{status} where id = #{id}")
    boolean setPiProductStatus(PiProduct piProduct);


    /**
     * 代码在xml
     * @param page
     * @param map
     * @return
     */
    Page<PiProduct> getAllArticle(Page<PiProduct> page, @Param("d") Map<String, Object> map);
}

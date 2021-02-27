package com.pipihao.piyu.piyubackground.mapper.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.pojo.PiProductClass;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 19:24
 */
@Mapper
public interface PiProductClassMapper  {

    @Select("select * from pi_product_class")
    List<PiProductClass> findAllPiProductClass();

    @Select("select * from pi_product_class where id = #{id}")
    PiProductClass findPiProductClassById(int id);
    /**
     * 这个与api的那个获取唯一的区别就是这个需要分页查询
     * @param page
     * @return
     */
    @Select("select * from pi_product_class")
    Page<PiProductClass> getAllPiClassByPage(Page<PiProductClass> page);

    /**
     * 添加分类
     * @param piProductClass
     * @return
     */
    @Insert("INSERT INTO `pi_product_class`(`class_name`, `create_date`, `state`, `order_num`) VALUES (#{className}, now(), 1, #{orderNum})")
    boolean addPiClass(PiProductClass piProductClass);

    /**
     * 更新分类
     * @param piProductClass
     * @return
     */
    @Update("update pi_product_class set class_name = #{className},order_num = #{orderNum} where id = #{id}")
    boolean updatePiClass(PiProductClass piProductClass);

    /**
     * 判断是否重名
     * @param name
     * @return
     */
    @Select("select * from pi_product_class where class_name = #{name}")
    PiProductClass getPiClassByName(String name);

    /**
     * 禁用皮物分类
     * @return
     */
    @Update(" update pi_product_class set state = #{state} where id = #{id}")
    boolean offPiClass(PiProductClass piProductClass);

    /**
     * 查询分类下是否有皮物
     * @param id
     * @return
     */
    @Select("select count(*) from pi_product where class_id = #{id}")
    boolean getCountByPiClassId(Integer id);

    /**
     * 删除分类
     * @param id
     * @return
     */
    @Delete("delete from pi_product_class where id = #{id}")
    boolean deletePiClass(Integer id);

}

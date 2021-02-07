package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.FootPrint;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 17:27
 */
@Mapper
public interface FootPrintMapper extends tk.mybatis.mapper.common.Mapper<FootPrint> {

    /**
     * 新增足迹
     * @param footPrint
     * @return
     */
    @Insert("INSERT INTO `piyu`.`footprint`(`id`, `user_id`, `pi_product_id`, `create_time`) VALUES (null, #{userId}, #{piProductId}, now())")
    boolean sendFootPrint(FootPrint footPrint);

    /**
     * 删除足迹
     * @param footPrint
     * @return
     */
    @Delete("delete from footprint where user_id = #{userId} and pi_product_id = #{piProductId}")
    boolean deleteFootPrint(FootPrint footPrint);

    /**
     * 获取最新的足迹
     * @param userId
     * @return
     */
    @Results(
            value = {
                    @Result(property = "piProductId",column="pi_product_id"),
                    @Result(property = "piProduct",column = "pi_product_id",one = @One(select = "com.pipihao.piyu.mapper.PiProductMapper.findTradingPiProduct"))
            }
    )
    @Select("select * from footprint where user_id = #{userId} order by create_time desc")
    List<FootPrint> findFootPrintByUserId(Integer userId);
}

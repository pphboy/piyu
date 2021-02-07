package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.PiCollect;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 20:02
 */
@Mapper
public interface PiCollectMapper {

    @Select("select count(*) from pi_collect where pi_id = #{piId}")
    Integer getCollectCountByPid(String pid);

    /**
     * 查询是否有点赞过
     * @param piCollect
     * @return
     */
    @Select("select count(*) from pi_collect where pi_id = #{piId} and user_id = #{userId}")
    boolean selectPiCollect(PiCollect piCollect);

    /**
     * 添加点赞记录
     * @param piCollect
     * @return
     */
    @Insert("INSERT INTO `pi_collect`(`id`, `pi_id`,`user_id`, `create_date`,status) VALUES (null, #{piId},#{userId}, now(),1)")
    boolean sendPiCollect(PiCollect piCollect);

    /**
     * 删除点赞记录
     * @param piCollect
     * @return
     */
    @Delete("delete from pi_collect where pi_id = #{piId} and user_id = #{userId} ")
    boolean deletePiCollect(PiCollect piCollect);

}

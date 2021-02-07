package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.PiLike;
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
public interface PiLikeMapper  {

    @Select("select count(*) from pi_like where pi_id = #{piId}")
    Integer getLikeCountByPid(String pid);

    /**
     * 查询是否有点赞过
     * @param piLike
     * @return
     */
    @Select("select count(*) from pi_like where pi_id = #{piId} and user_id = #{userId}")
    boolean selectPiLike(PiLike piLike);

    /**
     * 添加点赞记录
     * @param piLike
     * @return
     */
    @Insert("INSERT INTO `pi_like`(`id`, `pi_id`, `like`, `user_id`, `create_date`) VALUES (null, #{piId}, 1,#{userId}, now())")
    boolean sendPiLike(PiLike piLike);

    /**
     * 删除点赞记录
     * @param piLike
     * @return
     */
    @Delete("delete from pi_like where pi_id = #{piId} and user_id = #{userId} ")
    boolean deletePiLike(PiLike piLike);

}

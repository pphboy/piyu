package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.Follows;
import com.pipihao.piyu.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/5 11:36
 */
@Mapper
public interface FollowsMapper extends tk.mybatis.mapper.common.Mapper<Follows> {

    /**
     * 关注操作
     * @param follows
     * @return
     */
    @Insert("INSERT INTO `follows`(`id`, `user_id`, `f_user_id`, `follow_time`) VALUES (null, #{userId}, #{fUserId}, now())")
    boolean sendFollowers(Follows follows);

    @Select("select count(*) from follows where user_id = #{userId} and f_user_id = #{fUserId} ")
    boolean userIsFollowed(Follows follows);

    /**
     * 取消关注
     * @param follows
     * @return
     */
    @Delete("delete from follows where f_user_id = #{fUserId} and user_id = #{userId}")
    boolean deleteFollowing(Follows follows);

    /**
     * 粉丝，只能查2页
     * @param userId
     * @return
     */
    @Select("select * from follows where user_id = #{userId} order by follow_time desc")
    List<User> findFollowers(Integer userId);

    /**
     * 关注的用户<br>
     * 当查询的用户变成粉丝，就能查他关注的对象了
     * @param userId
     * @return
     */
    @Select("select * from follows where f_user_id = #{userId} order by follow_time desc ")
    List<User> findFollowing(Integer userId);

    /**
     * 查询关注数<br>
     * 逻辑：查询所关注数的时候，则此用户应当为粉丝
     * @param userId
     * @return
     */
    @Select("select count(*) from follows where f_user_id = #{userId}")
    Integer getFollowingNumber(Integer userId);

    /**
     * 查询粉丝数
     * @param userId
     * @return
     */
    @Select("select count(*) from follows where user_id = #{userId}")
    Integer getFollowersNumber(Integer userId);

    /**
     * 查询所有粉丝
     * @param userId
     * @return
     */
    @Select("SELECT u.username,u.nickname,u.introduction,u.head_image FROM follows f LEFT JOIN `user` u ON f.f_user_id=u.id WHERE f.user_id=#{userId} ORDER BY f.follow_time DESC")
    List<User> getFollowersByUserId(Integer userId);

    /**
     * 查询所有关注
     * @param userId
     * @return
     */
    @Select("SELECT u.username,u.nickname,u.introduction,u.head_image FROM follows f LEFT JOIN `user` u ON f.user_id=u.id WHERE f.f_user_id=#{userId} ORDER BY f.follow_time DESC")
    List<User> getFollowingByUserId(Integer userId);

}

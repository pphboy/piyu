package com.pipihao.piyu.piyubackground.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pipihao.piyu.piyubackground.pojo.IRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:54
 */
@Mapper
public interface RoleMapper extends BaseMapper<IRole> {

    @Select("select * from bg_role where id in (select role_id from bg_user_role where user_id = #{userId}) order by num desc")
    List<IRole> getRoleIds(Integer userId);

    /**
     * 获取所有的role
     * @return
     */
    @Select("select * from bg_role")
    List<IRole> getAllRole();

    @Delete("delete from bg_user_role where user_id = #{userId}")
    boolean deleteAllRoleOfUser(Integer userId);

    /**
     * 添加权限，不过使用是拼接字符串，不会有注入bug
     * @param value
     * @return
     */
    @Insert("insert bg_user_role (`user_id`, `role_id`) values ${value}")
    boolean sendUserRole(String value);


}

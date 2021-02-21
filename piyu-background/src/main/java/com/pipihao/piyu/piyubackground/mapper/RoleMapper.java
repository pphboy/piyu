package com.pipihao.piyu.piyubackground.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pipihao.piyu.piyubackground.pojo.IRole;
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

    @Select("select * from bg_role where id in (select role_id from bg_user_role where user_id = #{userId})")
    List<IRole> getRoleIds(Integer userId);
}

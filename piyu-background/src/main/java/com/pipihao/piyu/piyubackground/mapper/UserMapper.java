package com.pipihao.piyu.piyubackground.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:54
 */
@Mapper
public interface UserMapper extends BaseMapper<IUser> {

    @Select("select * from bg_user where register_date > #{map.start} and register_date < #{map.end} and username like '%${map.keywords}%' and username <> 'admin' ")
    Page<IUser> getAdministrators(Page<IUser> page,@Param("map") Map<String,Object> map);

    @Update("update bg_user set state = #{state} where id = #{userId}")
    boolean setState(Map<String,Object> map);

    @Delete("delete from bg_user where id = #{id}")
    boolean deleteAdmin(Map<String,Object> map);

    /**
     * 获取当前管理员的状态
     * @param map
     * @return
     */
    @Select("select state from bg_user where id = #{id}")
    boolean getStateByUserId(Map<String,Object> map);
}

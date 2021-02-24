package com.pipihao.piyu.piyubackground.mapper.common;

import com.pipihao.piyu.mapper.UserMapper;
import com.pipihao.piyu.pojo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/24 16:21
 */
@Mapper
public interface CpUserMapper extends UserMapper {

    /**
     * 修改用户
     * @param user
     * @return
     */
    boolean updateUser(User user);
}


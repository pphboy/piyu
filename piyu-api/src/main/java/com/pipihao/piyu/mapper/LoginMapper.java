package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginMapper {

    @Insert("INSERT INTO `piyu`.`login_record`( `user_id`, `login_ip`, `login_time`) VALUES (#{userId}, #{ip}, now())")
    void insertUserLoginRecord(@Param("userId") int userId,@Param("ip")String ip);
}

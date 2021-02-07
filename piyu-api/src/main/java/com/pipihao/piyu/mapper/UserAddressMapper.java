package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.UserAddress;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserAddressMapper extends tk.mybatis.mapper.common.Mapper<UserAddress> {

    /**
     * 获取当前用户的收货地址
     * @param userId
     * @return
     */
    @Select("select * from user_address where user_id = #{userId} order by create_time asc")
    List<UserAddress> findUserAddressByUserId(Integer userId);

    /**
     * 更新收货地址
     * @param userAddress
     * @return
     */
    @Update("UPDATE `user_address` SET `name` = #{name}, `phone` = #{phone}, `province` =#{province}, `city` =#{city}, `county` = #{county}, `dailed_address` = #{dailedAddress} WHERE `id` = #{id} and user_id = #{userId}")
    boolean updateUserAddress(UserAddress userAddress);

    /**
     * 删除用户收货地址
     * @param userAddress
     * @return
     */
    @Delete("delete from user_address WHERE `id` = #{id} and user_id = #{userId}")
    boolean deleteUserAddress(UserAddress userAddress);

    /**
     * 添加用户收货地址
     * @param userAddress
     * @return
     */
    @Insert("INSERT INTO `piyu`.`user_address`(`id`, `user_id`, `name`, `phone`, `province`, `city`, `county`, `dailed_address`, `is_default`, `create_time`) " +
            "VALUES (null,#{userId}, #{name},#{phone}, #{province} , #{city}, #{county}, #{dailedAddress}, 0, now())")
    boolean insertUserAddress(UserAddress userAddress);

    /**
     * 设置收货地址默认
     * @param userAddress
     * @return
     */
    @Update("update user_address set is_default = 1 WHERE `id` = #{id} and user_id = #{userId}")
    boolean setUserAddressDefault(UserAddress userAddress);

    /**
     * 清楚当前用户收货地址的默认状态
     * @param userId
     * @return
     */
    @Update("update user_address set is_default = 0 WHERE user_id = #{userId}")
    boolean cleanUserAddressDefault(Integer userId);

    /**
     * 获取当前用户下，已有的收货地址的数量
     * @param userId
     * @return
     */
    @Select("select count(*) from user_address where user_id = #{userId} ")
    Integer getUserAddressCountByUserId(Integer userId);
}

package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.Wallet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.math.BigDecimal;

@Mapper
public interface WalletMapper {

    @Select("INSERT INTO `piyu`.`wallet`(`user_id`, `balance`, `first_date`, `last_trading_time`, `total_revenue`, `total_expenditure`) VALUES (#{userId}, 0, now(), now(), 0, 0)")
    void sendNewWalletAboutUser(Integer userId);

    /**
     * 获取该用户的账户信息
     * @param userId
     * @return
     */
    @Select("select * from wallet where user_id = #{userId}")
    Wallet findWalletByUserId(Integer userId);

    /**
     * 加钱
     * @param money
     * @param userId
     * @return
     */
    @Update("UPDATE `piyu`.`wallet` SET `balance` = balance+${money},`last_trading_time` = now(), `total_revenue` = total_revenue+${money} WHERE `user_id` =#{userId}")
    boolean addMoney(@Param("money")BigDecimal money,@Param("userId") Integer userId);

    /**
     * 减钱
     * @param money
     * @param userId
     * @return
     */
    @Update("UPDATE `piyu`.`wallet` SET `balance` = balance-${money},`last_trading_time` = now(), `total_expenditure` = total_expenditure+${money} WHERE `user_id` =#{userId}")
    boolean reduceMoney(@Param("money")BigDecimal money,Integer userId);

}

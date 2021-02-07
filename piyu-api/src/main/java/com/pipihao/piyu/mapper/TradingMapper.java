package com.pipihao.piyu.mapper;

import com.pipihao.piyu.pojo.Trading;
import org.apache.ibatis.annotations.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 12:49
 */
@Mapper
public interface TradingMapper {


    /**
     * 添加一条交易记录
     * @param trading
     * @return
     */
    @Insert("INSERT INTO `piyu`.`trading`(`id`, `user_id`, `r_user_id`, `type`, `address_id`, `pi_product_id`, `status`, `time`, `money`) " +
            "VALUES (#{id}, #{userId}, #{rUserId}, #{type},#{addressId}, #{piProductId}, #{status}, now(), #{money})")
    boolean piProductTrading(Trading trading);

    /**
     * 查询交易记录
     * @param userId
     * @return
     */
    @Results(value = {
            @Result(property = "piProductId",column = "pi_product_id"),
            @Result(property = "piProduct",column = "pi_product_id",one = @One(select = "com.pipihao.piyu.mapper.PiProductMapper.findTradingPiProduct"))
    })
    @Select("SELECT t.*,pp.title FROM trading t LEFT JOIN pi_product pp ON pp.id=t.pi_product_id WHERE t.user_id=#{userId} AND pp.title LIKE '%${keywords}%' ORDER BY t.time DESC")
    List<Trading> findTradingHistoryByUserId(@Param("userId") Integer userId,@Param("keywords")String keywords);


    /**
     * 获取用户的皮志<br>
     * 皮志也就是支付日志啦
     * @param userId
     * @return
     */
    @Select("select DATE_FORMAT(time,'%Y年%m月%d日') date from trading where r_user_id = #{userId} or user_id = #{userId} group by date")
    List<Map<String,Object>> findUserPayLog(Integer userId);


}

package com.pipihao.piyu.piyubackground.mapper.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.pojo.PUser;
import com.pipihao.piyu.pojo.User;
import org.apache.ibatis.annotations.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 此类并不使用MybatisPlus，因为api没有使用MybatisPlus<br>
 *    这个类对不上表，所以不能用
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/23 8:54
 */
@Mapper
public interface PiUserMapper {

    /**
     * 分布获取用户的账号
     * @param page
     * @param map
     * @return
     */
    @Results({
        @Result(property = "id",column = "id"),
            @Result(property = "money",column = "id",one = @One(select = "getUserMoneyByUserId"))
    })
    @Select("SELECT * FROM `user` WHERE IFNULL(del,0) <> 1 AND username LIKE '%${d.keywords}%'")
    Page<PUser> findAll(Page<PUser> page, @Param("d") Map<String,Object> map);

    /*此方法与本灰无关*/
    /**
     * 获取用户的余额
     * @param userId
     * @return
     */
    @Deprecated  // 反正强迫症是不会使用这种有删除线的方法
    @Select("select balance from wallet where user_id = #{userId}")
    BigDecimal getUserMoneyByUserId(Integer userId);


    /**
     * 改变用户禁用状态
     * @param map
     * @return
     */
    @Update("update `user` set active_status = #{state} where id = #{id}")
    boolean changeUserActiveStatus(Map<String,Object> map);

    /**
     * 批量禁用
     * @param sql
     * @return
     */
    @Update("update `user` set active_status = false where id in ${sql}")
    boolean banUserByIds(String sql);
}

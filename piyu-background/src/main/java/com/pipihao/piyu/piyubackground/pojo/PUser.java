package com.pipihao.piyu.piyubackground.pojo;

import com.pipihao.piyu.pojo.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 此用只用作api-User类的扩展
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/24 10:39
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class PUser extends User {
    private BigDecimal money; //余额
}

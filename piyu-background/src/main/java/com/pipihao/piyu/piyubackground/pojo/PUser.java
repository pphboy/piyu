package com.pipihao.piyu.piyubackground.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pipihao.piyu.pojo.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

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
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) //只写
    private Integer id;
    private BigDecimal money; //余额
    @JsonIgnore
    private Date delDate; //注销时间
}

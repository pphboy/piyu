package com.pipihao.piyu.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 收货地址类
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class UserAddress implements Serializable {
    private Integer id; // 自增
    @JsonIgnore
    private int userId;
    private String name; // 收货人姓名
    private String phone; // 收货电话
    private String province; // 省级 char
    private String city; // 市级 char
    private String county; // 县级 char
    private String dailedAddress; //详细地址
    private boolean isDefault; //是否为默认
    @JsonFormat(pattern = "yyyy-mm-dd HH:MM:ss")
    private Date createTime;
}

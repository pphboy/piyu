package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户 类
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class User implements Serializable {
    @JsonIgnore
    private Integer id;
    private String username;
    private String nickname;
    private Integer gender; // 1，男，2，女，0 空
    private String address;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) //只写
    private String email;
    private String introduction;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;
    @JsonIgnore
    private String salt;
    @JsonFormat(pattern = "yyyy-Mm-dd HH:mm:ss")
    private Date registerDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastLoginTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birthDate;
    private String headImage;
    @JsonIgnore
    private Boolean activeStatus;
    private String alipayAccount; // 支付宝
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;//更新时间账号
    private Integer followers; //粉丝数
    private Integer following; //关注数
}

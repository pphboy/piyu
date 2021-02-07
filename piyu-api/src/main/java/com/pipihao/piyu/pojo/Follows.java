package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 粉丝类
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class Follows implements Serializable {
    private Integer id;
    @JsonIgnore
    private Integer userId; //被关注的用户
    private Integer fUserId; //粉丝id
    private String username;
    private Date followTime; //关注时间
}

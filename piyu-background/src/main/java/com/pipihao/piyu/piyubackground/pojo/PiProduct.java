package com.pipihao.piyu.piyubackground.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pipihao.piyu.piyubackground.pojo.PiProductClass;
import com.pipihao.piyu.piyubackground.pojo.User;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 皮物类
 * 皮物即可以当article也可以当product
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class PiProduct implements Serializable {
    private String id; // UUID
    @JsonIgnore
    private Integer userId;
    private User maker; //作者
    private String title;
    private Integer classId;
    private PiProductClass piProductClass;
    private BigDecimal price;
    private String address;
    private Integer number; //皮物的访问数
    private String content;
    private Boolean status;// 封禁状态 发表时是否需要审核
    /*如何已售和下架两个都为false,则是在售状态，但保证有值的只能有一个*/
    private Boolean downShelf; // 下架
    private Boolean soldStatus;// 已售 下架和已售是冲突的，不能两个同时为true，所以操作之前需要判断状态
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;//创建时间
    private BigDecimal freight; // 运费
    private Boolean tradeStatus; //是否是交易中 为true为交易中，为false处于交易中
    // 2021年02月01日 新加的
    private Integer likeNumber; //点赞number
    private Integer collectNumber; //收藏数
    private Integer commentNumber; //评论数
}

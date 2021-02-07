package com.pipihao.piyu.common;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 此类是一个分页杂类有可能会很多的接口都使用这一个page接收数据
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class PiPage {
    private Integer page;
    private Integer size;
    private Integer type; //1:在售，2:已售，3:下架，4:皮帖
    private Integer classId;
    private String pid; // 皮物id
    private String keywords; //搜索的关键字
    private String username; //用户名
}

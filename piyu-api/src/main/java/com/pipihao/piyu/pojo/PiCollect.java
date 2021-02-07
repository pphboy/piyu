package com.pipihao.piyu.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 19:59
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class PiCollect {
    private Integer id;//
    private String piId;   //皮物的id
    private Integer userId; //用户id
    private Boolean status;  //隐藏收藏
    private Date createDate;
}

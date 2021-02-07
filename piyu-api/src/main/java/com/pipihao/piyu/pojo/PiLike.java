package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 收藏类
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/3 19:57
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class PiLike implements Serializable {
    private Integer id;//
    private String piId; //皮物的id
    private Integer like; //为1则是点赞，为0则是踩
    private Integer userId; //用户id
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date create_date;

}

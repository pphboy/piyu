package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 足迹
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class FootPrint implements Serializable {
    private Integer id;
    private Integer userId;
    private String piProductId;
    private PiProduct piProduct;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}

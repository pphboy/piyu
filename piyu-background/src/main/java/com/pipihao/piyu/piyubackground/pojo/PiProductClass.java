package com.pipihao.piyu.piyubackground.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;


/**
 * 皮物的分类
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class PiProductClass implements Serializable {
    private Integer id;
    private String className;
    private String createDate;
    private Boolean state;
    private Integer orderNum;
}

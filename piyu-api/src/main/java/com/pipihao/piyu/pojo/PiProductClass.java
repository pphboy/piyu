package com.pipihao.piyu.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;


/**
 * 皮物的分类
 */

@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class PiProductClass implements Serializable {
    private int id;
    private String className;
    private String createDate;
}

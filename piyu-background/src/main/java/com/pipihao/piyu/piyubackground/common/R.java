package com.pipihao.piyu.piyubackground.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 数据返回类
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/21 19:31
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class R {
    private Boolean state;
    private String msg;
    private Object data;
}

package com.pipihao.piyu.piyubackground.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ObjectUtils;
import org.thymeleaf.util.ListUtils;

import java.util.List;

/**
 * 数据返回类
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/21 19:31
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class R {
    private Boolean state;
    private String msg;
    private Object data;

    /**
     * 返回值
     * @param data
     * @param succMsg
     * @param errorMsg
     * @return
     */
    public R getR(Object data,String succMsg,String errorMsg){
        if(ObjectUtils.isEmpty(data)){
            this.data = null;
            this.msg = errorMsg;
            this.state = false;
            return this;
        }

        if(data instanceof Boolean){
            if((Boolean)data){
                this.data = null;
                this.state = true;
                this.msg = succMsg;
            }else{
                this.data = null;
                this.state = false;
                this.msg = errorMsg;
            }
            return this;
        }

        if(data instanceof List){
            if(((List<?>) data).isEmpty()){
                this.data = null;
                this.state = false;
                this.msg = errorMsg;
            }else{
                this.data = data;
                this.state = true;
                this.msg = succMsg;
            }
            return this;
        }

        /*即不是空对象，又不是空数组*/
        this.data = data;
        this.msg = succMsg;
        this.state = true;
        return this;
    }
}

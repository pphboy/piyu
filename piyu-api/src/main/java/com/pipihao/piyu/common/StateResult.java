package com.pipihao.piyu.common;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Objects;


@ToString
public class StateResult {

    public static final StateResult example = new StateResult();


    /**
     * 数据效验返回类
     * @param obj
     * @param successMsg
     * @param errorMsg
     * @param data
     * @return
     */
    public static StateResult getExample(Object obj,String successMsg,String errorMsg,Object data){
        if (obj == null) {
            return StateResult.getExample(false,errorMsg,data);
        }else{
            if(obj instanceof List){
                if(((List<?>) obj).size() < 1){
                    return StateResult.getExample(false,errorMsg,data);
                }
            }
            if(obj instanceof Boolean){
                if(!(Boolean) obj){
                    return StateResult.getExample(false,errorMsg,data);
                }
            }
            if(obj instanceof String){
                if(StringUtils.isEmpty((String)obj)){
                    return StateResult.getExample(false,errorMsg,data);
                }
            }
            return StateResult.getExample(true,successMsg,data);
        }
    }

    /**
     * 数据效验返回类
     * @param obj
     * @param successMsg
     * @param errorMsg
     * @param successObj
     * @param errorObj
     * @return
     */
    public static StateResult getExample(Object obj,String successMsg,String errorMsg,Object successObj,Object errorObj){
        if (obj == null) {
            return StateResult.getExample(false,errorMsg,errorObj);
        }else{
            if(obj instanceof List){
                if(((List<?>) obj).size() < 1){
                    return StateResult.getExample(false,errorMsg,errorObj);
                }
            }
            if(obj instanceof Boolean){
                if(!(Boolean) obj){
                    return StateResult.getExample(false,errorMsg,errorObj);
                }
            }
            if(obj instanceof String){
                if(StringUtils.isEmpty((String)obj)){
                    return StateResult.getExample(false,errorMsg,errorObj);
                }
            }
            return StateResult.getExample(true,successMsg,successObj);
        }
    }
    /**
     * 返回 信息
     * @param status
     * @param msg
     * @param data
     * @return
     */
    public static StateResult getExample(boolean status, String msg, Object data) {
        /*
         * 2021年02月06日
         * 这里我本来设置的是单例模式，结果发现有问题，
         * 我裂开了
         * 然后就改成了new算了，等以后如果玩明白了再想什么新办法。
         * 感觉可以写一个对象返回池
         * */
//        example.setData(data);
//        example.setMsg(msg);
//        example.setStatus(status);
        return new StateResult(status,msg,data);
    }


    /**
     * 获取没有返回对象的对象
     * @param errorMsg
     * @return
     */
    public static StateResult getError(String errorMsg) {
//        example.setData(null);
//        example.setMsg(errorMsg);
//        example.setStatus(false);
//        return example;
        return new StateResult(false,errorMsg,null);
    }

    private boolean status;

    private String msg;

    private Object data;

    public StateResult() {
    }

    public StateResult(boolean status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}

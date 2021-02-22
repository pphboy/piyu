package com.pipihao.piyu.piyubackground.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:56
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("bg_role")
@Accessors(chain = true)
public class IRole implements Serializable {

    @TableId(value = "id",type= IdType.AUTO)
    private Integer id;
    private String name;//角色名
    private String remark; // 角色的名称
    private Integer num; //排序num
}

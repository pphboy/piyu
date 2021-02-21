package com.pipihao.piyu.piyubackground.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 叫IUser是为了与Security的User区分
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:55
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("bg_user")
public class IUser {

    @TableId(value = "id",type= IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private Boolean state;
    private String email;
    private Date registerDate;
}

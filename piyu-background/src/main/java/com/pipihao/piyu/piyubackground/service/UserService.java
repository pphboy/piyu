package com.pipihao.piyu.piyubackground.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.IUser;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:31
 */
public interface UserService {

    Page<IUser> getAdministrators(Page<IUser> page, Map<String,Object> map);

    R setState(Map<String,Object> map);

    R deleteAdmin(Map<String,Object> map);
}

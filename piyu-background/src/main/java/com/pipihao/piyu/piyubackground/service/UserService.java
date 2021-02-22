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

    /**
     * 设置管理状态
     * @param map
     * @return
     */
    R setState(Map<String,Object> map);

    /**
     * 删除管理
     * @param map
     * @return
     */
    R deleteAdmin(Map<String,Object> map);

    /**
     * 添加一个管理
     * @param iUser
     * @return
     */
    R putAdmin(IUser iUser);

    /**
     * 通过id查询一个用户信息
     * @param userId
     * @return
     */
    IUser getUserById(Integer userId);
}

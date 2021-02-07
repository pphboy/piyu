package com.pipihao.piyu.service;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    /**
     *  注册
     *  默认值 ： username,password,salt,register_date,email
     * @param user
     * @return
     */
    public StateResult registerUser(User user);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public StateResult setUserInfo(User user,String token);

    /**
     * 获取用户信息
     * @param request
     * @return
     */
    public StateResult getUserInfo(HttpServletRequest request);

    /**
     * 用户个人主页获取信息
     * @return
     */
    public StateResult getUserSpaceInfo(String username,String token);
}

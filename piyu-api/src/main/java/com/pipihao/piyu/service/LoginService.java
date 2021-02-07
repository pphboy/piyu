package com.pipihao.piyu.service;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.User;

public interface LoginService {

    /**
     * 登录
     * @param user
     * @return
     */
    public StateResult login(User user,String ip);
}

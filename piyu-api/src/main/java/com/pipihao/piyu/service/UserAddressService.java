package com.pipihao.piyu.service;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.UserAddress;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserAddressService {

    /**
     * 获取当前用户的收货地址
     * @param token
     * @return
     */
    StateResult findUserAddressByUserId(String token);

    /**
     * 删除用户收货地址
     * @param  userAddress
     * @param  token
     * @return
     */
    StateResult deleteUserAddress(UserAddress userAddress,String token);

    /**
     * 添加用户收货地址
     * @param userAddress
     * @param  token
     * @return
     */
    StateResult sendUserAddress(UserAddress userAddress,String token);

    /**
     * 设置收货地址默认
     * @param userAddress
     * @param token
     * @return
     */
    StateResult setUserAddressDefault(UserAddress userAddress,String token);
}

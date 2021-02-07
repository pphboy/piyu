package com.pipihao.piyu.controller;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.UserAddress;
import com.pipihao.piyu.service.UserAddressService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * put 添加,get 获取,post 设置默认,delete 删除
 */
@RestController
@RequestMapping("address")
public class UserAddressController {

    @Autowired
    private UserAddressService userAddressService;


    /**
     * 获取当前用户
     * @param request
     * @return
     */
    @GetMapping
    public StateResult getUserAddress(HttpServletRequest request){
        return this.userAddressService.findUserAddressByUserId(request.getHeader("token"));
    }

    /**
     * 编辑和新增
     * @param userAddress
     * @param request
     * @return
     */
    @PutMapping
    public StateResult sendUserAddress(@RequestBody UserAddress userAddress,HttpServletRequest request){
        return this.userAddressService.sendUserAddress(userAddress,request.getHeader("token"));
    }

    /**
     * 设置默认
     * @param userAddress
     * @param request
     * @return
     */
    @PostMapping
    public StateResult setDefaultUserAddress(@RequestBody UserAddress userAddress,HttpServletRequest request){
        return this.userAddressService.setUserAddressDefault(userAddress,request.getHeader("token"));
    }

    /**
     * 删除收货地址
     * @param userAddress
     * @param request
     * @return
     */
    @DeleteMapping
    public StateResult deleteUserAddress(@RequestBody UserAddress userAddress,HttpServletRequest request){
        return this.userAddressService.deleteUserAddress(userAddress,request.getHeader("token"));
    }

}

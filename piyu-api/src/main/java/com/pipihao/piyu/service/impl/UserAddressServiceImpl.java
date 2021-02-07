package com.pipihao.piyu.service.impl;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.UserAddressMapper;
import com.pipihao.piyu.pojo.UserAddress;
import com.pipihao.piyu.service.UserAddressService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 增删查改，设置默认
 */
@Service
public class UserAddressServiceImpl implements UserAddressService {


    @Autowired
    private UserAddressMapper userAddressMapper;

    /**
     * 获取当前用户的收货地址
     * @param token
     * @return
     */
    @Override
    public StateResult findUserAddressByUserId(String token) {
        List<UserAddress>  userAddresses= this.userAddressMapper.findUserAddressByUserId(Integer.parseInt(JWTUtils.verifyToken(token).getClaim("userId").asString()));
        return StateResult.getExample(userAddresses,"获取数据成功","暂无收货地址，请添加",userAddresses);
    }

    /**
     * 删除用户收货地址
     * @param  userAddress
     * @param  token
     * @return
     */
    @Override
    public StateResult deleteUserAddress(UserAddress userAddress, String token) {
        return StateResult.getExample(this.userAddressMapper.deleteUserAddress(userAddress.setUserId(Integer.parseInt(JWTUtils.getValue("userId", token)))),"删除收货地址成功","删除收货地址失败",null);
    }

    /**
     * 添加用户收货地址/编辑
     * @param userAddress
     * @param  token
     * @return
     */
    @Override
    public StateResult sendUserAddress(UserAddress userAddress, String token) {
        if(userAddress.getId() != null){
            /*编辑*/
            return StateResult.getExample(this.userAddressMapper.updateUserAddress(userAddress.setUserId(Integer.parseInt(JWTUtils.getValue("userId", token)))),"更新收货地址成功","更新收货地址失败",null);
        }else{
            //判断是否超过5条
            if(this.userAddressMapper.getUserAddressCountByUserId(Integer.parseInt(JWTUtils.getValue("userId",token))) <= 4){
                /*新增*/
                return StateResult.getExample(this.userAddressMapper.insertUserAddress(userAddress.setUserId(Integer.parseInt(JWTUtils.getValue("userId", token)))),"添加收货地址成功","添加收货地址失败",null);
            }else{
                return StateResult.getExample(false,"最多添加5条记录",null);
            }
        }
    }

    /**
     * 设置收货地址默认
     * @param userAddress
     * @param token
     * @return
     */
    @Override
    public StateResult setUserAddressDefault(UserAddress userAddress, String token) {
        boolean ok = false;
        /*清当前用户所有的默认状态*/
        ok = this.userAddressMapper.cleanUserAddressDefault(Integer.parseInt(JWTUtils.getValue("userId",token)));
        /*设置默认状态*/
        ok = this.userAddressMapper.setUserAddressDefault(userAddress.setUserId(Integer.parseInt(JWTUtils.getValue("userId",token))));
        return StateResult.getExample(ok,"设置默认收货地址成功","设置默认收货地址失败",null);
    }
}

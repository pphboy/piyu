package com.pipihao.piyu.service.impl;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.LoginMapper;
import com.pipihao.piyu.mapper.UserMapper;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.LoginService;
import com.pipihao.piyu.utils.JWTUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginMapper loginMapper;

    @Autowired
    UserMapper userMapper;

    /**
     * 登录
     * @param user
     * @param ip
     * @return
     */
    @Override
    public StateResult login(User user,String ip) {
        if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getPassword())) return StateResult.getExample(false,"参数错误-并记录了你的IP",null);
        /*查询用户*/
        User dbUser = userMapper.getUserByUsername(user.getUsername());
        /*判断用户是否存在*/
        if(dbUser.getId() == null) return StateResult.getExample(false,"用户名或密码错误",null);
        /*验证密码是否相等*/
        if(dbUser.getPassword().equals(DigestUtils.sha1Hex(user.getPassword()+dbUser.getSalt()))){
            /*插入登录时间和登录ip*/
            loginMapper.insertUserLoginRecord(dbUser.getId(),ip);
            /*生成token*/
            Map<String,String> map = new HashMap<>();
            map.put("username",dbUser.getUsername());
            map.put("userId",dbUser.getId().toString());
            map.put("token", JWTUtils.getToken(map));
            map.put("headImage",dbUser.getHeadImage());
            map.remove("userId");
            /*清除userid显示*/
            return StateResult.getExample(true,"登录成功",map);
        }else return StateResult.getExample(false,"用户名或密码错误",null);

    }
}

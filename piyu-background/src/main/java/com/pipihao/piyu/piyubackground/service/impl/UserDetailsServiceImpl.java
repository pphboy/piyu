package com.pipihao.piyu.piyubackground.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pipihao.piyu.piyubackground.PiyuBackgroundApplication;
import com.pipihao.piyu.piyubackground.mapper.RoleMapper;
import com.pipihao.piyu.piyubackground.mapper.UserMapper;
import com.pipihao.piyu.piyubackground.pojo.IRole;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import com.pipihao.piyu.piyubackground.service.UserService;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:37
 */
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    private static final Logger logger = LoggerFactory.getLogger(PiyuBackgroundApplication.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if(StringUtils.isEmpty(username)){
            logger.error("用户名不能为空");
            throw new RuntimeException("用户名不能为空");
        }
        QueryWrapper<IUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        IUser iuser = userMapper.selectOne(queryWrapper);

        if(ObjectUtils.isEmpty(iuser)){
            logger.error("无此用户"+username);
            throw new UsernameNotFoundException("无此用户");
        }
        /*查询用户权限*/
        List<IRole> roles = roleMapper.getRoleIds(iuser.getId());
        /*生成权限列表*/
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>(roles.size());
        for(IRole iRole: roles){
            grantedAuthorityList.add(new SimpleGrantedAuthority(iRole.getName()));
        }
        /*返回查询的用户对象*/
        return new User(iuser.getUsername(),iuser.getPassword(),grantedAuthorityList);
    }
}

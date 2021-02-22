package com.pipihao.piyu.piyubackground.service.impl;

import com.pipihao.piyu.piyubackground.mapper.RoleMapper;
import com.pipihao.piyu.piyubackground.pojo.IRole;
import com.pipihao.piyu.piyubackground.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/22 11:12
 */
@Service
public class RoleServerImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;


    @Override
    public List<IRole> getAllRole() {
        return roleMapper.getAllRole();
    }
}

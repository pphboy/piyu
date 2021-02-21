package com.pipihao.piyu.piyubackground.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.UserMapper;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import com.pipihao.piyu.piyubackground.service.UserService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:31
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Page<IUser> getAdministrators(Page<IUser> page, Map<String,Object> map) {
        if(ObjectUtils.isEmpty(map.get("start"))){
            map.put("start","1970-10-10");
        }
        if(ObjectUtils.isEmpty(map.get("end"))){
            map.put("end","2300-12-31");
        }
        Page<IUser> pages = this.userMapper.getAdministrators(page,map);
        return page;
    }

    @Override
    public R setState(Map<String, Object> map) {
        return new R(userMapper.setState(map),"修改成功",null);
    }

    @Override
    public R deleteAdmin(Map<String, Object> map) {
        if(userMapper.getStateByUserId(map)) return new R(false,"已激活的用户无法删除,请先停用该用户",null);
        else return new R(userMapper.deleteAdmin(map),"删除成功",null);
    }
}

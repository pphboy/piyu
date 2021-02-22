package com.pipihao.piyu.piyubackground.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.RoleMapper;
import com.pipihao.piyu.piyubackground.mapper.UserMapper;
import com.pipihao.piyu.piyubackground.pojo.IRole;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import com.pipihao.piyu.piyubackground.service.UserService;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;
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

    private static final SCryptPasswordEncoder passwordEncoder = new SCryptPasswordEncoder();

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

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
        else {
            /*删除权限*/
            roleMapper.deleteAllRoleOfUser((Integer)map.get("id"));
            return new R(userMapper.deleteAdmin(map),"删除成功",null);
        }

    }

    /**
     * 添加一个管理
     * @param iUser
     * @return
     */
    @Override
    public R putAdmin(IUser iUser) {
        /*如果没有权限，则无法添加*/
        if(ObjectUtils.isEmpty(iUser.getRoleList()) || iUser.getRoleList().size()<1 || StringUtils.isEmpty(iUser.getUsername())  || StringUtils.isEmpty(iUser.getEmail())) return new R(false,"无聊？",null);

        if(ObjectUtils.isEmpty(iUser.getId())){
            if(StringUtils.isEmpty(iUser.getPassword())) return new R(false,"无聊？",null);
            if(userMapper.getIsExistByUserName(iUser.getUsername())){
                return new R(false,"用户名已存在",null);
            }
            /*密码加密*/
            iUser.setPassword(passwordEncoder.encode(iUser.getPassword()));
            userMapper.sendAdmin(iUser);
            //添加权限
            roleMapper.sendUserRole(getRoleString(iUser));
            /*如果添加权限失败，则应该删除上面的用户，关返回false,我不想写了*/

            return new R(true,"添加成功",null);
        }else{
            if(!StringUtils.isEmpty(iUser.getPassword())){
                /*密码加密*/
                iUser.setPassword(passwordEncoder.encode(iUser.getPassword()));
            }else{
                iUser.setPassword(null);
            }
            /*修改用户数据*/
            userMapper.updateAdmin(iUser);
            /*删除权限*/
            roleMapper.deleteAllRoleOfUser(iUser.getId());
            /*添加权限*/
            roleMapper.sendUserRole(getRoleString(iUser));
            return new R(true,"修改成功",null);
        }
    }

    /**
     * 拼接role sql字符串
     * @param iUser
     * @return
     */
    private String getRoleString(IUser iUser){
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i< iUser.getRoleList().size() ; i++){
            IRole iRole = iUser.getRoleList().get(i);
            if(i == 0){
                sb.append("("+iUser.getId()+","+iRole.getId()+")");
                continue;
            }
            sb.append(",("+iUser.getId()+","+iRole.getId()+")");
        }
        return sb.toString();
    }

    @Override
    public IUser getUserById(Integer userId) {
        return userMapper.getUserById(userId);
    }

}

package com.pipihao.piyu.piyubackground.service.common.impl;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.common.CpUserMapper;
import com.pipihao.piyu.piyubackground.mapper.common.CpWalletMapper;
import com.pipihao.piyu.piyubackground.mapper.common.PiUserMapper;
import com.pipihao.piyu.piyubackground.pojo.PUser;
import com.pipihao.piyu.piyubackground.service.common.PiUserService;
import com.pipihao.piyu.pojo.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/23 8:54
 */
@Service
public class PiUserServiceImpl implements PiUserService {

    @Autowired
    private PiUserMapper piUserMapper;

    @Autowired
    private CpUserMapper userMapper;

    @Autowired
    private CpWalletMapper walletMapper;

    @Override
    public Page<PUser> getUserListBySearch(Page<PUser> page, Map<String, Object> map) {
        return piUserMapper.findAll(page,map);
    }

    @Override
    public R changeUserActiveStatus(Map<String, Object> map) {
        return new R().getR(this.piUserMapper.changeUserActiveStatus(map),"修改成功","修改失败");
    }

    @Override
    public R banUserByIds(List<Long> ids) {
        if(ids.isEmpty()) return new R().getR(null,null,"无聊？");
        StringBuffer sb = new StringBuffer();
        sb.append('(');
        for(int i = 0;i < ids.size();i++){
            if(i == 0){
                sb.append(""+ids.get(i));
            }
            sb.append(","+ids.get(i));
        }
        sb.append(')');
        return new R().getR(this.piUserMapper.banUserByIds(sb.toString()),"禁用成功","禁用失败");
    }

    /**
     * 注销用户
     * @param userId
     * @return
     */
    @Override
    public R offUser(Integer userId) {
        PUser userById = piUserMapper.getUserById(userId);
        if(ObjectUtils.isEmpty(userById)) return new R().getR(null,null,"无聊？");
        /*用户已禁用，用户余额小于10*/
        boolean state= false;
        if(!userById.getActiveStatus()&& userById.getMoney().compareTo(BigDecimal.valueOf(10)) < 1){
            state = piUserMapper.offUser(userId);
        }
        return new R().getR(state,"注销成功","该用户不符合注销条件");
    }

    /**
     * 此类不使用api的类，是因为api类后面加上邮箱验证 <br>
     *     所以不算是冗余
     * @param user
     * @return
     */
    @Override
    public R addUser(User user) {
        if(!ObjectUtils.isEmpty(user.getId())){
            if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getEmail()))
                return new R().getR(false,"无聊？",null);

        }
        if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getPassword()) || StringUtils.isEmpty(user.getEmail()))
            return new R().getR(false,"参数错误",null);
        /*如果userByEmail为true测说明邮箱已存在*/
        if(userMapper.getUserByEmail(user.getEmail()))
            return new R().getR(false,"邮箱已注册",user.getEmail());
            /*为true说明用户名已注册*/
        else if(userMapper.getUserStatusByUsername(user.getUsername()))
            return new R().getR(false,"用户名已注册",user.getUsername());
        else{
            /*生成长度为20的盐*/
            String salt = UUID.randomUUID().toString().replace("-","").substring(0,20);
            /*生成盐、加密密码*/
            user.setSalt(salt);
            /*加密*/
            user.setPassword(DigestUtils.sha1Hex(user.getPassword()+salt));
            /*注册*/
            userMapper.saveUser(user);
            /*开通钱包*/
            walletMapper.sendNewWalletAboutUser(user.getId());
            /*返回注册用户*/
            return new R().getR(true,"添加成功", null);
        }
    }

    /**
     * 获取用户信息
     * @param id
     * @return
     */
    @Override
    public User getUserById(Integer id) {
        return this.piUserMapper.getUserById(id);
    }
}

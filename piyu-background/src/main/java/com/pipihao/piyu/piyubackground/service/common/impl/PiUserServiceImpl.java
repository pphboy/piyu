package com.pipihao.piyu.piyubackground.service.common.impl;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.common.PiUserMapper;
import com.pipihao.piyu.piyubackground.pojo.PUser;
import com.pipihao.piyu.piyubackground.service.common.PiUserService;
import com.pipihao.piyu.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/23 8:54
 */
@Service
public class PiUserServiceImpl implements PiUserService {

    @Autowired
    private PiUserMapper piUserMapper;

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
}

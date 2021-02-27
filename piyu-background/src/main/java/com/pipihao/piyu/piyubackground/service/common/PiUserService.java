package com.pipihao.piyu.piyubackground.service.common;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.PUser;
import com.pipihao.piyu.piyubackground.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/23 8:54
 */
public interface PiUserService {

     /**
      * 获取用户列表
      * @param page
      * @param map
      * @return
      */
     Page<PUser> getUserListBySearch(Page<PUser> page, Map<String,Object> map);

     /**
      * 单个禁用
      * @param map
      * @return
      */
     R changeUserActiveStatus(Map<String,Object> map);

     /**
      * 批量禁用
      * @param ids
      * @return
      */
     R banUserByIds(List<Long> ids);

     /**
      * 注销用户
      * @return
      */
     R offUser(Integer userId);

     /**
      * 添加用户
      * @return
      */
     R addUser(PUser user);

     /**
      * 获取用户信息
      * @param id
      * @return
      */
     User getUserById(Integer id);

     /**
      * 获取所有的注销用户
      * @param page
      * @param map
      * @return
      */
     Page<PUser> getAllOffUser(Page<PUser> page,Map<String,Object> map);

     /**
      * 恢复用户
      * @param id
      * @return
      */
     R rightUser(Integer id);
}

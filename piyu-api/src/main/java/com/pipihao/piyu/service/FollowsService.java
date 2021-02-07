package com.pipihao.piyu.service;

import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.pojo.Follows;
import com.pipihao.piyu.pojo.User;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/5 12:17
 */

public interface FollowsService {

    /**
     * 关注操作
     * @param follows
     * @return
     */
    StateResult sendFollowers(Follows follows,String token);

    /**
     * 粉丝，只能查2页
     * @param userId
     * @return
     */
    StateResult findFollowers(Integer userId);

    /**
     * 关注的用户<br>
     * 当查询的用户变成粉丝，就能查他关注的对象了
     * @param userId
     * @return
     */
    StateResult findFollowing(Integer userId);

    /**
     * 查询粉丝数量<br>
     * 只允许查询前20个粉丝
     * @param piPage
     * @return
     */
    StateResult getFollowersByUserId(PiPage piPage,String token);

    /**
     * 查询关注数量<br>
     * @param piPage
     * @return
     */
    StateResult getFollowingByUserId(PiPage piPage,String token);
}

package com.pipihao.piyu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.FollowsMapper;
import com.pipihao.piyu.mapper.UserMapper;
import com.pipihao.piyu.pojo.Follows;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.FollowsService;
import com.pipihao.piyu.utils.JWTUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 关注的业务
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/5 12:17
 */
@Service
public class FollowsServiceImpl implements FollowsService {

    @Autowired
    private FollowsMapper followsMapper;

    @Autowired
    private UserMapper userMapper;

    /**
     *  关注操作
     * @param follows
     * @param token
     * @return
     */
    @Override
    public StateResult sendFollowers(Follows follows, String token) {
        User user = this.userMapper.getUserByUsername(follows.getUsername());
        /*是否有此用户*/
        if(user == null) return StateResult.getExample(false,"您关注了个不存在的用户",null);

        int userId = Integer.parseInt(JWTUtils.getValue("userId",token));
        if(userId == user.getId()) return StateResult.getExample(false,"不能关注自己",null);
        //设置关注id
        follows.setUserId(user.getId());
        follows.setFUserId(userId);
        /*检查是否已关注*/
        if(this.followsMapper.userIsFollowed(follows)) {
            /*如果已关注则删除关注*/
            return StateResult.getExample(this.followsMapper.deleteFollowing(follows),"取消关注成功","取消关注失败",true,null);
        }
        return StateResult.getExample(this.followsMapper.sendFollowers(follows),"关注成功","关注失败",null);
    }

    /**
     * 粉丝，只能查2页
     * @param userId
     * @return
     */
    @Override
    public StateResult findFollowers(Integer userId) {
        List<User> followers = this.followsMapper.findFollowers(userId);
        return StateResult.getExample(followers,"获取成功","当前用户没有粉丝",followers,null);
    }

    /**
     * 关注的用户<br>
     * 当查询的用户变成粉丝，就能查他关注的对象了
     * @param userId
     * @return
     */
    @Override
    public StateResult findFollowing(Integer userId) {
        List<User>  following= this.followsMapper.findFollowing(userId);
        return StateResult.getExample(following,"获取成功","当前用户没有粉丝",following,null);
    }

    /**
     * 查询粉丝数量<br>
     * 普通用户只允许查询前20个粉丝
     * 自己可以查询全部粉丝
     * @param piPage
     * @return
     */
    @Override
    public StateResult getFollowersByUserId(PiPage piPage,String token) {
        User user = this.userMapper.getUserSpaceInfo(piPage.getUsername());
        if(user == null) return StateResult.getError("无此用户");
        //设置分页详情
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        /*
         * 判断当前主页用户是不是来访者
         * 判断是不是此主页的用户,如果是，不拦截，可以查询全部粉丝
         * 如果不是此主页的用户，不管有没有token，都只能看到前20的粉丝
         * */
        Map<String,Object> map = new HashMap<>();
        //把当前的用户传过去
        map.put("user",user);
        if(!StringUtils.isEmpty(token) && Integer.parseInt(JWTUtils.getValue("userId",token))==user.getId()){
            List<User> users = this.followsMapper.getFollowersByUserId(user.getId());
            map.put("pageInfo",new PageInfo(users));
            return StateResult.getExample(users,"获取粉丝列表成功","很可惜，你没有粉丝",map,true);
        }else{
            if(piPage.getPage() > 2) return StateResult.getExample(false,"普通用户只能查询前20个粉丝",null);
            List<User> users = this.followsMapper.getFollowersByUserId(user.getId());
            map.put("pageInfo",new PageInfo(users));
            return StateResult.getExample(users,"获取粉丝列表成功","获取粉丝列表失败，当前用户无粉丝",map,true);
        }
    }

    @Override
    public StateResult getFollowingByUserId(PiPage piPage, String token) {
        User user = this.userMapper.getUserSpaceInfo(piPage.getUsername());
        if(user == null) return StateResult.getError("无此用户");
        //设置分页详情
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        /*
         * 判断当前主页用户是不是来访者
         * 判断是不是此主页的用户,如果是，不拦截，可以查询全部粉丝
         * 如果不是此主页的用户，不管有没有token，都只能看到前20的粉丝
         * */
        Map<String,Object> map = new HashMap<>();
        //把当前的用户传过去
        map.put("user",user);
        List<User> users = this.followsMapper.getFollowingByUserId(user.getId());
        map.put("pageInfo",new PageInfo(users));
        return StateResult.getExample(users,"获取粉丝列表成功","很可惜，你没有粉丝",map,true);
    }


}

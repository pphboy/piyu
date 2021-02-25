package com.pipihao.piyu.piyubackground.controller.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.PUser;
import com.pipihao.piyu.piyubackground.service.common.PiUserService;
import com.pipihao.piyu.pojo.User;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Pi前缀代表此类是于piyu前台的数据有关的
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/23 8:48
 */
@Controller
@RequestMapping("bg")
public class PiUserController {

    @Autowired
    private PiUserService piUserService;

    /**
     * 获取所以皮玩家的账号
     * @param keywords
     * @param page
     * @param size
     * @param modelMap
     * @return
     */
    @GetMapping("userList")
    public String userList(
            @RequestParam(name = "keywords",required = false) String keywords,
            @RequestParam(name = "page",required = false,defaultValue = "1") Long page,
            @RequestParam(name = "size",required = false,defaultValue = "10") Long size,
            ModelMap modelMap
    ){
        Map<String,Object> map = new HashMap<>();
        map.put("keywords",keywords);
        Page<PUser> userListBySearch = piUserService.getUserListBySearch(new Page<PUser>(page, size), map);
        modelMap.addAttribute("page",userListBySearch);
        modelMap.addAttribute("keywords",keywords);
        return "userList";
    }

    /**
     * 参数是
     * {state: boolean, id : int}<br>
     * 修改会员的账号激活状态
     * @param map
     * @return
     */
    @ResponseBody
    @PostMapping("banUser")
    public R changeUserActive(@RequestBody Map<String,Object> map){
        return this.piUserService.changeUserActiveStatus(map);
    }

    @ResponseBody
    @PostMapping("banUsers")
    public R banUserByIds(@RequestBody List<Long> ids){
        return this.piUserService.banUserByIds(ids);
    }

    /**
     * 注销用户
     * @param id
     * @return
     */
    @ResponseBody
    @GetMapping("offUser/{id}")
    public R offUserById(@PathVariable("id") Integer id){
        return this.piUserService.offUser(id);
    }

    /**
     * 添加用户的界面
     * @return
     */
    @GetMapping("addUser")
    public String addUserPage(){
        return "addUser";
    }

    /**
     * 编辑用户的界面
     * @return
     */
    @GetMapping("editUser/{id}")
    public String editUserPage(@PathVariable(name = "id") Integer id,ModelMap map){
        User user = this.piUserService.getUserById(id);
        if(ObjectUtils.isEmpty(user)){
            map.addAttribute("r",new R().getR(null,null,"无此用户"));
            return "error";
        };
        map.addAttribute("user", user);
        return "editUser";
    }

    /**
     * 添加用户
     */
    @ResponseBody
    @PostMapping("addUser")
    public R addUser(@RequestBody PUser user){
        return this.piUserService.addUser(user);
    }

    /**
     * 注销用户列表
     * @return
     */
    @GetMapping("offUserList")
    public String offUserList(
            @RequestParam(value = "start",required = false) String start,
            @RequestParam(value = "end",required = false) String end,
            @RequestParam(value = "username",required = false) String username,
            @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
            @RequestParam(value = "size",required = false,defaultValue = "10") Integer size
            ,ModelMap model
    ){
        Map<String,Object> map =new HashMap<>();
        map.put("start",start);
        map.put("end",end);
        map.put("username",username);
        Page<PUser> pages  = this.piUserService.getAllOffUser(new Page<PUser>(page,size),map);
        model.addAttribute("s",map); // s就是search的意思
        model.addAttribute("page",pages);//这里传的是查询的结果，而非什么类型为int的page
        return "offUserList";
    }

    @ResponseBody
    @PostMapping("rightUser")
    public R rightUser(@RequestParam("id") Integer id){
        return this.piUserService.rightUser(id);
    }



}

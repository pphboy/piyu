package com.pipihao.piyu.piyubackground.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.IUser;
import com.pipihao.piyu.piyubackground.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/21 9:54
 */
@RequestMapping("admin")
@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("adminList")
    public String adminList(@RequestParam(name = "page",required = false,defaultValue = "1") Long page,
                            @RequestParam(name = "size",required = false,defaultValue = "10") Long size,
                            @RequestParam(name = "keywords",required = false) String keywords,
                            @RequestParam(name = "start",required = false) String start,
                            @RequestParam(name = "end",required = false) String end,
                            ModelMap map){
        Map<String,Object> searchObject= new HashMap<>();
        map.addAttribute("start",start);
        map.addAttribute("end",end);
        map.addAttribute("keywords",keywords);

        searchObject.put("start",start);
        searchObject.put("end",end);
        searchObject.put("keywords",keywords);

        map.addAttribute("page",userService.getAdministrators(new Page<IUser>(page, size), searchObject));
        return "admin-list";
    }



    @ResponseBody
    @PostMapping("setState")
    public R setState(@RequestBody Map<String,Object> map){
        return userService.setState(map);
    }

    @ResponseBody
    @PostMapping("deleteAdmin")
    public R deleteAdmin(@RequestBody Map<String,Object> map){
        return userService.deleteAdmin(map);
    }


}

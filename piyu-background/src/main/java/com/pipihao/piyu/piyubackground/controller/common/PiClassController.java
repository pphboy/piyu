package com.pipihao.piyu.piyubackground.controller.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.service.common.PiClassService;
import com.pipihao.piyu.pojo.PiProductClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 18:40
 */
@Controller
@RequestMapping("bg")
public class PiClassController {
    @Autowired
    private PiClassService piClassService;

    @GetMapping("cate")
    public String catePage(@RequestParam(name = "page",required = false,defaultValue = "1")Integer page
            ,@RequestParam(name = "size",required = false,defaultValue = "10")Integer size, ModelMap model){
        model.addAttribute("page",this.piClassService.getAllPiClass(new Page<PiProductClass>(page,size)));
        return "cate";
    }

    /**
     * 添加分类
     * @param piProductClass
     * @return
     */
    @ResponseBody
    @PostMapping("addClass")
    public R addClass(@RequestBody PiProductClass piProductClass){
        return this.piClassService.addPiClass(piProductClass);
    }
}

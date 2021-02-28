package com.pipihao.piyu.piyubackground.controller.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.service.common.PiClassService;
import com.pipihao.piyu.piyubackground.service.common.PiProductService;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/27 9:26
 */
@Controller
@RequestMapping("pi")
public class PiProductController {

    @Autowired
    private PiProductService piProductService;

    @Autowired
    private PiClassService piClassService;

    @GetMapping("piProductList")
    public String piProductPage(
            @RequestParam(name = "keywords",required = false) String keywords,
            @RequestParam(name = "classId",required = false) Integer classId,
            @RequestParam(name = "start",required = false) String start, //查询的时间区间
            @RequestParam(name = "end",required = false) String end,
            @RequestParam(name = "userId",required = false) String userId,
            @RequestParam(name = "page",required = false,defaultValue = "1") Integer page,
            @RequestParam(name = "size",required = false,defaultValue = "10")Integer size,
            ModelMap model) throws Exception{
        Map<String,Object> map = new HashMap<>();
        map.put("keywords",keywords);
        map.put("classId",classId);
        map.put("start",start);
        map.put("end",end);
        map.put("userId",userId);

        model.addAttribute("classList",this.piClassService.getAllPiClass());
        model.addAttribute("page",this.piProductService.getAllPiProduct(new Page<PiProduct>(page,size),map));
        model.addAttribute("s",map); //s means search
        return "plist";
    }

    /**
     * 设置皮物状态
     * @param piProduct
     * @return
     */
    @ResponseBody
    @PostMapping("banPiProduct")
    public R banPiProduct(@RequestBody PiProduct piProduct){
        return this.piProductService.setPiProductStatus(piProduct);
    }

    /**
     * 删除皮物
     * @param id
     * @return
     */
    @ResponseBody
    @PostMapping("delPiProduct/{id}")
    public R delPiProduct(@PathVariable("id") String id){
        return this.piProductService.deletePiProductById(id);
    }

    /**
     * 删除多个皮物
     * @param pids
     * @return
     */
    @ResponseBody
    @PostMapping("deleteByIds")
    public R deleteByIds(@RequestBody List<String> pids){
        return this.piProductService.deleteByIds(pids);
    }

}
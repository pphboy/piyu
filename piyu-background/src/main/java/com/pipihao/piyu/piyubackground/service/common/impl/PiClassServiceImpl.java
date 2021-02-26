package com.pipihao.piyu.piyubackground.service.common.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.common.PiProductClassMapper;
import com.pipihao.piyu.piyubackground.service.common.PiClassService;
import com.pipihao.piyu.pojo.PiProductClass;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 19:27
 */
@Service
public class PiClassServiceImpl implements PiClassService {

    @Autowired
    private PiProductClassMapper piProductClassMapper;

    /**
     * 分页获取皮物分类
     * @param page
     * @return
     */
    @Override
    public Page<PiProductClass> getAllPiClass(Page<PiProductClass> page){
        return this.piProductClassMapper.getAllPiClassByPage(page);
    }

    /**
     * 添加分类
     * @param piProductClass
     * @return
     */
    @Override
    public R addPiClass(PiProductClass piProductClass) {
        /*数据判断*/
        if(StringUtils.isEmpty(piProductClass.getClassName()) || ObjectUtils.isEmpty(piProductClass.getOrderNum()))  return new R().getB(false,"无聊？",null);
        if(this.piProductClassMapper.getPiClassByName(piProductClass.getClassName())) return new R().getB(false,"该分类名已被使用",null);
        return new R().getR(this.piProductClassMapper.addPiClass(piProductClass),"添加成功","添加失败");
    }

    /**
     * 禁用分类
     * @param piProductClass
     * @return
     */
    @Override
    public R offPiClass(PiProductClass piProductClass) {
        return new R().getR(this.piProductClassMapper.offPiClass(piProductClass),"修改成功","修改失败");
    }

    /**
     * 删除分类<br>
     *     如果分类下有皮物，则无法删除
     * @param id
     * @return
     */
    @Override
    public R deletePiClass(Integer id) {
        /*判断当前分类下是否有皮物*/
        if(this.piProductClassMapper.getCountByPiClassId(id)) return new R().getB(false,"无法删除有皮物分类",null);
        /*删除分类*/
        return new R().getR(this.piProductClassMapper.deletePiClass(id),"删除成功","删除失败");
    }


}

package com.pipihao.piyu.piyubackground.service.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.pojo.PiProductClass;

import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/25 19:27
 */
public interface PiClassService {

    /**
     * 无条件获取所有的分类
     * @return
     */
    List<PiProductClass> getAllPiClass();

    /**
     * 分页获取皮物分类
     * @param page
     * @return
     */
    Page<PiProductClass> getAllPiClass(Page<PiProductClass> page);

    /**
     * 添加分类
     * @param piProductClass
     * @return
     */
    R addPiClass(PiProductClass piProductClass);

    /**
     * 禁用分类
     * @param piProductClass
     * @return
     */
    R offPiClass(PiProductClass piProductClass);

    /**
     * 删除分类
     * @param id
     * @return
     */
    R deletePiClass(Integer id);

    /**
     * 获取分类
     * @param id
     * @return
     */
    PiProductClass getPiClassById(Integer id);
}


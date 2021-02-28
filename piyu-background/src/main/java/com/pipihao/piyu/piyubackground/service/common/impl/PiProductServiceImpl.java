package com.pipihao.piyu.piyubackground.service.common.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pipihao.piyu.piyubackground.common.R;
import com.pipihao.piyu.piyubackground.mapper.common.PiProductMapper;
import com.pipihao.piyu.piyubackground.service.common.PiProductService;
import com.pipihao.piyu.piyubackground.pojo.PiProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/27 9:24
 */
@Service
public class PiProductServiceImpl implements PiProductService {

    @Autowired
    private PiProductMapper piProductMapper;

    /**
     * 通过Map的参数获取所有的皮物
     * @param page
     * @param map
     * @return
     */
    @Override
    public Page<PiProduct> getAllPiProduct(Page<PiProduct> page, Map<String, Object> map) {
        return this.piProductMapper.getAllPiProduct(page,map);
    }

    /**
     * 改变皮物状态
     * @param piProduct
     * @return
     */
    @Override
    public R setPiProductStatus(PiProduct piProduct) {
        return new R().getR(this.piProductMapper.setPiProductStatus(piProduct),"修改成功","修改失败");
    }

    /**
     * 删除皮物
     * @param id
     * @return
     */
    @Override
    public R deletePiProductById(String id) {
        return new R().getR(this.piProductMapper.deletePiProductById(id),"删除成功","删除失败");
    }

    /**
     * 删除多个皮物
     * @param pids
     * @return
     */
    @Override
    public R deleteByIds(List<String> pids) {
        StringBuffer sb = new StringBuffer();
        sb.append("(");
        for(int i = 0; i < pids.size() ; i++){
            if(i == pids.size()-1){
                sb.append("'"+pids.get(i)+"')");
                break;
            }
            sb.append("'"+pids.get(i)+"',");
        }
        /*数据在前端拼接好的*/
        return new R().getR(this.piProductMapper.deleteByIds(sb.toString()),"删除成功","删除失败");
    }
}

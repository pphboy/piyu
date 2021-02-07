package com.pipihao.piyu.service.impl;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.PiProductMapper;
import com.pipihao.piyu.mapper.UserMapper;
import com.pipihao.piyu.pojo.PiProduct;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.service.PiProductService;
import com.pipihao.piyu.utils.JWTUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PiProductServiceImpl implements PiProductService {

    @Autowired
    private PiProductMapper piProductMapper;

    @Autowired
    private UserMapper userMapper;

    /**
     * 获取最新的5条皮帖
     * @return
     */
    @Override
    public StateResult findNewPiProductArticle() {
        List<PiProduct> theNewPiProductArticle = this.piProductMapper.findTheNewPiProductArticle();
        return StateResult.getExample(theNewPiProductArticle,"获取成功","获取失败",theNewPiProductArticle);
    }

    @Override
    public StateResult sendPiProduct(PiProduct piProduct,String totken) {
        piProduct.setUserId(Integer.parseInt(JWTUtils.verifyToken(totken).getClaim("userId").asString()));
        if(!StringUtils.isEmpty(piProduct.getId())){
            /*编辑*/
            boolean status;
            /*有价格就是皮物，没有价格就是皮帖*/
            if(piProduct.getPrice() != null){
                status = this.piProductMapper.editPiProduct(piProduct);
            }else{
                status = this.piProductMapper.editPiProductArticle(piProduct);
            }
            if(status){
                return StateResult.getExample(true,"编辑成功",null);
            }else{
                return StateResult.getExample(false,"编辑失败",null);
            }
        }
        /*设置用户Id*/
        piProduct.setId(UUID.randomUUID().toString().replace("-","").substring(0,16));
        if(this.piProductMapper.sendPiProduct(piProduct)){
            return StateResult.getExample(true,"发布成功",null);
        }else{
            return StateResult.getExample(false,"发布失败",null);
        }
    }

    @Override
    public StateResult findPiProductByUserId(PiPage piPage, String token) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        DecodedJWT decodedJWT = JWTUtils.verifyToken(token);
        List<PiProduct> piProductOfUser;
        switch (piPage.getType()){
            //1:在售，2:已售，3:下架，4:皮帖
            case 1:
                piProductOfUser= this.piProductMapper.findOnSalePiProductByUserId(Integer.parseInt(decodedJWT.getClaim("userId").asString()));
                break;
            case 2:
                piProductOfUser= this.piProductMapper.findSoldOutPiProductByUserId(Integer.parseInt(decodedJWT.getClaim("userId").asString()));
                break;
            case 3:
                piProductOfUser= this.piProductMapper.findDownShelfPiProductByUserId(Integer.parseInt(decodedJWT.getClaim("userId").asString()));
                break;
            case 4:
                piProductOfUser= this.piProductMapper.findMessagePiProductByUserId(Integer.parseInt(decodedJWT.getClaim("userId").asString()));
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + piPage.getType());
        }
        if(piProductOfUser != null ){
            PageInfo piProductPageInfo = new PageInfo(piProductOfUser);
            return StateResult.getExample(true,"获取皮物成功",piProductPageInfo);
        }else{
            return StateResult.getExample(false,"获取皮物失败",null);
        }
    }

    /**
     * 获取皮物，此接口是用到用户内
     * @param id
     * @param token
     * @return
     */
    @Override
    public StateResult getPiProductByUserId(String id, String token) {
        PiProduct  piProduct= this.piProductMapper.findPiProductByUserId(id, Integer.parseInt(JWTUtils.verifyToken(token).getClaim("userId").asString()));
        if(piProduct != null){
            return StateResult.getExample(true,"获取成功",piProduct);
        }else{
            return StateResult.getExample(false,"获取失败，你在做什么操作？请联系管理员",null);
        }
    }

    /**
     * 下架皮物
     * @param id
     * @param token
     * @return
     */
    @Override
    public StateResult downPiProductById(String id, String token) {
        if(this.piProductMapper.downPiProductById(id,Integer.parseInt(JWTUtils.verifyToken(token).getClaim("userId").asString()))){
            return StateResult.getExample(true,"下架皮物成功",null);
        }else{
            return StateResult.getExample(false,"下架皮物失败，请联系管理员",null);
        }
    }

    /**
     * 获取皮物，获取没有被禁止的皮物
     * @param id
     * @return
     */
    @Override
    public StateResult getNormalPiProduct(String id) {
        PiProduct normalPiProduct = this.piProductMapper.findNormalPiProduct(id);
        return StateResult.getExample(normalPiProduct,"获取皮物成功","访问了一个不存在/或被禁止 的皮物",normalPiProduct);
    }

    /**
     * 分页获取当前分类下的皮物<br>
     * @param piPage
     * @return
     */
    @Override
    public StateResult findPiProductByClassIdAndPage(PiPage piPage) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<PiProduct> piProducts= this.piProductMapper.findPiProductByClassIdAndPage(piPage);
        PageInfo pageInfo = new PageInfo(piProducts);
        /*判断是否是搜索*/
        if(StringUtils.isEmpty(piPage.getKeywords())){
            return StateResult.getExample(piProducts,"获取分类皮物成功","获取分类皮物失败，当前分类没有皮物",pageInfo,null);
        }else{
            return StateResult.getExample(piProducts,"获取分类皮物成功","当前关键字没有皮物",pageInfo,null);
        }
    }

    /**
     * 分页查询，更多的皮帖
     * @return
     */
    @Override
    public StateResult findMorePiProduct(PiPage piPage) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<PiProduct> morePiProduct = this.piProductMapper.findMorePiProduct(piPage);
        return StateResult.getExample(morePiProduct,"获取成功","没有皮帖",new PageInfo(morePiProduct),null);
    }

    /**
     * 获取用户主页的皮物，下面的那个方法，真就改了一个数据而已
     * @param piPage
     * @return
     */
    @Override
    public StateResult findUserSpacePiProduct(PiPage piPage) {
        if(StringUtils.isEmpty(piPage.getUsername())) return StateResult.getExample(false,"没有用户名查个毛",null);
        User user= this.userMapper.getUserByUsername(piPage.getUsername());
        if(user == null) return StateResult.getExample(false,"都没有这个用户，查个毛啊",null);
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<PiProduct> piProducts = this.piProductMapper.findUserSpacePiProduct(piPage.getKeywords(), user.getId());
        return StateResult.getExample(piProducts,"获取主页皮物成功","获取皮物失败",new PageInfo(piProducts),null);
    }

    @Override
    public StateResult findUserSpacePiArticle(PiPage piPage) {
        if(StringUtils.isEmpty(piPage.getUsername())) return StateResult.getExample(false,"没有用户名查个毛",null);
        User user= this.userMapper.getUserByUsername(piPage.getUsername());
        if(user == null) return StateResult.getExample(false,"都没有这个用户，查个毛啊",null);
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<PiProduct> piProducts = this.piProductMapper.findUserSpacePiArticle(piPage.getKeywords(), user.getId());
        return StateResult.getExample(piProducts,"获取主页皮物成功","获取皮物失败",new PageInfo(piProducts),null);
    }

    /**
     * 文章访问量
     * @param pid
     * @return
     */
    @Override
    public StateResult addPiProductWatchNumber(String pid) {
        return StateResult.getExample(this.piProductMapper.addPiProductWatchNumber(pid),null,null);
    }
}

package com.pipihao.piyu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pipihao.piyu.common.PiPage;
import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.PiProductMapper;
import com.pipihao.piyu.mapper.TradingMapper;
import com.pipihao.piyu.mapper.UserMapper;
import com.pipihao.piyu.mapper.WalletMapper;
import com.pipihao.piyu.pojo.PiProduct;
import com.pipihao.piyu.pojo.Trading;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.pojo.Wallet;
import com.pipihao.piyu.service.TradingService;
import com.pipihao.piyu.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.plaf.nimbus.State;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/2 11:03
 */
@Service
public class TradingServiceImpl implements TradingService {
    @Autowired
    private TradingMapper tradingMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PiProductMapper piProductMapper;

    @Autowired
    private WalletMapper walletMapper;

    /**
     * 交易
     * @param trading
     * @param token
     * @return
     */
    @Override
    public StateResult piProductTrade(Trading trading, String token) {
        PiProduct piProduct= this.piProductMapper.findNormalPiProduct(trading.getPiProductId());
        /*判断皮物状态*/
        if(piProduct.getDownShelf() || piProduct.getSoldStatus()) return StateResult.getExample(false,"自己不能购买自己的皮物",null);
        String piUsername = piProduct.getMaker().getUsername();
        String tokenUserName = JWTUtils.getValue("username",token);
        Integer userId= Integer.parseInt(JWTUtils.getValue("userId",token));
        /*判断是否购买自己的皮物*/
        if(tokenUserName.equals(piUsername)) return StateResult.getExample(false,"自己不能购买自己的皮物",null);
        /*判断余额*/
        Wallet wallet= this.walletMapper.findWalletByUserId(userId);
        /*交易金额*/
        BigDecimal money= piProduct.getPrice().add(piProduct.getFreight());
        // - 1 小于，0等于，1，大于 判断能否购买
        if(wallet.getBalance().compareTo(money) == -1 ) return StateResult.getExample(false,"余额不足",null);
        /*改变皮物状态*/
        if(!this.piProductMapper.changePiProductSold(piProduct)) return StateResult.getExample(false,"皮物错误，请联系管理员",null);
        /*生成TradingId*/
        String tid = UUID.randomUUID().toString().replace("-","").substring(0,30);
        trading.setId(tid);
        /*添加Trading*/
        trading.setType(1);
        /*原价加上运费*/
        trading.setMoney(money);
        trading.setRUserId(piProduct.getMaker().getId());//售卖者的id
        trading.setUserId(userId);//购买者的id
        trading.setStatus(true);
        // 还有写到数据库
        if(!this.tradingMapper.piProductTrading(trading)) return StateResult.getExample(false,"交易失败，请联系管理员",null);
        /*在购买用户账户减钱*/
        this.walletMapper.reduceMoney(money,userId);
        /*在老板用户账户加钱*/
        this.walletMapper.addMoney(money,piProduct.getMaker().getId());
        return StateResult.getExample(true,"交易成功",tid);
    }

    /**
     * 分页查询交易记录
     * @param token
     * @return
     */
    @Override
    public StateResult findTradingHistory(PiPage piPage,String token) {
        PageHelper.startPage(piPage.getPage(),piPage.getSize());
        List<Trading> tradings= this.tradingMapper.findTradingHistoryByUserId(Integer.parseInt(JWTUtils.getValue("userId", token)),piPage.getKeywords());
        PageInfo pageInfo = new PageInfo(tradings);
        return StateResult.getExample(tradings,"获取成功","当前用户没有交易记录",pageInfo,null);
    }

    /**
     * 获取皮志时间
     * @param username
     * @return
     */
    @Override
    public StateResult findUserPayLog(String username) {
        User user = this.userMapper.getUserByUsername(username);
        if(user == null) return StateResult.getExample(false,"用户都不存在，查个毛",null);
        List<Map<String, Object>> logs= this.tradingMapper.findUserPayLog(user.getId());
        return StateResult.getExample(logs,"获取皮志成功","获取皮志失败",logs,null);
    }

    /**
     * 获取皮志时间区间的交易详情
     * @param date
     * @param username
     * @return
     */
    @Override
    public StateResult findUserRealPayLog(String date, String username) {
        User user = this.userMapper.getUserByUsername(username);
        if(user == null) return StateResult.getExample(false,"没有这个用户，查个毛啊",null);
        Map<String,Object> map = new HashMap<>();
        /*获取支付日志*/
        List<PiProduct> payLogPiProductByDate= this.piProductMapper.findPayLogPiProductByDate(date, user.getId());
        List<PiProduct> incomeLogPiProductByDate = this.piProductMapper.findIncomeLogPiProductByDate(date, user.getId());
        map.put("pay",payLogPiProductByDate);
        map.put("income",incomeLogPiProductByDate);
        return StateResult.getExample(true,"获取详情皮志成功",map);
    }
}

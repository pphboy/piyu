package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 交易类
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class Trading implements Serializable {
    private String id; //这里使用UUID
    private Integer userId; //出钱的用户
    private Integer rUserId;// 收钱的用户
    private Integer type; //1.交易，2充值，3转账
    private BigDecimal money; //交易金额
    private String piProductId; // 皮物，没有为 null
    private Integer addressId;
    private PiProduct piProduct;
    private Boolean status; //是否支出 ，如果需要支付的时候，则直接设置成true，然后交易成功，如果订单取消，设置成false
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;
}

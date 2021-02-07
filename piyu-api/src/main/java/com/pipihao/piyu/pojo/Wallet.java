package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 钱包
 */

@Data
@NoArgsConstructor
@Accessors(chain = true)
@ToString
public class Wallet implements Serializable {
    @JsonIgnore
    private int userId;
    private BigDecimal balance; // 余额
    @JsonIgnore
    private Date firstDate; // 创建时间
    @JsonIgnore
    private Date lastTradingTime; //最后交易时间 收入，支出）改变的时间
    private BigDecimal totalRevenue; //收入总额
    private BigDecimal totalExpenditure; // 支出总额
}

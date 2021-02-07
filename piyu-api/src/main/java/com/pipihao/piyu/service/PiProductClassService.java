package com.pipihao.piyu.service;

import com.pipihao.piyu.common.StateResult;

public interface PiProductClassService {

    /**
     * 查询所有皮物分类,感觉这个也可以放到搜索内
     * @return
     */
    StateResult findAllPiProductClass();
}

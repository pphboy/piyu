package com.pipihao.piyu.service.impl;

import com.pipihao.piyu.common.StateResult;
import com.pipihao.piyu.mapper.PiProductClassMapper;
import com.pipihao.piyu.service.PiProductClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PiProductClassServiceImpl implements PiProductClassService {

    @Autowired
    private PiProductClassMapper piProductClassMapper;

    @Override
    public StateResult findAllPiProductClass() {
        return StateResult.getExample(true,"数据在data内","",this.piProductClassMapper.findAllPiProductClass(),null);
    }
}

package com.pipihao;

import com.pipihao.piyu.common.StateResult;
import org.junit.Test;

public class StateResultTest {

    /**
     * 测试StateResult的对象
     */
    @Test
    public void testExample(){
        System.out.println(StateResult.getExample(true,"测试",null).hashCode());
        System.out.println(StateResult.getExample(true,"测试2",null).hashCode());

        System.out.println(StateResult.example.hashCode());
        System.out.println(StateResult.example.hashCode());
    }
}

package com.pipihao.service;

import com.pipihao.piyu.PiYuApplication;
import com.pipihao.piyu.pojo.User;
import com.pipihao.piyu.pojo.UserAddress;
import com.pipihao.piyu.service.UserAddressService;
import com.pipihao.piyu.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = PiYuApplication.class)
public class UserAddressServiceTest {

    @Autowired
    UserAddressService userAddressService;

    String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTIzMTkwNDUsInVzZXJJZCI6IjEwMDA2IiwidXNlcm5hbWUiOiJwaXBpaGFvIn0.UgkSH3U4AizCvjS2esmlCP8089Jwaf8tednOcCcrWb4";

    @Test
    public void testFindUserAddress(){
        System.out.println(userAddressService.findUserAddressByUserId(token));
    }

    @Test
    public void testSendUserAddress(){
        UserAddress userAddress = new UserAddress();
        userAddress.setDailedAddress("小皮").setCity("衡阳市").setCounty("衡阳县").setProvince("湖南省").setName("小皮").setPhone("17777777777");
        userAddressService.sendUserAddress(userAddress,token);
    }

    @Test
    public void updateUserAddress(){
        UserAddress userAddress = new UserAddress();
        userAddress.setDailedAddress("小皮123").setCity("衡阳市").setCounty("衡阳县").setProvince("湖南省").setName("小皮123").setPhone("17777777777").setId(2);
        System.out.println(userAddressService.sendUserAddress(userAddress,token));;
    }

    @Test
    public void testDeleteUserAddress(){
        System.out.println(userAddressService.deleteUserAddress(new UserAddress().setId(2),token));
    }

    @Test
    public void testSetDefaultUserAddress(){
        System.out.println(userAddressService.setUserAddressDefault(new UserAddress().setId(1),token));
    }
}

package com.glsx.oms.fcadmin.biz.auth.nameauth.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.auth.nameauth.model.Nameauth;
import com.glsx.oms.fcadmin.biz.auth.nameauth.rest.NameauthClient;

/**
 * 流量卡实名认证 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class NameauthClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(NameauthClientTest.class);
    
    @Autowired
    private NameauthClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getNameauth = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteNameauth = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Nameauth nameauth = new Nameauth();
        nameauth.setId(9999999);
        LOGGER.info("saveNameauth = {}", client.save(nameauth));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllNameauth = {}", client.getAll());
    }
    
}
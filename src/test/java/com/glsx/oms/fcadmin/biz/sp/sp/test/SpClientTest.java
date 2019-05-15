package com.glsx.oms.fcadmin.biz.sp.sp.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.sp.sp.model.Sp;
import com.glsx.oms.fcadmin.biz.sp.sp.rest.SpClient;

/**
 * 流量平台商户信息 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class SpClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(SpClientTest.class);
    
    @Autowired
    private SpClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getSp = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteSp = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Sp sp = new Sp();
        sp.setSpId(9999999);
        sp.setLastOperatorId(9999999);
        sp.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveSp = {}", client.save(sp));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllSp = {}", client.getAll());
    }
    
}
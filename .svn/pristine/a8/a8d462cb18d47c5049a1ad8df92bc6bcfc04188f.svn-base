package com.glsx.oms.fcadmin.biz.card.lifecycle.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.card.lifecycle.model.LifeCycle;
import com.glsx.oms.fcadmin.biz.card.lifecycle.rest.LifeCycleClient;

/**
 *  单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class LifeCycleClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(LifeCycleClientTest.class);
    
    @Autowired
    private LifeCycleClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getLifeCycle = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteLifeCycle = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        LifeCycle lifeCycle = new LifeCycle();
        lifeCycle.setCardId(9999999);
        lifeCycle.setLastOperatorId(9999999);
        lifeCycle.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveLifeCycle = {}", client.save(lifeCycle));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllLifeCycle = {}", client.getAll());
    }
    
}
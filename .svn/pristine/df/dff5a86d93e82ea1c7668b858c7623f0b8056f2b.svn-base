package com.glsx.oms.fcadmin.biz.recovery.recycle.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.Recycle;
import com.glsx.oms.fcadmin.biz.recovery.recycle.rest.RecycleClient;

/**
 * 流量卡回收处理 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class RecycleClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(RecycleClientTest.class);
    
    @Autowired
    private RecycleClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getRecycle = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteRecycle = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Recycle recycle = new Recycle();
        recycle.setRecycleId(9999999);
        recycle.setLastOperatorId(9999999);
        recycle.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveRecycle = {}", client.save(recycle));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllRecycle = {}", client.getAll());
    }
    
}
package com.glsx.oms.fcadmin.biz.card.flowpool.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPool;
import com.glsx.oms.fcadmin.biz.card.flowpool.rest.FlowPoolClient;

/**
 * 流量池定义 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class FlowPoolClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPoolClientTest.class);
    
    @Autowired
    private FlowPoolClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getFlowPool = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteFlowPool = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        FlowPool flowPool = new FlowPool();
        flowPool.setFlowpoolId(9999999);
        flowPool.setFlowpoolName("ore.framework.test");
        flowPool.setOpId(9999999);
        flowPool.setLastOperatorId(9999999);
        flowPool.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveFlowPool = {}", client.save(flowPool));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllFlowPool = {}", client.getAll());
    }
    
}
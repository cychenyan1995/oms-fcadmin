package com.glsx.oms.fcadmin.biz.sp.flowservice.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;
import com.glsx.oms.fcadmin.biz.sp.flowservice.rest.FlowServiceClient;

/**
 * 服务商流量服务包 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class FlowServiceClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowServiceClientTest.class);
    
    @Autowired
    private FlowServiceClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getFlowService = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteFlowService = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        FlowService flowService = new FlowService();
        flowService.setFlowservId(9999999);
        flowService.setFlowservName("ore.framework.test");
        flowService.setLastOperatorId(9999999);
        flowService.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveFlowService = {}", client.save(flowService));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllFlowService = {}", client.getAll());
    }
    
}
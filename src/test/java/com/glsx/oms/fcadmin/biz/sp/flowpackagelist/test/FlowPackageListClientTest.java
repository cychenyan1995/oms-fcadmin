package com.glsx.oms.fcadmin.biz.sp.flowpackagelist.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model.FlowPackageList;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.rest.FlowPackageListClient;

/**
 * 服务商流量套歺 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class FlowPackageListClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPackageListClientTest.class);
    
    @Autowired
    private FlowPackageListClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getFlowPackageList = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteFlowPackageList = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        FlowPackageList flowPackageList = new FlowPackageList();
        flowPackageList.setFlowlistId(9999999);
        flowPackageList.setLastOperatorId(9999999);
        flowPackageList.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveFlowPackageList = {}", client.save(flowPackageList));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllFlowPackageList = {}", client.getAll());
    }
    
}
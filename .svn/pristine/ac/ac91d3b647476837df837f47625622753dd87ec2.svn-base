package com.glsx.oms.fcadmin.biz.pkg.flowpackage.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.rest.FlowPackageClient;

/**
 * 服务商流量套歺 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class FlowPackageClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPackageClientTest.class);
    
    @Autowired
    private FlowPackageClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getFlowPackage = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteFlowPackage = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        FlowPackage flowPackage = new FlowPackage();
        flowPackage.setPackageId(9999999);
        flowPackage.setPackageName("ore.framework.test");
        flowPackage.setLastOperatorId(9999999);
        flowPackage.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveFlowPackage = {}", client.save(flowPackage));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllFlowPackage = {}", client.getAll());
    }
    
}
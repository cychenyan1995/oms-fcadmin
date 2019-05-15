package com.glsx.oms.fcadmin.biz.op.networkaccess.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.op.networkaccess.model.NetworkAccess;
import com.glsx.oms.fcadmin.biz.op.networkaccess.rest.NetworkAccessClient;

/**
 * 流量平台电信运营商通讯计划定义 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class NetworkAccessClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(NetworkAccessClientTest.class);
    
    @Autowired
    private NetworkAccessClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getNetworkAccess = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteNetworkAccess = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        NetworkAccess networkAccess = new NetworkAccess();
        networkAccess.setAccessId(9999999);
        networkAccess.setLastOperatorId(9999999);
        networkAccess.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveNetworkAccess = {}", client.save(networkAccess));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllNetworkAccess = {}", client.getAll());
    }
    
}
package com.glsx.oms.fcadmin.biz.order.outorder.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.order.outorder.model.OutOrder;
import com.glsx.oms.fcadmin.biz.order.outorder.rest.OutOrderClient;

/**
 * 流量卡出库订单管理 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class OutOrderClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(OutOrderClientTest.class);
    
    @Autowired
    private OutOrderClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getOutOrder = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteOutOrder = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        OutOrder outOrder = new OutOrder();
        outOrder.setOutOrderId(9999999);
        outOrder.setLastOperatorId(9999999);
        outOrder.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveOutOrder = {}", client.save(outOrder));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllOutOrder = {}", client.getAll());
    }
    
}
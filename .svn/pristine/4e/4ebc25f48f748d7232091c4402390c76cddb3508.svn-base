package com.glsx.oms.fcadmin.biz.card.orderinfo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.card.orderinfo.model.OrderInfo;
import com.glsx.oms.fcadmin.biz.card.orderinfo.rest.OrderInfoClient;

/**
 * 流量卡入库订单管理 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class OrderInfoClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(OrderInfoClientTest.class);
    
    @Autowired
    private OrderInfoClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getOrderInfo = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteOrderInfo = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setInStkOrderId(9999999);
        orderInfo.setLastOperatorId(9999999);
        orderInfo.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveOrderInfo = {}", client.save(orderInfo));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllOrderInfo = {}", client.getAll());
    }
    
}
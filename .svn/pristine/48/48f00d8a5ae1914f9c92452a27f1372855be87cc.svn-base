package com.glsx.oms.fcadmin.biz.recharge.rechargeorder.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.model.RechargeOrder;
import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.rest.RechargeOrderClient;

/**
 * 充值订单表 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class RechargeOrderClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(RechargeOrderClientTest.class);
    
    @Autowired
    private RechargeOrderClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getRechargeOrder = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteRechargeOrder = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        RechargeOrder rechargeOrder = new RechargeOrder();
        rechargeOrder.setOrderId(9999999);
        LOGGER.info("saveRechargeOrder = {}", client.save(rechargeOrder));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllRechargeOrder = {}", client.getAll());
    }
    
}
package com.glsx.oms.fcadmin.biz.card.flowcard.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCard;
import com.glsx.oms.fcadmin.biz.card.flowcard.rest.FlowCardClient;

/**
 * 流量平台中心卡信息 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class FlowCardClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowCardClientTest.class);
    
    @Autowired
    private FlowCardClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getFlowCard = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteFlowCard = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        FlowCard flowCard = new FlowCard();
        flowCard.setCardId(9999999);
        flowCard.setCardNo("ore.framework.test");
        flowCard.setImsi("ore.framework.test");
        flowCard.setIccid("ore.framework.test");
        flowCard.setLastOperatorId(9999999);
        flowCard.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveFlowCard = {}", client.save(flowCard));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllFlowCard = {}", client.getAll());
    }
    
}
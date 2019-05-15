package com.glsx.oms.fcadmin.biz.op.op.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.op.op.model.Op;
import com.glsx.oms.fcadmin.biz.op.op.rest.OpClient;

/**
 * 网络运营商 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class OpClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(OpClientTest.class);
    
    @Autowired
    private OpClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getOp = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteOp = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Op op = new Op();
        op.setOpId(9999999);
        op.setOpCode(9999999);
        op.setOpName("ore.framework.test");
        op.setOpDesc("ore.framework.test");
        op.setLastOperatorId(9999999);
        op.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveOp = {}", client.save(op));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllOp = {}", client.getAll());
    }
    
}
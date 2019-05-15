package com.glsx.oms.fcadmin.biz.recovery.transfer.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.Transfer;
import com.glsx.oms.fcadmin.biz.recovery.transfer.rest.TransferClient;

/**
 * 流量卡迁移记录 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class TransferClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(TransferClientTest.class);
    
    @Autowired
    private TransferClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getTransfer = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteTransfer = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Transfer transfer = new Transfer();
        transfer.setTransId(9999999);
        transfer.setSrcImsi("ore.framework.test");
        transfer.setDstImsi("ore.framework.test");
        transfer.setLastOperatorId(9999999);
        transfer.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveTransfer = {}", client.save(transfer));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllTransfer = {}", client.getAll());
    }
    
}
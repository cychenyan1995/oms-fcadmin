package com.glsx.oms.fcadmin.biz.card.changelog.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.card.changelog.model.ChangeLog;
import com.glsx.oms.fcadmin.biz.card.changelog.rest.ChangeLogClient;

/**
 * 流量卡变更日志 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class ChangeLogClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(ChangeLogClientTest.class);
    
    @Autowired
    private ChangeLogClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getChangeLog = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteChangeLog = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        ChangeLog changeLog = new ChangeLog();
        changeLog.setId(9999999);
        changeLog.setIccid("ore.framework.test");
        changeLog.setChangeType("ore.framework.test");
        changeLog.setChangeBefore("ore.framework.test");
        changeLog.setChangeAfter("ore.framework.test");
        changeLog.setLastOperatorId(9999999);
        changeLog.setLastOperatorName("ore.framework.test");
        LOGGER.info("saveChangeLog = {}", client.save(changeLog));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllChangeLog = {}", client.getAll());
    }
    
}
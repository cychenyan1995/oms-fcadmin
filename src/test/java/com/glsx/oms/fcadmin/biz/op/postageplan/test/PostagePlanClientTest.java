package com.glsx.oms.fcadmin.biz.op.postageplan.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.op.postageplan.model.PostagePlan;
import com.glsx.oms.fcadmin.biz.op.postageplan.rest.PostagePlanClient;

/**
 * 运营商资费计划 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class PostagePlanClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(PostagePlanClientTest.class);
    
    @Autowired
    private PostagePlanClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getPostagePlan = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deletePostagePlan = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        PostagePlan postagePlan = new PostagePlan();
        postagePlan.setPostageId(9999999);
        postagePlan.setPostageCode(9999999);
        postagePlan.setPostageName("ore.framework.test");
        postagePlan.setOpId(9999999);
        postagePlan.setPlanFlow(9999999);
        postagePlan.setOverUnit("ore.framework.test");
        postagePlan.setLastOperatorId(9999999);
        postagePlan.setLastOperatorName("ore.framework.test");
        LOGGER.info("savePostagePlan = {}", client.save(postagePlan));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllPostagePlan = {}", client.getAll());
    }
    
}
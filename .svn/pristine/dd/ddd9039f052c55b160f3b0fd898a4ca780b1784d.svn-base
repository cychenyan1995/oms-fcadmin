package com.glsx.oms.fcadmin.biz.card.postage.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.card.postage.model.Postage;
import com.glsx.oms.fcadmin.biz.card.postage.rest.PostageClient;

/**
 * 流量池与资费计划关联表 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class PostageClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(PostageClientTest.class);
    
    @Autowired
    private PostageClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getPostage = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deletePostage = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Postage postage = new Postage();
        postage.setPoolPostagelId(9999999);
        postage.setPostageId(9999999);
        postage.setLastOperatorId(9999999);
        postage.setLastOperatorName("ore.framework.test");
        LOGGER.info("savePostage = {}", client.save(postage));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllPostage = {}", client.getAll());
    }
    
}
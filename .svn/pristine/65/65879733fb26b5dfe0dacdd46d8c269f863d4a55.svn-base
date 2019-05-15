package com.glsx.oms.fcadmin.biz.download.task.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.glsx.oms.fcadmin.OMSTestBootStarter;
import com.glsx.oms.fcadmin.biz.download.task.model.Task;
import com.glsx.oms.fcadmin.biz.download.task.rest.TaskClient;

/**
 * 异步任务表 单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = OMSTestBootStarter.class)
public class TaskClientTest
{
    private final static Logger LOGGER = LoggerFactory.getLogger(TaskClientTest.class);
    
    @Autowired
    private TaskClient client;
    
    @Test
    public void testGet()
    {
        LOGGER.info("getTask = {} \n", client.get(9999999));
    }
    
    @Test
    public void testDelete()
    {
        LOGGER.info("deleteTask = {}", client.delete(9999999));
    }
    
    @Test
    public void testSave()
    {
        Task task = new Task();
        task.setTaskId(9999999);
        task.setTaskName("ore.framework.test");
        task.setTaskDesc("ore.framework.test");
        task.setTaskSource("ore.framework.test");
        task.setTaskCreator("ore.framework.test");
        task.setTaskCreatorId("ore.framework.test");
        task.setTaskExecParams("ore.framework.test");
        task.setTaskExecResult("ore.framework.test");
        LOGGER.info("saveTask = {}", client.save(task));
    }
    
    @Test
    public void testGetAll()
    {
        LOGGER.info("getAllTask = {}", client.getAll());
    }
    
}
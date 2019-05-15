
package com.glsx.oms.fcadmin.biz.download.task.controller;

import java.util.List;

import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultCode;
import org.oreframework.web.ui.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glsx.oms.fcadmin.biz.download.task.model.Task;
import com.glsx.oms.fcadmin.biz.download.task.service.TaskService;
import com.glsx.oms.fcadmin.framework.Contants;

/**
 * 异步任务表 Controller
 */
@RestController
@RequestMapping(value = "/download")
public class TaskController
{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(TaskController.class);
    
    @Autowired
    private TaskService taskService;
    
    @RequestMapping(value = "/task/{id}", method = RequestMethod.GET)
    public ResultEntity<Task> get(@PathVariable("id") Integer id)
    {
        ResultEntity<Task> resultEntity = new ResultEntity<Task>();
        resultEntity.setData(taskService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/task/{id}", method = RequestMethod.DELETE)
    public ResultEntity<Task> delete(@PathVariable("id") Integer id)
    {
        ResultEntity<Task> resultEntity = new ResultEntity<Task>();
        taskService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete task id{}", id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/task", method = RequestMethod.POST)
    public ResultEntity<Task> save(@RequestBody Task task)
    {
        ResultEntity<Task> resultEntity = new ResultEntity<Task>();
        taskService.save(task);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/task", method = RequestMethod.GET)
    public ResponseEntity<Task> getAll(String keyWork, Pagination pagination)
    {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        Task task = new Task();
        task.setTaskCreator("admin");
        task.setTaskCreatorId("123456");
        task.setTaskSource(Contants.SYSTEM_NAME);
        task.setTaskName(keyWork);
        List<Task> taskList = taskService.getAll(task);
        
        ResponseEntity<Task> responseObject = new ResponseEntity<Task>();
        long total = ((Page<Task>)taskList).getTotal();
        responseObject.setData(taskList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/task/notify", method = RequestMethod.GET)
    public ResultEntity<List<Task>> getDownloadNotify()
    {
        Task task = new Task();
        task.setTaskCreator("admin");
        task.setTaskCreatorId("123456");
        task.setTaskSource(Contants.SYSTEM_NAME);
        List<Task> taskList = taskService.findNotDownload(task);
        ResultEntity<List<Task>> resultEntity = new ResultEntity<List<Task>>();
        resultEntity.setData(taskList);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/task/exportFile", method = RequestMethod.POST)
    public ResultEntity<Task> exportFile(@RequestBody Task taskQuery)
    {
        Task task = taskService.getById(taskQuery.getTaskId());
        task.setIsDownload(1);// 已下载
        taskService.updateDownloadStatus(task);
        ResultEntity<Task> resultEntity = new ResultEntity<Task>();
        resultEntity.setData(task);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }
    
}
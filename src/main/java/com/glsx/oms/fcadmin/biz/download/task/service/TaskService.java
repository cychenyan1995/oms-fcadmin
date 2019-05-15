package com.glsx.oms.fcadmin.biz.download.task.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glsx.oms.fcadmin.biz.download.task.mapper.TaskMapper;
import com.glsx.oms.fcadmin.biz.download.task.model.Task;

/**
 * 异步任务表 Service
 */
@Service
public class TaskService {
    
    @Autowired
    private TaskMapper taskMapper;
    
    public List<Task> getAll(Task task){
        return taskMapper.findAll(task);
    }

    public Task getById(Integer id) {
        return taskMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return taskMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(Task task) {
        return taskMapper.insert(task);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public void updateDownloadStatus(Task task) {
       
         taskMapper.updateDownloadStatus(task);
    }
    
    public List<Task> findNotDownload(Task task){
        return taskMapper.findNotDownload(task);
    }
   
}
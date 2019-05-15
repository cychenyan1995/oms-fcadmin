package com.glsx.oms.fcadmin.biz.download.task.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.download.task.model.Task;


/**
 * 异步任务表 Mapper
 */
@Mapper
public interface TaskMapper extends OreMapper<Task>{
    
    public void updateDownloadStatus(Task task);
    
    public List<Task> findAll(Task task);
    
    public List<Task> findNotDownload(Task task);
    
}
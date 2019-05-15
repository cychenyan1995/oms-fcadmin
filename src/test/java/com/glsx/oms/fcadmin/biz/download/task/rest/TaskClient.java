package com.glsx.oms.fcadmin.biz.download.task.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.download.task.model.Task;

/**
 * 异步任务表 调用REST资源
 */
@Component
public class TaskClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Task get(Integer id)
    {
        Task flowCard = restTemplate.getForEntity(url + "/download/task/" + id, Task.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/download/task/"+id);
        return id;
    }
    
    public Task save(Task flowCard)
    {
        return restTemplate.postForObject(url + "/download/task", flowCard, Task.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/download/task", PageInfo.class).getBody();
    }
    

    
}
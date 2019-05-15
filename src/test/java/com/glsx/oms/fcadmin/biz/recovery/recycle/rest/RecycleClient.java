package com.glsx.oms.fcadmin.biz.recovery.recycle.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.recovery.recycle.model.Recycle;

/**
 * 流量卡回收处理 调用REST资源
 */
@Component
public class RecycleClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Recycle get(Integer id)
    {
        Recycle flowCard = restTemplate.getForEntity(url + "/recovery/recycle/" + id, Recycle.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/recovery/recycle/"+id);
        return id;
    }
    
    public Recycle save(Recycle flowCard)
    {
        return restTemplate.postForObject(url + "/recovery/recycle", flowCard, Recycle.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/recovery/recycle", PageInfo.class).getBody();
    }
    

    
}
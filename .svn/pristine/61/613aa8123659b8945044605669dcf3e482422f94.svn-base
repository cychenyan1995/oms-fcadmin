package com.glsx.oms.fcadmin.biz.card.changelog.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.card.changelog.model.ChangeLog;

/**
 * 流量卡变更日志 调用REST资源
 */
@Component
public class ChangeLogClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public ChangeLog get(Integer id)
    {
        ChangeLog flowCard = restTemplate.getForEntity(url + "/card/changelog/" + id, ChangeLog.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/card/changelog/"+id);
        return id;
    }
    
    public ChangeLog save(ChangeLog flowCard)
    {
        return restTemplate.postForObject(url + "/card/changelog", flowCard, ChangeLog.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/card/changelog", PageInfo.class).getBody();
    }
    

    
}
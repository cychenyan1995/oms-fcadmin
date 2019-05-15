package com.glsx.oms.fcadmin.biz.card.lifecycle.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.card.lifecycle.model.LifeCycle;

/**
 *  调用REST资源
 */
@Component
public class LifeCycleClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public LifeCycle get(Integer id)
    {
        LifeCycle flowCard = restTemplate.getForEntity(url + "/card/lifecycle/" + id, LifeCycle.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/card/lifecycle/"+id);
        return id;
    }
    
    public LifeCycle save(LifeCycle flowCard)
    {
        return restTemplate.postForObject(url + "/card/lifecycle", flowCard, LifeCycle.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/card/lifecycle", PageInfo.class).getBody();
    }
    

    
}
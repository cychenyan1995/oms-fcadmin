package com.glsx.oms.fcadmin.biz.card.flowpool.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPool;

/**
 * 流量池定义 调用REST资源
 */
@Component
public class FlowPoolClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public FlowPool get(Integer id)
    {
        FlowPool flowCard = restTemplate.getForEntity(url + "/card/flowpool/" + id, FlowPool.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/card/flowpool/"+id);
        return id;
    }
    
    public FlowPool save(FlowPool flowCard)
    {
        return restTemplate.postForObject(url + "/card/flowpool", flowCard, FlowPool.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/card/flowpool", PageInfo.class).getBody();
    }
    

    
}
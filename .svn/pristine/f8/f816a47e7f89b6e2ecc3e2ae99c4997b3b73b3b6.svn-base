package com.glsx.oms.fcadmin.biz.card.flowcard.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCard;

/**
 * 流量平台中心卡信息 调用REST资源
 */
@Component
public class FlowCardClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public FlowCard get(Integer id)
    {
        FlowCard flowCard = restTemplate.getForEntity(url + "/card/flowcard/" + id, FlowCard.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/card/flowcard/"+id);
        return id;
    }
    
    public FlowCard save(FlowCard flowCard)
    {
        return restTemplate.postForObject(url + "/card/flowcard", flowCard, FlowCard.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/card/flowcard", PageInfo.class).getBody();
    }
    

    
}
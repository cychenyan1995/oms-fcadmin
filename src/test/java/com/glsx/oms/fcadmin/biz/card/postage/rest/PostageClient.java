package com.glsx.oms.fcadmin.biz.card.postage.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.card.postage.model.Postage;

/**
 * 流量池与资费计划关联表 调用REST资源
 */
@Component
public class PostageClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Postage get(Integer id)
    {
        Postage flowCard = restTemplate.getForEntity(url + "/card/postage/" + id, Postage.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/card/postage/"+id);
        return id;
    }
    
    public Postage save(Postage flowCard)
    {
        return restTemplate.postForObject(url + "/card/postage", flowCard, Postage.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/card/postage", PageInfo.class).getBody();
    }
    

    
}
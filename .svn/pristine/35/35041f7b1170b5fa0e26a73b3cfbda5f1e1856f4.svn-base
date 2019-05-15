package com.glsx.oms.fcadmin.biz.op.postageplan.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.op.postageplan.model.PostagePlan;

/**
 * 运营商资费计划 调用REST资源
 */
@Component
public class PostagePlanClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public PostagePlan get(Integer id)
    {
        PostagePlan flowCard = restTemplate.getForEntity(url + "/op/postageplan/" + id, PostagePlan.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/op/postageplan/"+id);
        return id;
    }
    
    public PostagePlan save(PostagePlan flowCard)
    {
        return restTemplate.postForObject(url + "/op/postageplan", flowCard, PostagePlan.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/op/postageplan", PageInfo.class).getBody();
    }
    

    
}
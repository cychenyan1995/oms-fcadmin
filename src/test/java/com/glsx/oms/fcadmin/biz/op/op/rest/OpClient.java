package com.glsx.oms.fcadmin.biz.op.op.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.op.op.model.Op;

/**
 * 网络运营商 调用REST资源
 */
@Component
public class OpClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Op get(Integer id)
    {
        Op flowCard = restTemplate.getForEntity(url + "/op/op/" + id, Op.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/op/op/"+id);
        return id;
    }
    
    public Op save(Op flowCard)
    {
        return restTemplate.postForObject(url + "/op/op", flowCard, Op.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/op/op", PageInfo.class).getBody();
    }
    

    
}
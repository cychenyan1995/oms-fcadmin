package com.glsx.oms.fcadmin.biz.sp.sp.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.sp.sp.model.Sp;

/**
 * 流量平台商户信息 调用REST资源
 */
@Component
public class SpClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Sp get(Integer id)
    {
        Sp flowCard = restTemplate.getForEntity(url + "/sp/sp/" + id, Sp.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/sp/sp/"+id);
        return id;
    }
    
    public Sp save(Sp flowCard)
    {
        return restTemplate.postForObject(url + "/sp/sp", flowCard, Sp.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/sp/sp", PageInfo.class).getBody();
    }
    

    
}
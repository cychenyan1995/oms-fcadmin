package com.glsx.oms.fcadmin.biz.auth.nameauth.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.auth.nameauth.model.Nameauth;

/**
 * 流量卡实名认证 调用REST资源
 */
@Component
public class NameauthClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Nameauth get(Integer id)
    {
        Nameauth flowCard = restTemplate.getForEntity(url + "/auth/nameauth/" + id, Nameauth.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/auth/nameauth/"+id);
        return id;
    }
    
    public Nameauth save(Nameauth flowCard)
    {
        return restTemplate.postForObject(url + "/auth/nameauth", flowCard, Nameauth.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/auth/nameauth", PageInfo.class).getBody();
    }
    

    
}
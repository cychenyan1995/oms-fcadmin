package com.glsx.oms.fcadmin.biz.op.networkaccess.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.op.networkaccess.model.NetworkAccess;

/**
 * 流量平台电信运营商通讯计划定义 调用REST资源
 */
@Component
public class NetworkAccessClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public NetworkAccess get(Integer id)
    {
        NetworkAccess flowCard = restTemplate.getForEntity(url + "/op/networkaccess/" + id, NetworkAccess.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/op/networkaccess/"+id);
        return id;
    }
    
    public NetworkAccess save(NetworkAccess flowCard)
    {
        return restTemplate.postForObject(url + "/op/networkaccess", flowCard, NetworkAccess.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/op/networkaccess", PageInfo.class).getBody();
    }
    

    
}
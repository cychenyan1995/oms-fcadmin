package com.glsx.oms.fcadmin.biz.recovery.transfer.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.recovery.transfer.model.Transfer;

/**
 * 流量卡迁移记录 调用REST资源
 */
@Component
public class TransferClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public Transfer get(Integer id)
    {
        Transfer flowCard = restTemplate.getForEntity(url + "/recovery/transfer/" + id, Transfer.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/recovery/transfer/"+id);
        return id;
    }
    
    public Transfer save(Transfer flowCard)
    {
        return restTemplate.postForObject(url + "/recovery/transfer", flowCard, Transfer.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/recovery/transfer", PageInfo.class).getBody();
    }
    

    
}
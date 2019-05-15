package com.glsx.oms.fcadmin.biz.order.outorder.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.order.outorder.model.OutOrder;

/**
 * 流量卡出库订单管理 调用REST资源
 */
@Component
public class OutOrderClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public OutOrder get(Integer id)
    {
        OutOrder flowCard = restTemplate.getForEntity(url + "/order/outorder/" + id, OutOrder.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/order/outorder/"+id);
        return id;
    }
    
    public OutOrder save(OutOrder flowCard)
    {
        return restTemplate.postForObject(url + "/order/outorder", flowCard, OutOrder.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/order/outorder", PageInfo.class).getBody();
    }
    

    
}
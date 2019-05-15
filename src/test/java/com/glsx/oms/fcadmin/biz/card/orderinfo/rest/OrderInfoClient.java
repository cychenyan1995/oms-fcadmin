package com.glsx.oms.fcadmin.biz.card.orderinfo.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.card.orderinfo.model.OrderInfo;

/**
 * 流量卡入库订单管理 调用REST资源
 */
@Component
public class OrderInfoClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public OrderInfo get(Integer id)
    {
        OrderInfo flowCard = restTemplate.getForEntity(url + "/card/orderinfo/" + id, OrderInfo.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/card/orderinfo/"+id);
        return id;
    }
    
    public OrderInfo save(OrderInfo flowCard)
    {
        return restTemplate.postForObject(url + "/card/orderinfo", flowCard, OrderInfo.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/card/orderinfo", PageInfo.class).getBody();
    }
    

    
}
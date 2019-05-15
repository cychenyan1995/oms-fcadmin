package com.glsx.oms.fcadmin.biz.recharge.rechargeorder.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.model.RechargeOrder;

/**
 * 充值订单表 调用REST资源
 */
@Component
public class RechargeOrderClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public RechargeOrder get(Integer id)
    {
        RechargeOrder flowCard = restTemplate.getForEntity(url + "/recharge/rechargeorder/" + id, RechargeOrder.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/recharge/rechargeorder/"+id);
        return id;
    }
    
    public RechargeOrder save(RechargeOrder flowCard)
    {
        return restTemplate.postForObject(url + "/recharge/rechargeorder", flowCard, RechargeOrder.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/recharge/rechargeorder", PageInfo.class).getBody();
    }
    

    
}
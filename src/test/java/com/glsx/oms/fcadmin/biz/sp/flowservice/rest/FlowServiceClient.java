package com.glsx.oms.fcadmin.biz.sp.flowservice.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;

/**
 * 服务商流量服务包 调用REST资源
 */
@Component
public class FlowServiceClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public FlowService get(Integer id)
    {
        FlowService flowCard = restTemplate.getForEntity(url + "/sp/flowservice/" + id, FlowService.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/sp/flowservice/"+id);
        return id;
    }
    
    public FlowService save(FlowService flowCard)
    {
        return restTemplate.postForObject(url + "/sp/flowservice", flowCard, FlowService.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/sp/flowservice", PageInfo.class).getBody();
    }
    

    
}
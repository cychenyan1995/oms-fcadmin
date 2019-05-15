package com.glsx.oms.fcadmin.biz.pkg.flowpackage.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;

/**
 * 服务商流量套歺 调用REST资源
 */
@Component
public class FlowPackageClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public FlowPackage get(Integer id)
    {
        FlowPackage flowCard = restTemplate.getForEntity(url + "/pkg/flowpackage/" + id, FlowPackage.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/pkg/flowpackage/"+id);
        return id;
    }
    
    public FlowPackage save(FlowPackage flowCard)
    {
        return restTemplate.postForObject(url + "/pkg/flowpackage", flowCard, FlowPackage.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/pkg/flowpackage", PageInfo.class).getBody();
    }
    

    
}
package com.glsx.oms.fcadmin.biz.sp.flowpackagelist.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.github.pagehelper.PageInfo;

import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model.FlowPackageList;

/**
 * 服务商流量套歺 调用REST资源
 */
@Component
public class FlowPackageListClient
{
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${test.path}")
    private String url;
    
    public FlowPackageList get(Integer id)
    {
        FlowPackageList flowCard = restTemplate.getForEntity(url + "/sp/flowpackagelist/" + id, FlowPackageList.class).getBody();
        return flowCard;
    }
    
    public Integer delete(Integer id)
    {
        restTemplate.delete(url + "/sp/flowpackagelist/"+id);
        return id;
    }
    
    public FlowPackageList save(FlowPackageList flowCard)
    {
        return restTemplate.postForObject(url + "/sp/flowpackagelist", flowCard, FlowPackageList.class);
    }
    
    public PageInfo<?> getAll()
    {
        return restTemplate.getForEntity(url + "/sp/flowpackagelist", PageInfo.class).getBody();
    }
    

    
}
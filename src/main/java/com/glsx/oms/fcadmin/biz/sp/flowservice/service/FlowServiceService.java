package com.glsx.oms.fcadmin.biz.sp.flowservice.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;
import com.glsx.oms.fcadmin.biz.sp.flowservice.mapper.FlowServiceMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 服务商流量服务包 Service
 */
@Service
public class FlowServiceService {
    
    @Autowired
    private FlowServiceMapper flowServiceMapper;
    
    public List<FlowService> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return flowServiceMapper.selectAll();
    }

    public FlowService getById(Integer id) {
        return flowServiceMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return flowServiceMapper.deleteByPrimaryKey(id);
    }

    public int save(FlowService flowService) {
        /*if (country.getId() != null) {
            flowServiceMapper.updateByPrimaryKey(flowService);
        } else {
            return flowServiceMapper.insert(flowService);
        }*/
        return flowServiceMapper.insert(flowService);
    }
   
}
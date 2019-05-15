package com.glsx.oms.fcadmin.biz.sp.flowpackagelist.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model.FlowPackageList;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.mapper.FlowPackageListMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 服务商流量套歺 Service
 */
@Service
public class FlowPackageListService {
    
    @Autowired
    private FlowPackageListMapper flowPackageListMapper;
    
    public List<FlowPackageList> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return flowPackageListMapper.selectAll();
    }

    public FlowPackageList getById(Integer id) {
        return flowPackageListMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return flowPackageListMapper.deleteByPrimaryKey(id);
    }

    public int save(FlowPackageList flowPackageList) {
        /*if (country.getId() != null) {
            flowPackageListMapper.updateByPrimaryKey(flowPackageList);
        } else {
            return flowPackageListMapper.insert(flowPackageList);
        }*/
        return flowPackageListMapper.insert(flowPackageList);
    }
   
}
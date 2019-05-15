package com.glsx.oms.fcadmin.biz.op.networkaccess.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.op.networkaccess.model.NetworkAccess;
import com.glsx.oms.fcadmin.biz.op.networkaccess.mapper.NetworkAccessMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 流量平台电信运营商通讯计划定义 Service
 */
@Service
public class NetworkAccessService {
    
    @Autowired
    private NetworkAccessMapper networkAccessMapper;
    
    public List<NetworkAccess> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return networkAccessMapper.selectAll();
    }

    public NetworkAccess getById(Integer id) {
        return networkAccessMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return networkAccessMapper.deleteByPrimaryKey(id);
    }

    public int save(NetworkAccess networkAccess) {
        /*if (country.getId() != null) {
            networkAccessMapper.updateByPrimaryKey(networkAccess);
        } else {
            return networkAccessMapper.insert(networkAccess);
        }*/
        return networkAccessMapper.insert(networkAccess);
    }
   
}
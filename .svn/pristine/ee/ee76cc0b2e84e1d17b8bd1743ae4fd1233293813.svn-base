package com.glsx.oms.fcadmin.biz.auth.nameauth.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.auth.nameauth.model.Nameauth;
import com.glsx.oms.fcadmin.biz.auth.nameauth.mapper.NameauthMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流量卡实名认证 Service
 */
@Service
public class NameauthService {
    
    @Autowired
    private NameauthMapper nameauthMapper;
    
    public List<Nameauth> getAll(Nameauth nameauth){
        return nameauthMapper.selectByPageNumSize(nameauth);
    }

    public Nameauth getById(Integer id) {
        return nameauthMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return nameauthMapper.deleteByPrimaryKey(id);
    }

    public int save(Nameauth nameauth) {
        return nameauthMapper.insert(nameauth);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public void updateAuth(Nameauth nameauth){
    	nameauthMapper.updateAuth(nameauth);
    }
   
}
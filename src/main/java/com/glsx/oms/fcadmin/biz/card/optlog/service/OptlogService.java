package com.glsx.oms.fcadmin.biz.card.optlog.service;

import com.glsx.oms.fcadmin.biz.card.optlog.mapper.OptlogMapper;
import com.glsx.oms.fcadmin.biz.card.optlog.model.Optlog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 流量平台中心卡信息 Service
 */
@Service
public class OptlogService {
    
    @Autowired
    private OptlogMapper optlogMapper;
    
   public void insertLog(Optlog optlog){
	   optlogMapper.insertLog(optlog);
   }
   
}
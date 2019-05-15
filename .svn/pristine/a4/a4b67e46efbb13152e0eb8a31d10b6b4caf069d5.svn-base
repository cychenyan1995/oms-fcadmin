package com.glsx.oms.fcadmin.biz.card.lifecycle.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.card.lifecycle.model.LifeCycle;
import com.glsx.oms.fcadmin.biz.card.lifecycle.model.StockCardImport;
import com.glsx.oms.fcadmin.biz.card.lifecycle.mapper.LifeCycleMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *  Service
 */
@Service
public class LifeCycleService {
    
    @Autowired
    private LifeCycleMapper lifeCycleMapper;
    
    public List<LifeCycle> getAll(LifeCycle lifeCycleQuery){
        return lifeCycleMapper.selectList(lifeCycleQuery);
    }

    public LifeCycle getById(Integer id) {
        return lifeCycleMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return lifeCycleMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(LifeCycle lifeCycle) {
        return lifeCycleMapper.insert(lifeCycle);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int batchCreate(List<StockCardImport> list){
    	return lifeCycleMapper.batchCreate(list);
    }
   
    public List<StockCardImport> selectStockListByKey(String key){
    	return lifeCycleMapper.selectStockListByKey(key);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public void deleteStockByKey(String key){
    	lifeCycleMapper.deleteStockByKey(key);
    }
    
}
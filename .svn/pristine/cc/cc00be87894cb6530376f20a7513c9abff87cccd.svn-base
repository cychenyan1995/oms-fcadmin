package com.glsx.oms.fcadmin.biz.mobilecard.stockcard.service;

import java.util.List;

import com.glsx.oms.fcadmin.biz.card.lifecycle.model.StockCard;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.mapper.StockCardMapper;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.LifeCycle;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.StockCardImport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *  Service
 */
@Service
public class StockCardService {
    
    @Autowired
    private StockCardMapper stockCardMapper;
    
    public List<LifeCycle> getAll(LifeCycle lifeCycleQuery){
        return stockCardMapper.selectList(lifeCycleQuery);
    }

    public StockCard getById(Integer id) {
        return stockCardMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return stockCardMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(StockCard stockCard) {
        return stockCardMapper.insert(stockCard);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int batchCreate(List<StockCardImport> list){
    	return stockCardMapper.batchCreate(list);
    }
   
    public List<StockCardImport> selectStockListByKey(String key){
    	return stockCardMapper.selectStockListByKey(key);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public void deleteStockByKey(String key){
    	stockCardMapper.deleteStockByKey(key);
    }
    
}
package com.glsx.oms.fcadmin.biz.mobilecard.stockcard.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.card.lifecycle.model.StockCard;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.LifeCycle;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.StockCardImport;

/**
 *  Mapper
 */
@Mapper
public interface StockCardMapper extends OreMapper<StockCard>{
    
	public List<LifeCycle> selectList(LifeCycle lifeCycleQuery);
	
	public int batchCreate(List<StockCardImport> list);
	
	public List<StockCardImport> selectStockListByKey(String key);
	
	public void deleteStockByKey(String key);
}
package com.glsx.oms.fcadmin.biz.card.lifecycle.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.card.lifecycle.model.LifeCycle;
import com.glsx.oms.fcadmin.biz.card.lifecycle.model.StockCardImport;

/**
 *  Mapper
 */
@Mapper
public interface LifeCycleMapper extends OreMapper<LifeCycle>{
    
	public List<LifeCycle> selectList(LifeCycle lifeCycleQuery);
	
	public int batchCreate(List<StockCardImport> list);
	
	public List<StockCardImport> selectStockListByKey(String key);
	
	public void deleteStockByKey(String key);
}
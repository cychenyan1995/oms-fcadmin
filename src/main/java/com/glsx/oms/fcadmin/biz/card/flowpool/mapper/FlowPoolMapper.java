package com.glsx.oms.fcadmin.biz.card.flowpool.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPool;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowpoolPostage;

/**
 * 流量池定义 Mapper
 */
@Mapper
public interface FlowPoolMapper extends OreMapper<FlowPool>{
    
	public List<FlowPool> selectByPageNumSize(FlowPool flowPool);
	
	public int batchCreate(List<FlowpoolPostage> list);
	
	public int saveFlowPool(FlowPool flowPool);
	
	public List<FlowPool> selectByName(String flowPoolName);
	
}
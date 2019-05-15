package com.glsx.oms.fcadmin.biz.recovery.recycle.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleQuery;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleRecord;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleRecordQuery;

/**
 * 流量卡回收处理 Mapper
 */
@Mapper
public interface RecycleRecordMapper extends OreMapper<RecycleRecord>{
	
	public List<RecycleRecord> getAll(RecycleRecordQuery query);
    
	public RecycleQuery getRecyleInfo(RecycleQuery query);
	
	public void recyclingOp(RecycleQuery query);
	
	public void addRecycleRecord(RecycleRecord recycleRecord);
	
	public RecycleQuery getRecyleCard(RecycleQuery query);
	
}
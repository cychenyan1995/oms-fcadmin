package com.glsx.oms.fcadmin.biz.recovery.recycle.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.Recycle;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleQuery;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleRecord;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleRecordQuery;
import com.glsx.oms.fcadmin.biz.recovery.recycle.mapper.RecycleMapper;
import com.glsx.oms.fcadmin.biz.recovery.recycle.mapper.RecycleRecordMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 流量卡回收记录 Service
 */
@Service
public class RecycleRecordService {
    
    @Autowired
    private RecycleRecordMapper recycleRecordMapper;
    
    public List<RecycleRecord> getAll(RecycleRecordQuery query){

        return recycleRecordMapper.getAll(query);
    }

    public RecycleQuery getRecyleInfo(RecycleQuery query){
    	return recycleRecordMapper.getRecyleInfo(query);
    }
    
    public void recyclingOp(RecycleQuery query){
    	recycleRecordMapper.recyclingOp(query);
    }
    
    public void addRecycleRecord(RecycleRecord recycleRecord){
    	recycleRecordMapper.addRecycleRecord(recycleRecord);
    }
    
    public RecycleQuery getRecyleCard(RecycleQuery query){
    	return recycleRecordMapper.getRecyleCard(query);
    }
       
}
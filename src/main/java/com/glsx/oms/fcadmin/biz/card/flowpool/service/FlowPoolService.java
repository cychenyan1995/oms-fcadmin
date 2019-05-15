package com.glsx.oms.fcadmin.biz.card.flowpool.service;

import java.util.ArrayList;
import java.util.List;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPool;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPoolMonthDetail;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowpoolPostage;
import com.glsx.oms.fcadmin.biz.card.flowpool.mapper.FlowPoolMapper;
import com.glsx.oms.fcadmin.biz.card.flowpool.mapper.FlowPoolMonthDetailMapper;

import org.oreframework.web.ui.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流量池定义 Service
 */
@Service
public class FlowPoolService {
    
    @Autowired
    private FlowPoolMapper flowPoolMapper;
    
    @Autowired
    private FlowPoolMonthDetailMapper flowPoolMonthDetailMapper;
    
    public List<FlowPool> getAll(FlowPool flowPool, Pagination pagination){
        return flowPoolMapper.selectByPageNumSize(flowPool);
    }

    public FlowPool getById(Integer id) {
        return flowPoolMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return flowPoolMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(FlowPool flowPool) {
    	flowPoolMapper.saveFlowPool(flowPool);
    	
    	List<FlowpoolPostage> list = new ArrayList<FlowpoolPostage>();
    	String postIds = flowPool.getPostageId();
    	String[] postIdArr = postIds.split(",");
    	for (int i = 0; i < postIdArr.length; i++) {
    		String pi = postIdArr[i];
    		FlowpoolPostage fp = new FlowpoolPostage();
    		fp.setFlowpoolId(flowPool.getFlowpoolId());
    		fp.setPostageId(Integer.parseInt(pi));
    		fp.setLastOperatorId(flowPool.getLastOperatorId());
    		fp.setLastOperatorName(flowPool.getLastOperatorName());
    		
    		list.add(fp);
		}
    	
        return flowPoolMapper.batchCreate(list);
    }

	public List<FlowPoolMonthDetail> getFlowPoolMonthDetail(FlowPoolMonthDetail detail, Pagination pagination) {
		
		return flowPoolMonthDetailMapper.selectByPageNumSize(detail);
	}

	public boolean existsByName(String flowPoolName) {
		List<FlowPool> list = flowPoolMapper.selectByName(flowPoolName);
		if(list != null && list.size() > 0){
			return true;
		}
		return false;
	}
   
}
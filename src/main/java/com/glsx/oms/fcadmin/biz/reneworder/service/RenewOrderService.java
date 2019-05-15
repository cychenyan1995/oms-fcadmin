package com.glsx.oms.fcadmin.biz.reneworder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glsx.oms.fcadmin.biz.reneworder.mapper.RenewCountMapper;
import com.glsx.oms.fcadmin.biz.reneworder.mapper.RenewOrderMapper;
import com.glsx.oms.fcadmin.biz.reneworder.model.RenewCount;
import com.glsx.oms.fcadmin.biz.reneworder.model.RenewOrder;

@Service
public class RenewOrderService {
    
	@Autowired
	private RenewOrderMapper renewOrderMapper;
	@Autowired
	private RenewCountMapper renewCountMapper;
	
	public List<RenewOrder> findList(RenewOrder renewOrder){
		return renewOrderMapper.findList(renewOrder);
	}
	
	/**
	 * 查询续费统计情况
	 */
	public List<RenewCount> getRenewInfo(){
		return renewCountMapper.getRenewInfo();
	}
}

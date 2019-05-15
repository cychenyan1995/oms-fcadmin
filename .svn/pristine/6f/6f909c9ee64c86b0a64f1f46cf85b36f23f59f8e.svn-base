package com.glsx.oms.fcadmin.biz.order.outorder.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.order.outorder.model.OutOrder;

/**
 * 流量卡出库订单管理 Mapper
 */
@Mapper
public interface OutOrderMapper extends OreMapper<OutOrder>{
    
	List<OutOrder> selectByPageNumSize(OutOrder outOrder);
	
	int addDeliveryResult(OutOrder outOrder);
	
	OutOrder getByOrderNo(String orderNo);
	
	int getStockCount(Integer outOrderId);
   
}
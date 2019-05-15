package com.glsx.oms.fcadmin.biz.card.orderinfo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.card.orderinfo.model.OrderInfo;

/**
 * 流量卡入库订单管理 Mapper
 */
@Mapper
public interface OrderInfoMapper extends OreMapper<OrderInfo>{
    
   
}
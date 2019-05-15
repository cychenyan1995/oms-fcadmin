package com.glsx.oms.fcadmin.biz.sp.flowservice.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;

/**
 * 服务商流量服务包 Mapper
 */
@Mapper
public interface FlowServiceMapper extends OreMapper<FlowService>{
    
	public int saveFlowService(FlowService flowService);
   
}
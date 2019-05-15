package com.glsx.oms.fcadmin.biz.recovery.recycle.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.recovery.recycle.model.Recycle;

/**
 * 流量卡回收处理 Mapper
 */
@Mapper
public interface RecycleMapper extends OreMapper<Recycle>{
    
   
}
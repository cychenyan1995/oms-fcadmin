package com.glsx.oms.fcadmin.biz.recovery.transfer.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.recovery.transfer.model.Transfer;

/**
 * 流量卡迁移记录 Mapper
 */
@Mapper
public interface TransferMapper extends OreMapper<Transfer>{
    
   
}
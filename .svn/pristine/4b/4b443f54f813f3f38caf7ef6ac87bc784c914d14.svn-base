package com.glsx.oms.fcadmin.biz.op.op.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.op.op.model.Op;

/**
 * 网络运营商 Mapper
 */
@Mapper
public interface OpMapper extends OreMapper<Op>{
	
    public List<Op> getOpList(Op op);
    
    public Integer existsByName(Op op);
   
    public void addOp(Op op);
    
    public List<Op> getMobileOpList(Op op);
    
    public void addMop(Op op);
}
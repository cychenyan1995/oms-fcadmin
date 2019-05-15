package com.glsx.oms.fcadmin.biz.op.op.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.op.op.model.Op;
import com.glsx.oms.fcadmin.biz.op.op.mapper.OpMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 网络运营商 Service
 */
@Service
public class OpService {
    
    @Autowired
    private OpMapper opMapper;
    
    public List<Op> getAll(){
        return opMapper.selectAll();
    }
    
    public Integer existsByName(Op op){
        return opMapper.existsByName(op);
    }
    
    public List<Op> getOpList(Op op){
        return opMapper.getOpList(op);
    }

    
    public void addOp(Op op){
    	opMapper.addOp(op);
    }
    
    public List<Op> getMobileOpList(Op op){
    	return opMapper.getMobileOpList(op);
    }
    
    public void addMop(Op op){
    	opMapper.addMop(op);
    }
   
}
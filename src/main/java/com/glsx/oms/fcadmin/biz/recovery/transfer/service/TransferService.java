package com.glsx.oms.fcadmin.biz.recovery.transfer.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.Transfer;
import com.glsx.oms.fcadmin.biz.recovery.transfer.mapper.TransferMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 流量卡迁移记录 Service
 */
@Service
public class TransferService {
    
    @Autowired
    private TransferMapper transferMapper;
    
    public List<Transfer> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return transferMapper.selectAll();
    }

    public Transfer getById(Integer id) {
        return transferMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return transferMapper.deleteByPrimaryKey(id);
    }

    public int save(Transfer transfer) {
        /*if (country.getId() != null) {
            transferMapper.updateByPrimaryKey(transfer);
        } else {
            return transferMapper.insert(transfer);
        }*/
        return transferMapper.insert(transfer);
    }
   
}
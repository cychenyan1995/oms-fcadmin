package com.glsx.oms.fcadmin.biz.recharge.rechargeorder.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.model.RechargeOrder;
import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.mapper.RechargeOrderMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 充值订单表 Service
 */
@Service
public class RechargeOrderService {
    
    @Autowired
    private RechargeOrderMapper rechargeOrderMapper;
    
    public List<RechargeOrder> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return rechargeOrderMapper.selectAll();
    }

    public RechargeOrder getById(Integer id) {
        return rechargeOrderMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return rechargeOrderMapper.deleteByPrimaryKey(id);
    }

    public int save(RechargeOrder rechargeOrder) {
        /*if (country.getId() != null) {
            rechargeOrderMapper.updateByPrimaryKey(rechargeOrder);
        } else {
            return rechargeOrderMapper.insert(rechargeOrder);
        }*/
        return rechargeOrderMapper.insert(rechargeOrder);
    }
   
}
package com.glsx.oms.fcadmin.biz.order.outorder.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.order.outorder.model.OutOrder;
import com.glsx.oms.fcadmin.biz.order.outorder.mapper.OutOrderMapper;

import org.oreframework.web.ui.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流量卡出库订单管理 Service
 */
@Service
public class OutOrderService {
    
    @Autowired
    private OutOrderMapper outOrderMapper;
    
    public List<OutOrder> getAll(OutOrder outOrderQuery, Pagination pagination){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return outOrderMapper.selectByPageNumSize(outOrderQuery);
    }

    public OutOrder getById(Integer id) {
        return outOrderMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return outOrderMapper.deleteByPrimaryKey(id);
    }

    public int save(OutOrder outOrder) {
        /*if (country.getId() != null) {
            outOrderMapper.updateByPrimaryKey(outOrder);
        } else {
            return outOrderMapper.insert(outOrder);
        }*/
        return outOrderMapper.insert(outOrder);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int addDeliveryResult(OutOrder outOrder) {
        return outOrderMapper.addDeliveryResult(outOrder);
    }
    
    public OutOrder getByOrderNo(String orderNo){
    	return outOrderMapper.getByOrderNo(orderNo);
    }
    
    public int getStockCount(Integer outOrderId){
    	return outOrderMapper.getStockCount(outOrderId);
    }
   
}
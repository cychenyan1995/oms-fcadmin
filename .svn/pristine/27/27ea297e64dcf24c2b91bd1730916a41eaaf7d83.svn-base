package com.glsx.oms.fcadmin.biz.card.orderinfo.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.card.orderinfo.model.OrderInfo;
import com.glsx.oms.fcadmin.biz.card.orderinfo.mapper.OrderInfoMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 流量卡入库订单管理 Service
 */
@Service
public class OrderInfoService {
    
    @Autowired
    private OrderInfoMapper orderInfoMapper;
    
    public List<OrderInfo> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return orderInfoMapper.selectAll();
    }

    public OrderInfo getById(Integer id) {
        return orderInfoMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return orderInfoMapper.deleteByPrimaryKey(id);
    }

    public int save(OrderInfo orderInfo) {
        /*if (country.getId() != null) {
            orderInfoMapper.updateByPrimaryKey(orderInfo);
        } else {
            return orderInfoMapper.insert(orderInfo);
        }*/
        return orderInfoMapper.insert(orderInfo);
    }
   
}
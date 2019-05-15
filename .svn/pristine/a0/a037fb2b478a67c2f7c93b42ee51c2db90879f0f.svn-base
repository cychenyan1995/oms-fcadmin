package com.glsx.oms.fcadmin.biz.recovery.recycle.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.Recycle;
import com.glsx.oms.fcadmin.biz.recovery.recycle.mapper.RecycleMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 流量卡回收处理 Service
 */
@Service
public class RecycleService {
    
    @Autowired
    private RecycleMapper recycleMapper;
    
    public List<Recycle> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return recycleMapper.selectAll();
    }

    public Recycle getById(Integer id) {
        return recycleMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return recycleMapper.deleteByPrimaryKey(id);
    }

    public int save(Recycle recycle) {
        /*if (country.getId() != null) {
            recycleMapper.updateByPrimaryKey(recycle);
        } else {
            return recycleMapper.insert(recycle);
        }*/
        return recycleMapper.insert(recycle);
    }
   
}
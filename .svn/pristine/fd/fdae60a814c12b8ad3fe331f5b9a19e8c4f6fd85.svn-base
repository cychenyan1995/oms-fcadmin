package com.glsx.oms.fcadmin.biz.card.changelog.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.card.changelog.model.ChangeLog;
import com.glsx.oms.fcadmin.biz.card.changelog.mapper.ChangeLogMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 流量卡变更日志 Service
 */
@Service
public class ChangeLogService {
    
    @Autowired
    private ChangeLogMapper changeLogMapper;
    
    public List<ChangeLog> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return changeLogMapper.selectAll();
    }

    public ChangeLog getById(Integer id) {
        return changeLogMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return changeLogMapper.deleteByPrimaryKey(id);
    }

    public int save(ChangeLog changeLog) {
        /*if (country.getId() != null) {
            changeLogMapper.updateByPrimaryKey(changeLog);
        } else {
            return changeLogMapper.insert(changeLog);
        }*/
        return changeLogMapper.insert(changeLog);
    }
   
}
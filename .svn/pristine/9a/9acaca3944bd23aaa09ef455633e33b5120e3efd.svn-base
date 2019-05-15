package com.glsx.oms.fcadmin.biz.card.postage.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.card.postage.model.Postage;
import com.glsx.oms.fcadmin.biz.card.postage.mapper.PostageMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 流量池与资费计划关联表 Service
 */
@Service
public class PostageService {
    
    @Autowired
    private PostageMapper postageMapper;
    
    public List<Postage> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return postageMapper.selectAll();
    }

    public Postage getById(Integer id) {
        return postageMapper.selectByPrimaryKey(id);
    }
    
    public Postage getByPostageId(Integer postageId) {
        return postageMapper.getByPostageId(postageId);
    }
    
    public int deleteById(Integer id) {
        return postageMapper.deleteByPrimaryKey(id);
    }

    public int save(Postage postage) {
        /*if (country.getId() != null) {
            postageMapper.updateByPrimaryKey(postage);
        } else {
            return postageMapper.insert(postage);
        }*/
        return postageMapper.insert(postage);
    }
   
}
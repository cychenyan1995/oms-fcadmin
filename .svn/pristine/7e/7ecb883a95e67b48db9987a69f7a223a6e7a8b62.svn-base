package com.glsx.oms.fcadmin.biz.op.postageplan.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.op.postageplan.model.PostagePlan;
import com.glsx.oms.fcadmin.biz.op.postageplan.mapper.PostagePlanMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;

/**
 * 运营商资费计划 Service
 */
@Service
public class PostagePlanService {
    
    @Autowired
    private PostagePlanMapper postagePlanMapper;
    
    public List<PostagePlan> getAll(){
        /*if (city.getPage() != null && city.getRows() != null) {
            PageHelper.startPage(city.getPage(), city.getRows());
        }*/
        return postagePlanMapper.selectAll();
    }

    public PostagePlan getById(Integer id) {
        return postagePlanMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return postagePlanMapper.deleteByPrimaryKey(id);
    }

    public int save(PostagePlan postagePlan) {
        /*if (country.getId() != null) {
            postagePlanMapper.updateByPrimaryKey(postagePlan);
        } else {
            return postagePlanMapper.insert(postagePlan);
        }*/
        return postagePlanMapper.insert(postagePlan);
    }
   
}
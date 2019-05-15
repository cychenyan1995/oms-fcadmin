package com.glsx.oms.fcadmin.biz.sp.sp.service;

import java.util.List;
import com.glsx.oms.fcadmin.biz.sp.sp.model.Sp;
import com.glsx.oms.fcadmin.biz.sp.sp.mapper.SpMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 流量平台商户信息 Service
 */
@Service
public class SpService {
    
    @Autowired
    private SpMapper spMapper;
    
    public List<Sp> getAll(){
        return spMapper.selectByPageNumSize();
    }

    public Sp getById(Integer id) {
        return spMapper.selectByPrimaryKey(id);
    }
    
    public int deleteById(Integer id) {
        return spMapper.deleteByPrimaryKey(id);
    }

    public int save(Sp sp) {
        return spMapper.insert(sp);
    }
   
    public List<Sp> getSpList(){
    	return spMapper.getSpList();
    }
    
    public List<Integer> getUserdSpcardId(Integer spId){
    	return spMapper.getUserdSpcardId(spId);
    }
    
    public List<Integer> getChildSp(Integer spId){
    	return spMapper.getChildSp(spId);
    }
    
    public void deleteSpById(Integer spId){
    	spMapper.deleteSpById(spId);
    }
    
    public Sp getSpdetail(Integer spId){
    	return spMapper.getSpdetail(spId);
    }
    
    public void updateSp(Sp sp){
    	spMapper.updateSp(sp);
    }
    
    public boolean existBySpName(Sp sp){
    	List<Sp> list = spMapper.existBySpName(sp);
    	if(list!=null && list.size()>0){
    		return true;
    	}else {
    		return false;
    	}
    }
    
    public List<Sp> getSpNameByLevel(Integer level){
    	List<Sp> list = spMapper.getSpNameByLevel(level);
    	return list;
    }
    
    public void saveSp(Sp sp){
    	String spName=sp.getSpName();
    	if("广联赛讯".equals(spName)){
    		sp.setSpCode(19180009);
    	}else if("易哥科技".equals(spName)){
    		sp.setSpCode(104334);
    	}else{
    		Integer maxSpCode=spMapper.getMaxSpCode();
        	if(maxSpCode==null){
        		//初值为100000
        		maxSpCode=100000;
        	}else if(maxSpCode==104333){
        		maxSpCode++;
        	}
        	sp.setSpCode(maxSpCode+1);
    	}
    	spMapper.saveSp(sp);
    }
}
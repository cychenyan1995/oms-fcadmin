package com.glsx.oms.fcadmin.biz.sp.sp.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.sp.sp.model.Sp;

/**
 * 流量平台商户信息 Mapper
 */
@Mapper
public interface SpMapper extends OreMapper<Sp>{
    
	 public List<Sp> selectByPageNumSize();
	 
	 public List<Sp> getSpList();
	 
	 public List<Integer> getUserdSpcardId(Integer spId);
	 public List<Integer> getChildSp(Integer spId);
	 public void deleteSpById(Integer spId);
	 public Sp getSpdetail(Integer spId);
	 public void updateSp(Sp sp);
	 public List<Sp> existBySpName(Sp sp);
	 public List<Sp> getSpNameByLevel(Integer level);
	 public Integer getMaxSpCode();
	 public void saveSp(Sp sp);
}
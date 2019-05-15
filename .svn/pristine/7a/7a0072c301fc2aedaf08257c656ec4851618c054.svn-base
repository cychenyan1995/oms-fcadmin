package com.glsx.oms.fcadmin.biz.auth.nameauth.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.auth.nameauth.model.Nameauth;

/**
 * 流量卡实名认证 Mapper
 */
@Mapper
public interface NameauthMapper extends OreMapper<Nameauth>{
    
	public List<Nameauth> selectByPageNumSize(Nameauth nameauth);
	
	public void updateAuth(Nameauth nameauth);
}
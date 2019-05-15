package com.glsx.oms.fcadmin.biz.card.flowcard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.card.flowcard.model.BatchOpCardImport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCard;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCardImport;

/**
 * 流量平台中心卡信息 Mapper
 */
@Mapper
public interface FlowCardMapper extends OreMapper<FlowCard>{
	
	public int getCount(FlowCard flowcard);
    
	public List<FlowCard> selectByPageNumSize(FlowCard flowcard);
	
	public FlowCard getCurPackage(String id);
	
	public List<FlowCardImport> getFlowcardListByCardNo(List<String> list);
	
	public List<FlowCardImport> getFlowcardListByImsi(List<String> list);
	
	public List<FlowCardImport> getFlowcardListByIccid(List<String> list);
	
	public List<BatchOpCardImport> getFlowcardList(List<String> list);
	
	public int batchCreate(List<FlowCardImport> list);
	
	public FlowCard getCardDetail(Integer cardId);
	
	public void updateAuthName(String imsi);
}
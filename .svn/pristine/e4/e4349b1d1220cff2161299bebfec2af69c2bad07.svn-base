package com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.CardManage;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.FlowCardImport;

@Mapper
public interface CardManageMapper {
	
	public int getCount(CardManage cardManageQuery);

	public List<CardManage> getAll(CardManage cardManageQuery);
	
	public int batchCreate(List<FlowCardImport> list);
	
	public List<FlowCardImport> getFlowcardListByCardNo(List<String> list);
	
	public List<FlowCardImport> getFlowcardListByImsi(List<String> list);
	
	public List<FlowCardImport> getFlowcardListByIccid(List<String> list);
	
	public CardManage getCardDetail(Integer cardId);
}

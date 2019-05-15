package com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.mapper.CardManageMapper;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.CardManage;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.FlowCardImport;

@Service
public class CardManageService {

	@Autowired
	private CardManageMapper cardManageMapper;
	
	public int getCount(CardManage cardManageQuery)
    {
        return cardManageMapper.getCount(cardManageQuery);
    }
	
	public List<CardManage> getAll(CardManage cardManageQuery){
		return cardManageMapper.getAll(cardManageQuery);
	}
	
	public List<FlowCardImport> getFlowcardListByCardNo(List<String> cardNos){
		return cardManageMapper.getFlowcardListByCardNo(cardNos);
	}
	
	public List<FlowCardImport> getFlowcardListByImsi(List<String> imsis){
		return cardManageMapper.getFlowcardListByImsi(imsis);
	}
	
	public List<FlowCardImport> getFlowcardListByIccid(List<String> iccids){
		return cardManageMapper.getFlowcardListByIccid(iccids);
	}
	
	@Transactional(rollbackFor = {IllegalArgumentException.class})
	public int batchCreate(List<FlowCardImport> list){
		return cardManageMapper.batchCreate(list);
		
	}
	public CardManage getCardDetail(Integer cardId){
		return cardManageMapper.getCardDetail(cardId);
	}
}

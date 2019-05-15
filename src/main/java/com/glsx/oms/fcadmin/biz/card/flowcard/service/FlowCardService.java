package com.glsx.oms.fcadmin.biz.card.flowcard.service;

import java.util.List;

import com.glsx.oms.fcadmin.biz.card.flowcard.model.BatchOpCardImport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCard;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCardImport;
import com.glsx.oms.fcadmin.biz.card.flowcard.mapper.FlowCardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流量平台中心卡信息 Service
 */
@Service
public class FlowCardService {
    
    @Autowired
    private FlowCardMapper flowCardMapper;
    
    public int getCount(FlowCard flowcard)
    {
        return flowCardMapper.getCount(flowcard);
    }
    
    public List<FlowCard> getAll(FlowCard flowcard){
        return flowCardMapper.selectByPageNumSize(flowcard);
    }
    
    public FlowCard getCardDetail(Integer cardId){
    	return flowCardMapper.getCardDetail(cardId);
    }
    
    public FlowCard getCurPackage(String id){
    	return flowCardMapper.getCurPackage(id);
    }

    public List<FlowCardImport> getFlowcardListByCardNo(List<String> cardNos){
    	return flowCardMapper.getFlowcardListByCardNo(cardNos);
    }
    
    public List<FlowCardImport> getFlowcardListByImsi(List<String> cardNos){
    	return flowCardMapper.getFlowcardListByImsi(cardNos);
    }
    
    public List<FlowCardImport> getFlowcardListByIccid(List<String> cardNos){
    	return flowCardMapper.getFlowcardListByIccid(cardNos);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int batchCreate(List<FlowCardImport> list){
    	return flowCardMapper.batchCreate(list);
    }
    
    public List<BatchOpCardImport> getFlowcardList(List<String> list){
    	return flowCardMapper.getFlowcardList(list);
    }
    
    public FlowCard getById(Integer id) {
        return flowCardMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return flowCardMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(FlowCard flowCard) {
        return flowCardMapper.insert(flowCard);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public void updateAuthName(String imsi){
    	flowCardMapper.updateAuthName(imsi);
    }
   
}
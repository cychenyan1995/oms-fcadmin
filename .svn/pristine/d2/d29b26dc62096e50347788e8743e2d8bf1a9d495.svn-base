package com.glsx.oms.fcadmin.biz.mobilecard.opencard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glsx.oms.fcadmin.biz.mobilecard.opencard.mapper.MobileOpenCardMapper;
import com.glsx.oms.fcadmin.biz.mobilecard.opencard.model.MobileOpenCard;

@Service
public class MobileOpenCardService {

	@Autowired
	private MobileOpenCardMapper openCardMapper;
	
	public List<MobileOpenCard> getOpenCardList(MobileOpenCard openCard){
		return openCardMapper.getOpenCardList(openCard);
	}
}

package com.glsx.oms.fcadmin.biz.card.opencard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glsx.oms.fcadmin.biz.card.opencard.mapper.OpenCardMapper;
import com.glsx.oms.fcadmin.biz.card.opencard.model.OpenCard;

@Service
public class OpenCardService {

	@Autowired
	private OpenCardMapper openCardMapper;
	
	public List<OpenCard> getOpenCardList(OpenCard openCard){
		return openCardMapper.getOpenCardList(openCard);
	}
}

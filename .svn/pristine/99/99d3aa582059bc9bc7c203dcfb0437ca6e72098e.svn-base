package com.glsx.oms.fcadmin.biz.card.opencard.controller;

import java.util.List;

import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultCode;
import org.oreframework.web.ui.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glsx.oms.fcadmin.biz.card.opencard.model.OpenCard;
import com.glsx.oms.fcadmin.biz.card.opencard.service.OpenCardService;
import com.glsx.oms.fcadmin.framework.Contants;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import scala.annotation.meta.getter;

@RestController
@RequestMapping("/opencard")
public class OpenCardController {

	private final static Logger LOGGER=LoggerFactory.getLogger(OpenCard.class);
	@Autowired
	private OpenCardService openCardService;
	
	@Autowired
	private KafkaTemplate<String,String> kafkaTemplate;
	
	@RequestMapping(value="/getOpenCardList",method=RequestMethod.GET)
	public ResponseEntity<OpenCard> getOpenCardList(OpenCard openCardQuery,Pagination pagination){
		ResponseEntity<OpenCard> responseEntity=new ResponseEntity<OpenCard>();
		PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
		List<OpenCard> opencardList= openCardService.getOpenCardList(openCardQuery);
		Long total=((Page<OpenCard>)opencardList).getTotal();
		responseEntity.setData(opencardList);
		responseEntity.setRecordsTotal(total);
		responseEntity.setRecordsFiltered(total);
		return responseEntity;
	}
	
	/**
	 * 导出
	 * @param openCardQuery
	 * @return
	 */
	@RequestMapping(value="/exportOpenCardFile",method=RequestMethod.POST)
	public ResultEntity<OpenCard> exportOpenCardFile(@RequestBody OpenCard openCardQuery){
		ResultEntity<OpenCard> resultEntity=new ResultEntity<OpenCard>();
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("{");
		sBuffer.append("\"taskName\":\"待开卡列表下载\",");
		sBuffer.append("\"taskDesc\":\"待开卡列表下载\",");
		sBuffer.append("\"taskType\":\"6\",");
		sBuffer.append("\"taskSource\":\""+Contants.SYSTEM_NAME+"\",");
		sBuffer.append("\"taskCreator\":\"admin\",");
		sBuffer.append("\"taskCreatorId\":\"123456\",");
		
		Gson gson=new GsonBuilder().create();
		String jsonObject=gson.toJson(openCardQuery);
		
		sBuffer.append("\"taskExecParams\":{\"template\":\"order.xml\",\"kewWork\":"+ jsonObject.toString() +"}");
		sBuffer.append("}");
		
		kafkaTemplate.sendDefault(sBuffer.toString());
		resultEntity.setReturnCode(ResultCode.SUCCESS);
	    resultEntity.setMessage("发送成功!");
	    return resultEntity;
	}
}

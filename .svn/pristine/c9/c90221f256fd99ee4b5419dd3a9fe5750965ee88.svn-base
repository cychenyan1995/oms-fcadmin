package com.glsx.oms.fcadmin.biz.reneworder.controller;

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
import com.glsx.oms.fcadmin.biz.reneworder.model.RenewCount;
import com.glsx.oms.fcadmin.biz.reneworder.model.RenewOrder;
import com.glsx.oms.fcadmin.biz.reneworder.service.RenewOrderService;
import com.glsx.oms.fcadmin.framework.Contants;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


/**
 * 续费订单controller
 * */
@RestController
@RequestMapping(value = "/renewOrder")
public class RenewOrderController {
	
	 @Autowired
	 private RenewOrderService renewOrderService;
 
     @Autowired
     private KafkaTemplate<String, String> kafkaTemplate;
	 
	 /**
	  * 续费订单明细
	  * @param renewOrder
	  * @param pagination
	  * @return
	  */
	 @RequestMapping(value = "/findList", method = RequestMethod.GET)
	 public ResponseEntity<RenewOrder> findList(RenewOrder renewOrderQuery, Pagination pagination) {
	        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());	        
	        List<RenewOrder> renewOrderList = renewOrderService.findList(renewOrderQuery);	        
	        ResponseEntity<RenewOrder> responseObject = new ResponseEntity<RenewOrder>();
	        long total = ((Page<RenewOrder>)renewOrderList).getTotal();
	        responseObject.setData(renewOrderList);
	        responseObject.setRecordsTotal(total);
	        responseObject.setRecordsFiltered(total);
	        return responseObject;
	  }
	 
	 /**
	  * 续费统计
	  * @param pagination
	  * @return
	  */
	 @RequestMapping(value="/getRenewInfo",method=RequestMethod.GET)
	 public ResponseEntity<RenewCount> getRenewInfo(Pagination pagination){
		 PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
		 List<RenewCount> renewCountList=renewOrderService.getRenewInfo();
		 ResponseEntity<RenewCount> responseObject=new ResponseEntity<>();
		 long total=((Page<RenewCount>) renewCountList).getTotal();
		 responseObject.setData(renewCountList);
		 responseObject.setRecordsTotal(total);
		 responseObject.setRecordsFiltered(total);
		 return responseObject;
	 }
	 
	 /**
	  * 导出文件
	  * @param RenewOrderQuery
	  * @return
	  */
	 @RequestMapping(value="/exportRenewOrderFile",method=RequestMethod.POST)
	 public ResultEntity<RenewOrder> exportRenewOrderFile(@RequestBody RenewOrder  renewOrderQuery){
		 StringBuffer sb = new StringBuffer();
	        sb.append("{");
	        sb.append("\"taskName\":\"续费订单下载\",");
	        sb.append("\"taskDesc\":\"续费订单下载\",");
	        sb.append("\"taskType\":\"5\",");
	        sb.append("\"taskSource\":\""+Contants.SYSTEM_NAME+"\",");
	        sb.append("\"taskCreator\":\"admin\",");
	        sb.append("\"taskCreatorId\":\"123456\",");
	        
	        Gson gson = new GsonBuilder().serializeNulls().create();
	    	String jsonObject = gson.toJson(renewOrderQuery);
	    	
	        sb.append("\"taskExecParams\":{\"template\":\"order.xml\",\"kewWork\":"+ jsonObject.toString() +"}");
	        sb.append("}");
	        kafkaTemplate.sendDefault(sb.toString());
		 
		 ResultEntity<RenewOrder> resultEntity = new ResultEntity<RenewOrder>();
         resultEntity.setReturnCode(ResultCode.SUCCESS);
         resultEntity.setMessage("发送成功!");
         return resultEntity;
	 }
}

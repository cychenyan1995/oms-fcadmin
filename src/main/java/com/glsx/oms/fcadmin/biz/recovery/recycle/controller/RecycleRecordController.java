
package com.glsx.oms.fcadmin.biz.recovery.recycle.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;
import com.glsx.oms.fcadmin.biz.recovery.recycle.service.RecycleRecordService;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.RecycleFcRequest;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleQuery;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleRecord;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleRecordQuery;

/**
 * 流量卡回收处理 Controller
 */
@RestController
@RequestMapping(value = "/recovery")
public class RecycleRecordController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(RecycleRecordController.class);

    @Autowired
    private RecycleRecordService recycleRecordService;
    
    // 如果用@Reference注解版本号不能去掉
 	@Reference(version = "1.0.0")
 	private OpsMgrManager opsMgrManager;
    
    @RequestMapping(value = "/recycleRecord", method = RequestMethod.POST)
    public ResultEntity<RecycleRecord> save(@RequestBody RecycleQuery query) {
    	ResultEntity<RecycleRecord> resultEntity = new ResultEntity<RecycleRecord>();
    	RecycleRecord recycleRecord=new RecycleRecord();
    	try {
			recycleRecord = query;
			recycleRecordService.addRecycleRecord(recycleRecord);
			// 调用回收接口
			RecycleFcRequest recycleFcRequest = new RecycleFcRequest();
			recycleFcRequest.setImsi(recycleRecord.getImsi());
			recycleFcRequest.setReason(recycleRecord.getRecycleReason());
			recycleFcRequest.setConsumer("oms-fcadmin");
			recycleFcRequest.setVersion("1.0.0");
			recycleFcRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
			FlowResponse<?> retStr = opsMgrManager.recycleFlowCard(recycleFcRequest);
			if ("1000".equals(retStr.getCode())) {
				query.setRecycleStatus("2");
				recycleRecordService.recyclingOp(query);
				resultEntity.setReturnCode(ResultCode.SUCCESS);
				resultEntity.setMessage("回收成功!");
			} else {
				query.setRecycleStatus("3");
				query.setFailReason(retStr.getMessage());
				recycleRecordService.recyclingOp(query);
				resultEntity.setReturnCode(ResultCode.ERROR);
				resultEntity.setMessage("回收失败:" + retStr.getMessage());
			}
		} catch (Exception e) {
			 resultEntity.setReturnCode(ResultCode.ERROR);
   	         resultEntity.setMessage("回收失败,系统异常!");
   	         LOGGER.error("recycleRecord.save error:"+e);
		}
       
        return resultEntity;
    }

    @RequestMapping(value = "/recycleRecord", method = RequestMethod.GET)
    public ResponseEntity<RecycleRecord> getAll(RecycleRecordQuery query,Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<RecycleRecord> recycleList = recycleRecordService.getAll(query);      
        ResponseEntity<RecycleRecord> responseObject = new ResponseEntity<RecycleRecord>();
        long total = ((Page<RecycleRecord>)recycleList).getTotal();
        responseObject.setData(recycleList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    /**
     * 跳转到回收界面
     * @param query
     * @return
     */
    @RequestMapping(value = "/toRecyclingOp")
    public ResultEntity<RecycleQuery> toRecyclingOp(RecycleQuery query) {
        ResultEntity<RecycleQuery> resultEntity = new ResultEntity<RecycleQuery>();       
        try {
        	query=recycleRecordService.getRecyleInfo(query);
            resultEntity.setData(query);
            resultEntity.setReturnCode(ResultCode.SUCCESS);
            resultEntity.setMessage("获取成功!");
		} catch (Exception e) {
	        resultEntity.setReturnCode(ResultCode.ERROR);
	        resultEntity.setMessage("获取失败!");
	        LOGGER.error("recycleRecord.toRecyclingOp error:"+e);
		}
        return resultEntity;
    }

    /**
     * 回收
     * @param query
     * @return
     */
    @RequestMapping(value = "/recyclingOp")
    public ResultEntity<RecycleQuery> recyclingOp(RecycleQuery query) {
    	ResultEntity<RecycleQuery> resultEntity = new ResultEntity<RecycleQuery>();
    	RecycleRecord recycleRecord=new RecycleRecord();
    	try {
    		//调用回收接口 
    		recycleRecord=query;
    		RecycleFcRequest recycleFcRequest = new RecycleFcRequest();
			recycleFcRequest.setImsi(recycleRecord.getImsi());
			recycleFcRequest.setReason(recycleRecord.getRecycleReason());
			recycleFcRequest.setConsumer("oms-fcadmin");
			recycleFcRequest.setVersion("1.0.0");
			recycleFcRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
			FlowResponse<?> retStr = opsMgrManager.recycleFlowCard(recycleFcRequest);
			if ("1000".equals(retStr.getCode())) {
    			query.setRecycleStatus("2");
    			recycleRecordService.recyclingOp(query);
                resultEntity.setReturnCode(ResultCode.SUCCESS);
                resultEntity.setMessage("回收成功!");
    		}else{
    			query.setRecycleStatus("3");
    			query.setFailReason(retStr.getMessage());
    			recycleRecordService.recyclingOp(query);
                resultEntity.setReturnCode(ResultCode.ERROR);
                resultEntity.setMessage("回收失败:"+retStr.getMessage());
    		}		
		} catch (Exception e) {
	        resultEntity.setReturnCode(ResultCode.ERROR);
	        resultEntity.setMessage("回收失败,系统异常!");
	        LOGGER.error("recycleRecord.recyclingOp error:"+e);
		}     
        return resultEntity;
    }
    /**
     * 查看回收的卡信息
     * @param query
     * @return
     */
    @RequestMapping(value = "/queryRecycleCard")
    public ResultEntity<RecycleQuery> queryRecycleCard(RecycleQuery query) {
    	ResultEntity<RecycleQuery> resultEntity = new ResultEntity<RecycleQuery>();
    	try {
    		query=recycleRecordService.getRecyleCard(query);
    		resultEntity.setData(query);
            resultEntity.setReturnCode(ResultCode.SUCCESS);
            resultEntity.setMessage("获取成功!");
		} catch (Exception e) {
	        resultEntity.setReturnCode(ResultCode.ERROR);
	        resultEntity.setMessage("获取失败!");
	        LOGGER.error("recycleRecord.queryRecycleCard error:"+e);
		}     
        return resultEntity;
    }
    
    /**
     * 查看输入的iccid|imsi|cardNo是否存在
     * @param recycleRecord
     * @return
     */
    @RequestMapping(value = "/existsByRecycleCard" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> existsByRecycleCard(@RequestBody RecycleRecord recycleRecord) {
    	Map<String, Object> map = new HashMap<String, Object>();      
        try {
            //查看卡是否存在
        	RecycleQuery query=new RecycleQuery();
        	query.setCardNo(recycleRecord.getCardNo());
        	query.setImsi(recycleRecord.getImsi());
        	query.setIccid(recycleRecord.getIccid());
        	query=recycleRecordService.getRecyleCard(query);
        	//卡存在时，验证通过
        	if(query!=null&&!query.getPackageStatus().equals("库存")){
        		 map.put("result", true);
        		 map.put("recycleQuery", query);
        	}else{
        		 map.put("result", false);
        	}
           
        } catch (Exception e) {
        	LOGGER.error("catch an exception in existsByRecycleCard", e);
            map.put("result", false);
        }
        return map;
    }
    
}
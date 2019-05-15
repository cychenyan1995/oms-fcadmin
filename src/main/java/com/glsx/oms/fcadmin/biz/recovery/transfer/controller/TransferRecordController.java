package com.glsx.oms.fcadmin.biz.recovery.transfer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultCode;
import org.oreframework.web.ui.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferCard;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferRecord;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferRecordQuery;
import com.glsx.oms.fcadmin.biz.recovery.transfer.service.TransferRecordService;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.TransferRequest;

/**
 * 流量卡迁移记录 Controller
 */
@RestController
@RequestMapping(value = "/recovery")
public class TransferRecordController {
	
	private final static Logger LOGGER = LoggerFactory.getLogger(TransferController.class);
    
    @Autowired
    private TransferRecordService transferRecordService;

    // 如果用@Reference注解版本号不能去掉
 	@Reference(version = "1.0.0")
 	private OpsMgrManager opsMgrManager;
    
    /**
     * 添加迁移记录
     * @param transferRecord
     * @return
     */
    @RequestMapping(value = "/transferRecord", method = RequestMethod.POST)
    public ResultEntity<TransferRecord> save(@RequestBody TransferRecord transferRecord) {
    	ResultEntity<TransferRecord> resultEntity = new ResultEntity<TransferRecord>();
    	try {
			transferRecordService.addTransferRecord(transferRecord);
			// 调用迁移接口
			TransferRequest transferRequest = new TransferRequest();
			transferRequest.setFromImsi(transferRecord.getSrcImsi());
			transferRequest.setToImsi(transferRecord.getDstImsi());
			transferRequest.setConsumer("oms-fcadmin");
			transferRequest.setVersion("1.0.0");
			transferRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
			FlowResponse<?> retSrc = opsMgrManager.cardTransfer(transferRequest);
			if ("1000".equals(retSrc.getCode())) {
				transferRecord.setTransStatus("2");
				transferRecordService.transferingOp(transferRecord);
				resultEntity.setReturnCode(ResultCode.SUCCESS);
				resultEntity.setMessage("迁移成功!");
			} else {
				transferRecord.setTransStatus("3");
				transferRecord.setFailReason(retSrc.getMessage());
				transferRecordService.transferingOp(transferRecord);
				resultEntity.setReturnCode(ResultCode.ERROR);
				resultEntity.setMessage("迁移失败:" + retSrc.getMessage());
			}
		} catch (Exception e) {
			 resultEntity.setReturnCode(ResultCode.ERROR);
   	         resultEntity.setMessage("迁移失败,系统异常!");
   	         LOGGER.error("transferRecord.save error:"+e);
   	         e.printStackTrace();
		}
       
        return resultEntity;
    }

    /**
     * 分页获取卡迁移记录列表
     * @param query
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/transferRecord", method = RequestMethod.GET)
    public ResponseEntity<TransferRecord> getAll(TransferRecordQuery query,Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<TransferRecord> tansferList = transferRecordService.getAll(query);      
        ResponseEntity<TransferRecord> responseObject = new ResponseEntity<TransferRecord>();
        long total = ((Page<TransferRecord>)tansferList).getTotal();
        responseObject.setData(tansferList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    /**
     * 跳转到迁移界面
     * @param query
     * @return
     */
    @RequestMapping(value = "/toTransferingOp")
    public Map<String, Object> toTransferingOp(TransferRecordQuery query) {
    	Map<String, Object> map = new HashMap<String, Object>();       
        try {
        	List<TransferRecord> list=transferRecordService.getAll(query);
        	TransferRecord transferRecord=new TransferRecord();
        	TransferRecord srcTransferRecord=new TransferRecord();
        	TransferRecord dstTransferRecord=new TransferRecord();
        	if(list!=null&&list.size()>0){
        		transferRecord=list.get(0);
        		BeanUtils.copyProperties(srcTransferRecord, transferRecord);
        		BeanUtils.copyProperties(dstTransferRecord, transferRecord);
        		//获取旧卡卡信息
        		srcTransferRecord.setDstIccid(null);
        		srcTransferRecord.setDstImsi(null);
        		srcTransferRecord.setDstCardNo(null);
        		TransferCard srcTransferCard=transferRecordService.existsByTransferCard(srcTransferRecord); 
        		//获取新卡卡信息
        		dstTransferRecord.setSrcIccid(null);
        		dstTransferRecord.setSrcImsi(null);
        		dstTransferRecord.setSrcCardNo(null);
        		TransferCard dstTransferCard=transferRecordService.existsByTransferCard(dstTransferRecord); 
      		
        		map.put("data", transferRecord);
        		map.put("srcTransferCard", srcTransferCard);
        		map.put("dstTransferCard", dstTransferCard);
        	}
        	
           
		} catch (Exception e) {
	        LOGGER.error("recycleRecord.toRecyclingOp error:"+e);
		}
        return map;
    }

    /**
     * 卡迁移
     * @param query
     * @return
     */
    @RequestMapping(value = "/transferingOp")
    public ResultEntity<TransferRecord> recyclingOp(TransferRecord transferRecord) {
    	ResultEntity<TransferRecord> resultEntity = new ResultEntity<TransferRecord>();
    	try {
    		//调用迁移接口
    		TransferRequest transferRequest = new TransferRequest();
			transferRequest.setFromImsi(transferRecord.getSrcImsi());
			transferRequest.setToImsi(transferRecord.getDstImsi());
			transferRequest.setConsumer("oms-fcadmin");
			transferRequest.setVersion("1.0.0");
			transferRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
			FlowResponse<?> retSrc = opsMgrManager.cardTransfer(transferRequest);
			if ("1000".equals(retSrc.getCode())) {
      			 transferRecord.setTransStatus("2");
      			 transferRecordService.transferingOp(transferRecord);
                 resultEntity.setReturnCode(ResultCode.SUCCESS);
                 resultEntity.setMessage("迁移成功!");
      		}else{
      			transferRecord.setTransStatus("2");
      			transferRecord.setFailReason(retSrc.getMessage());
     			transferRecordService.transferingOp(transferRecord);
                resultEntity.setReturnCode(ResultCode.ERROR);
                resultEntity.setMessage("迁移失败:"+retSrc.getMessage());
      		}
		} catch (Exception e) {
	        resultEntity.setReturnCode(ResultCode.ERROR);
	        resultEntity.setMessage("迁移失败,系统异常!");
	        LOGGER.error("transferRecord.transferingOp error:"+e);
		}     
        return resultEntity;
    }

    
    /**
     * 查看输入的iccid|imsi|cardNo是否存在
     * @param transferRecord
     * @return
     */
    @RequestMapping(value = "/existsByTransferCard" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> existsByTransferCard(@RequestBody TransferRecord transferRecord) {
    	Map<String, Object> map = new HashMap<String, Object>();      
        try {
        	//查看卡是否存在
        	TransferCard transferCard=transferRecordService.existsByTransferCard(transferRecord); 
        	if(transferCard!=null){
        		map.put("result", true);
        		map.put("transferCard", transferCard);
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

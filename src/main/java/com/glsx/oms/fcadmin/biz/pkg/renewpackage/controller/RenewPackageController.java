
package com.glsx.oms.fcadmin.biz.pkg.renewpackage.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.dubbo.config.annotation.Reference;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.FlowPkgRequest;

import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultCode;
import org.oreframework.web.ui.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glsx.oms.fcadmin.biz.pkg.renewpackage.model.RenewPackage;
import com.glsx.oms.fcadmin.biz.pkg.renewpackage.service.RenewPackageService;

/**
 * 服务商流量套歺 Controller
 */
@RestController
@RequestMapping(value = "/pkg")
public class RenewPackageController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(RenewPackageController.class);

    @Autowired
    private RenewPackageService renewPackageService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    // 如果用@Reference注解版本号不能去掉	
 	@Reference(version = "1.0.0")
 	private OpsMgrManager opsMgrManager;
    
    @RequestMapping(value = "/renewpackage/{id}", method = RequestMethod.GET)
    public ResultEntity<RenewPackage> get(@PathVariable("id") Integer id) {
        ResultEntity<RenewPackage> resultEntity = new ResultEntity<RenewPackage>();
        resultEntity.setData(renewPackageService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/renewpackage/{id}", method = RequestMethod.DELETE)
    public ResultEntity<RenewPackage> delete(@PathVariable("id") Integer id) {
        ResultEntity<RenewPackage> resultEntity = new ResultEntity<RenewPackage>();
        renewPackageService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete flowPackage id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/renewpackage", method = RequestMethod.POST)
    public ResultEntity<RenewPackage> save(@RequestBody RenewPackage flowPackage) {
        ResultEntity<RenewPackage> resultEntity = new ResultEntity<RenewPackage>();
        flowPackage.setLastOperatorId(1);
        flowPackage.setLastOperatorName("admin");
        
        try {
        	renewPackageService.save(flowPackage);

            FlowPkgRequest pkgRequest = new FlowPkgRequest();
            int[] pkCodeList = new int[1];
	        pkCodeList[0] = flowPackage.getPackageCode();
	        pkgRequest.setPkCodeList(pkCodeList);
	        pkgRequest.setConsumer("oms-fcadmin");
	        pkgRequest.setVersion("1.0.0");
	        pkgRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
	        FlowResponse<?> retStr = opsMgrManager.updatePackage(pkgRequest);
            LOGGER.info("通知管理平台变更套餐结果：" + retStr.getCode());
            if(!"1000".equals(retStr.getCode())){
	        	resultEntity.setReturnCode(ResultCode.ERROR);
	        }
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("保存失败", e);
		}
        
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/renewpackage", method = RequestMethod.GET)
    public ResponseEntity<RenewPackage> getAll(RenewPackage flowPackage, Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<RenewPackage> flowPackageList = renewPackageService.selectByPageNumSize(flowPackage);
        
        ResponseEntity<RenewPackage> responseObject = new ResponseEntity<RenewPackage>();
        long total = ((Page<RenewPackage>)flowPackageList).getTotal();
        responseObject.setData(flowPackageList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/getRenewPkg", method = RequestMethod.GET)
	@ResponseBody
    public ResponseEntity<RenewPackage> getRenewPkg(Integer packageType) {
        ResponseEntity<RenewPackage> responseObject = new ResponseEntity<RenewPackage>();
        List<RenewPackage> list = new ArrayList<RenewPackage>();
        try{
        	list = renewPackageService.getPackageList(packageType);
        }catch(Exception e)
        {
        	LOGGER.error("获取可续费套餐异常：", e);
        }
        responseObject.setData(list);
        return responseObject;
    }
    
    @RequestMapping(value = "/changeRenewPackageStatus", method = RequestMethod.POST)
    public ResultEntity<RenewPackage> changeRenewPackageStatus(@RequestBody RenewPackage flowPackage) {
        ResultEntity<RenewPackage> resultEntity = new ResultEntity<RenewPackage>();
        
        if(flowPackage.getStatus() == 1){
        	flowPackage.setStatus(2);
        }else{
        	flowPackage.setStatus(1);
        }
        
		try {
			renewPackageService.changePackageStatus(flowPackage);
	        resultEntity.setReturnCode(ResultCode.SUCCESS);
	        resultEntity.setMessage("保存成功!");

	        FlowPkgRequest pkgRequest = new FlowPkgRequest();
	        int[] pkCodeList = new int[1];
	        pkCodeList[0] = flowPackage.getPackageCode();
	        pkgRequest.setPkCodeList(pkCodeList);
	        pkgRequest.setConsumer("oms-fcadmin");
	        pkgRequest.setVersion("1.0.0");
	        pkgRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
	        FlowResponse<?> retStr = opsMgrManager.updatePackage(pkgRequest);
	        LOGGER.info("通知管理平台变更套餐结果：" + retStr.getCode());
	        if(!"1000".equals(retStr.getCode())){
	        	resultEntity.setReturnCode(ResultCode.ERROR);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return resultEntity;
    }
    
    @RequestMapping(value = "/renewpackage/exportFile", method = RequestMethod.POST)
    public ResultEntity<RenewPackage> exportFile(@RequestBody RenewPackage  flowPackageQuery)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("{");
        sb.append("\"taskName\":\"下载\",");
        sb.append("\"taskDesc\":\"下载\",");
        sb.append("\"taskType\":\"0\",");
        sb.append("\"taskSource\":\"XXXX平台\",");
        sb.append("\"taskCreator\":\"admin\",");
        sb.append("\"taskCreatorId\":\"123456\",");
        sb.append("\"taskExecParams\":{\"template\":\"order.xml\",\"kewWork\":\"\"}");
        sb.append("}");
        kafkaTemplate.sendDefault(sb.toString());
        
        ResultEntity<RenewPackage> resultEntity = new ResultEntity<RenewPackage>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }

}
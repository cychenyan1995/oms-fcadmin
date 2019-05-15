
package com.glsx.oms.fcadmin.biz.pkg.flowpackage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.dubbo.config.annotation.Reference;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.FlowPkgRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.pkg.flowpackage.service.FlowPackageService;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;

/**
 * 服务商流量套歺 Controller
 */
@RestController
@RequestMapping(value = "/pkg")
public class FlowPackageController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPackageController.class);

    @Autowired
    private FlowPackageService flowPackageService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    // 如果用@Reference注解版本号不能去掉
 	@Reference(version = "1.0.0")
 	private OpsMgrManager opsMgrManager;
    
    @RequestMapping(value = "/flowpackage/{id}", method = RequestMethod.GET)
    public ResultEntity<FlowPackage> get(@PathVariable("id") Integer id) {
        ResultEntity<FlowPackage> resultEntity = new ResultEntity<FlowPackage>();
        resultEntity.setData(flowPackageService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowpackage/{id}", method = RequestMethod.DELETE)
    public ResultEntity<FlowPackage> delete(@PathVariable("id") Integer id) {
        ResultEntity<FlowPackage> resultEntity = new ResultEntity<FlowPackage>();
        flowPackageService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete flowPackage id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowpackage", method = RequestMethod.POST)
    public ResultEntity<FlowPackage> save(@RequestBody FlowPackage flowPackage) {
        ResultEntity<FlowPackage> resultEntity = new ResultEntity<FlowPackage>();
        
        flowPackage.setPackageType(1);
        flowPackage.setLastOperatorId(1);
        flowPackage.setLastOperatorName("admin");
        
        try {
			flowPackageService.save(flowPackage);

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

    @RequestMapping(value = "/flowpackage", method = RequestMethod.GET)
    public ResponseEntity<FlowPackage> getAll(FlowPackage flowPackage, Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<FlowPackage> flowPackageList = flowPackageService.selectByPageNumSize(flowPackage);
        
        ResponseEntity<FlowPackage> responseObject = new ResponseEntity<FlowPackage>();
        long total = ((Page<FlowPackage>)flowPackageList).getTotal();
        responseObject.setData(flowPackageList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/getFlowPkg", method = RequestMethod.GET)
	@ResponseBody
    public ResponseEntity<FlowPackage> getFlowPkg(Integer packageType) {
        ResponseEntity<FlowPackage> responseObject = new ResponseEntity<FlowPackage>();
        List<FlowPackage> list = new ArrayList<FlowPackage>();
        try{
        	list = flowPackageService.getPackageList(packageType);
        }catch(Exception e)
        {
        	LOGGER.error("获取可续费套餐异常：", e);
        }
        responseObject.setData(list);
        return responseObject;
    }
    
    @RequestMapping(value = "/changePackageStatus", method = RequestMethod.POST)
    public ResultEntity<FlowPackage> changePackageStatus(@RequestBody FlowPackage flowPackage) {
        ResultEntity<FlowPackage> resultEntity = new ResultEntity<FlowPackage>();
        
		try {
			if(flowPackage.getStatus() == 1){
	        	flowPackage.setStatus(2);
	        }else{
	        	flowPackage.setStatus(1);
	        }
	        
	        flowPackageService.changePackageStatus(flowPackage);
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
    
    @RequestMapping(value = "/flowpackage/existsByName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> existsByName(@RequestBody FlowPackage flowPackage) {
    	Map<String, Boolean> map = new HashMap<String, Boolean>();      
        try {
        	
            boolean result= flowPackageService.existsByName(flowPackage.getPackageName());
//            LOGGER.info("判断服务名是否重复:" + flowPackage.getPackageName() + "," + result);
            map.put("result", !result);
        } catch (Exception e) {
        	LOGGER.error("catch an exception in existsByName", e);
            map.put("result", false);
        }
        return map;
    }
    
    @RequestMapping(value = "/flowpackage/exportFile", method = RequestMethod.POST)
    public ResultEntity<FlowPackage> exportFile(@RequestBody FlowPackage  flowPackageQuery)
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
        
        ResultEntity<FlowPackage> resultEntity = new ResultEntity<FlowPackage>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }

}
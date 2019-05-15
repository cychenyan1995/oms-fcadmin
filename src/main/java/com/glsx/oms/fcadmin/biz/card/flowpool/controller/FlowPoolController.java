
package com.glsx.oms.fcadmin.biz.card.flowpool.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.card.flowpool.service.FlowPoolService;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPool;
import com.glsx.oms.fcadmin.biz.card.flowpool.model.FlowPoolMonthDetail;

/**
 * 流量池定义 Controller
 */
@RestController
@RequestMapping(value = "/card")
public class FlowPoolController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPoolController.class);

    @Autowired
    private FlowPoolService flowPoolService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/flowpool/{id}", method = RequestMethod.GET)
    public ResultEntity<FlowPool> get(@PathVariable("id") Integer id) {
        ResultEntity<FlowPool> resultEntity = new ResultEntity<FlowPool>();
        resultEntity.setData(flowPoolService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowpool/{id}", method = RequestMethod.DELETE)
    public ResultEntity<FlowPool> delete(@PathVariable("id") Integer id) {
        ResultEntity<FlowPool> resultEntity = new ResultEntity<FlowPool>();
        flowPoolService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete flowPool id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowpool", method = RequestMethod.POST)
    public ResultEntity<FlowPool> save(@RequestBody FlowPool flowPool) {
        ResultEntity<FlowPool> resultEntity = new ResultEntity<FlowPool>();
        flowPool.setLastOperatorId(111);
        flowPool.setLastOperatorName("admin");
        flowPoolService.save(flowPool);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/flowpool", method = RequestMethod.GET)
    public ResponseEntity<FlowPool> getAll(FlowPool flowPool, Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<FlowPool> flowPoolList = flowPoolService.getAll(flowPool, pagination);
        
        if(flowPoolList != null && flowPoolList.size() > 0){
        	for (FlowPool tempPool : flowPoolList) {
        		String postageName = tempPool.getPostageName();
				if(postageName != null && !"".equals(postageName)){
					tempPool.setPostageName(postageName.replace(";", ";<br/>"));
				}
			}
        }
        
        ResponseEntity<FlowPool> responseObject = new ResponseEntity<FlowPool>();
        long total = ((Page<FlowPool>)flowPoolList).getTotal();
        responseObject.setData(flowPoolList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/flowPoolMonthDetail", method = RequestMethod.GET)
    public ResponseEntity<FlowPoolMonthDetail> getFlowPoolMonthDetail(FlowPoolMonthDetail detail, Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<FlowPoolMonthDetail> flowPoolList = flowPoolService.getFlowPoolMonthDetail(detail, pagination);
        
        ResponseEntity<FlowPoolMonthDetail> responseObject = new ResponseEntity<FlowPoolMonthDetail>();
        long total = ((Page<FlowPoolMonthDetail>)flowPoolList).getTotal();
        responseObject.setData(flowPoolList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/flowpool/existsByName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> existsByName(@RequestBody FlowPool  flowPoolQuery) {
    	Map<String, Boolean> map = new HashMap<String, Boolean>();      
        try {
        	
            boolean result= flowPoolService.existsByName(flowPoolQuery.getFlowpoolName());
            LOGGER.info("判断服务名是否重复:"+flowPoolQuery.getFlowpoolName()+","+result);   
            map.put("result", !result);
        } catch (Exception e) {
        	LOGGER.error("catch an exception in existsByName", e);
            map.put("result", false);
        }
        return map;
    }
    
    @RequestMapping(value = "/flowpool/exportFile", method = RequestMethod.POST)
    public ResultEntity<FlowPool> exportFile(@RequestBody FlowPool  flowPoolQuery)
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
        
        ResultEntity<FlowPool> resultEntity = new ResultEntity<FlowPool>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
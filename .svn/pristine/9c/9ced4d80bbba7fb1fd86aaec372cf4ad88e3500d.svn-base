
package com.glsx.oms.fcadmin.biz.sp.flowservice.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.sp.flowservice.service.FlowServiceService;
import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;

/**
 * 服务商流量服务包 Controller
 */
@RestController
@RequestMapping(value = "/sp")
public class FlowServiceController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowServiceController.class);

    @Autowired
    private FlowServiceService flowServiceService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/flowservice/{id}", method = RequestMethod.GET)
    public ResultEntity<FlowService> get(@PathVariable("id") Integer id) {
        ResultEntity<FlowService> resultEntity = new ResultEntity<FlowService>();
        resultEntity.setData(flowServiceService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowservice/{id}", method = RequestMethod.DELETE)
    public ResultEntity<FlowService> delete(@PathVariable("id") Integer id) {
        ResultEntity<FlowService> resultEntity = new ResultEntity<FlowService>();
        flowServiceService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete flowService id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowservice", method = RequestMethod.POST)
    public ResultEntity<FlowService> save(@RequestBody FlowService flowService) {
        ResultEntity<FlowService> resultEntity = new ResultEntity<FlowService>();
        flowServiceService.save(flowService);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/flowservice", method = RequestMethod.GET)
    public ResponseEntity<FlowService> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<FlowService> flowServiceList = flowServiceService.getAll();
        
        ResponseEntity<FlowService> responseObject = new ResponseEntity<FlowService>();
        long total = ((Page<FlowService>)flowServiceList).getTotal();
        responseObject.setData(flowServiceList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/flowservice/exportFile", method = RequestMethod.POST)
    public ResultEntity<FlowService> exportFile(@RequestBody FlowService  flowServiceQuery)
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
        
        ResultEntity<FlowService> resultEntity = new ResultEntity<FlowService>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
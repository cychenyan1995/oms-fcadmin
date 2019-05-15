
package com.glsx.oms.fcadmin.biz.sp.flowpackagelist.controller;

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

import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.service.FlowPackageListService;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model.FlowPackageList;

/**
 * 服务商流量套歺 Controller
 */
@RestController
@RequestMapping(value = "/sp")
public class FlowPackageListController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPackageListController.class);

    @Autowired
    private FlowPackageListService flowPackageListService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/flowpackagelist/{id}", method = RequestMethod.GET)
    public ResultEntity<FlowPackageList> get(@PathVariable("id") Integer id) {
        ResultEntity<FlowPackageList> resultEntity = new ResultEntity<FlowPackageList>();
        resultEntity.setData(flowPackageListService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowpackagelist/{id}", method = RequestMethod.DELETE)
    public ResultEntity<FlowPackageList> delete(@PathVariable("id") Integer id) {
        ResultEntity<FlowPackageList> resultEntity = new ResultEntity<FlowPackageList>();
        flowPackageListService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete flowPackageList id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowpackagelist", method = RequestMethod.POST)
    public ResultEntity<FlowPackageList> save(@RequestBody FlowPackageList flowPackageList) {
        ResultEntity<FlowPackageList> resultEntity = new ResultEntity<FlowPackageList>();
        flowPackageListService.save(flowPackageList);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/flowpackagelist", method = RequestMethod.GET)
    public ResponseEntity<FlowPackageList> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<FlowPackageList> flowPackageListList = flowPackageListService.getAll();
        
        ResponseEntity<FlowPackageList> responseObject = new ResponseEntity<FlowPackageList>();
        long total = ((Page<FlowPackageList>)flowPackageListList).getTotal();
        responseObject.setData(flowPackageListList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/flowpackagelist/exportFile", method = RequestMethod.POST)
    public ResultEntity<FlowPackageList> exportFile(@RequestBody FlowPackageList  flowPackageListQuery)
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
        
        ResultEntity<FlowPackageList> resultEntity = new ResultEntity<FlowPackageList>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
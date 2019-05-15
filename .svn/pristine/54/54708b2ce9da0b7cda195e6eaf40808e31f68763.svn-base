
package com.glsx.oms.fcadmin.biz.op.postageplan.controller;

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

import com.glsx.oms.fcadmin.biz.op.postageplan.service.PostagePlanService;
import com.glsx.oms.fcadmin.biz.op.postageplan.model.PostagePlan;

/**
 * 运营商资费计划 Controller
 */
@RestController
@RequestMapping(value = "/op")
public class PostagePlanController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(PostagePlanController.class);

    @Autowired
    private PostagePlanService postagePlanService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/postageplan/{id}", method = RequestMethod.GET)
    public ResultEntity<PostagePlan> get(@PathVariable("id") Integer id) {
        ResultEntity<PostagePlan> resultEntity = new ResultEntity<PostagePlan>();
        resultEntity.setData(postagePlanService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/postageplan/{id}", method = RequestMethod.DELETE)
    public ResultEntity<PostagePlan> delete(@PathVariable("id") Integer id) {
        ResultEntity<PostagePlan> resultEntity = new ResultEntity<PostagePlan>();
        postagePlanService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete postagePlan id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/postageplan", method = RequestMethod.POST)
    public ResultEntity<PostagePlan> save(@RequestBody PostagePlan postagePlan) {
        ResultEntity<PostagePlan> resultEntity = new ResultEntity<PostagePlan>();
        postagePlanService.save(postagePlan);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/postageplan", method = RequestMethod.GET)
    public ResponseEntity<PostagePlan> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<PostagePlan> postagePlanList = postagePlanService.getAll();
        
        ResponseEntity<PostagePlan> responseObject = new ResponseEntity<PostagePlan>();
        long total = ((Page<PostagePlan>)postagePlanList).getTotal();
        responseObject.setData(postagePlanList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/postageplan/exportFile", method = RequestMethod.POST)
    public ResultEntity<PostagePlan> exportFile(@RequestBody PostagePlan  postagePlanQuery)
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
        
        ResultEntity<PostagePlan> resultEntity = new ResultEntity<PostagePlan>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
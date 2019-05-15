
package com.glsx.oms.fcadmin.biz.card.postage.controller;

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

import com.glsx.oms.fcadmin.biz.card.postage.service.PostageService;
import com.glsx.oms.fcadmin.biz.card.postage.model.Postage;

/**
 * 流量池与资费计划关联表 Controller
 */
@RestController
@RequestMapping(value = "/card")
public class PostageController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(PostageController.class);

    @Autowired
    private PostageService postageService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/postage/{id}", method = RequestMethod.GET)
    public ResultEntity<Postage> get(@PathVariable("id") Integer id) {
        ResultEntity<Postage> resultEntity = new ResultEntity<Postage>();
        resultEntity.setData(postageService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/postage/{id}", method = RequestMethod.DELETE)
    public ResultEntity<Postage> delete(@PathVariable("id") Integer id) {
        ResultEntity<Postage> resultEntity = new ResultEntity<Postage>();
        postageService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete postage id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/postage", method = RequestMethod.POST)
    public ResultEntity<Postage> save(@RequestBody Postage postage) {
        ResultEntity<Postage> resultEntity = new ResultEntity<Postage>();
        postageService.save(postage);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/postage", method = RequestMethod.GET)
    public ResponseEntity<Postage> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Postage> postageList = postageService.getAll();
        
        ResponseEntity<Postage> responseObject = new ResponseEntity<Postage>();
        long total = ((Page<Postage>)postageList).getTotal();
        responseObject.setData(postageList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/postage/getByPostageId/{postageId}", method = RequestMethod.GET)
    public ResultEntity<Postage> getByPostageId(@PathVariable("postageId") Integer postageId) {
        ResultEntity<Postage> resultEntity = new ResultEntity<Postage>();
        resultEntity.setData(postageService.getByPostageId(postageId));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/postage/exportFile", method = RequestMethod.POST)
    public ResultEntity<Postage> exportFile(@RequestBody Postage  postageQuery)
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
        
        ResultEntity<Postage> resultEntity = new ResultEntity<Postage>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
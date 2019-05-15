
package com.glsx.oms.fcadmin.biz.recovery.transfer.controller;

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

import com.glsx.oms.fcadmin.biz.recovery.transfer.service.TransferService;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.Transfer;

/**
 * 流量卡迁移记录 Controller
 */
@RestController
@RequestMapping(value = "/recovery")
public class TransferController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(TransferController.class);

    @Autowired
    private TransferService transferService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/transfer/{id}", method = RequestMethod.GET)
    public ResultEntity<Transfer> get(@PathVariable("id") Integer id) {
        ResultEntity<Transfer> resultEntity = new ResultEntity<Transfer>();
        resultEntity.setData(transferService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/transfer/{id}", method = RequestMethod.DELETE)
    public ResultEntity<Transfer> delete(@PathVariable("id") Integer id) {
        ResultEntity<Transfer> resultEntity = new ResultEntity<Transfer>();
        transferService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete transfer id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/transfer", method = RequestMethod.POST)
    public ResultEntity<Transfer> save(@RequestBody Transfer transfer) {
        ResultEntity<Transfer> resultEntity = new ResultEntity<Transfer>();
        transferService.save(transfer);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/transfer", method = RequestMethod.GET)
    public ResponseEntity<Transfer> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Transfer> transferList = transferService.getAll();
        
        ResponseEntity<Transfer> responseObject = new ResponseEntity<Transfer>();
        long total = ((Page<Transfer>)transferList).getTotal();
        responseObject.setData(transferList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/transfer/exportFile", method = RequestMethod.POST)
    public ResultEntity<Transfer> exportFile(@RequestBody Transfer  transferQuery)
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
        
        ResultEntity<Transfer> resultEntity = new ResultEntity<Transfer>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
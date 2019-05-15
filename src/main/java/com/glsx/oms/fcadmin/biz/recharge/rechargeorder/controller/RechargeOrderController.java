
package com.glsx.oms.fcadmin.biz.recharge.rechargeorder.controller;

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

import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.service.RechargeOrderService;
import com.glsx.oms.fcadmin.biz.recharge.rechargeorder.model.RechargeOrder;

/**
 * 充值订单表 Controller
 */
@RestController
@RequestMapping(value = "/recharge")
public class RechargeOrderController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(RechargeOrderController.class);

    @Autowired
    private RechargeOrderService rechargeOrderService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/rechargeorder/{id}", method = RequestMethod.GET)
    public ResultEntity<RechargeOrder> get(@PathVariable("id") Integer id) {
        ResultEntity<RechargeOrder> resultEntity = new ResultEntity<RechargeOrder>();
        resultEntity.setData(rechargeOrderService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/rechargeorder/{id}", method = RequestMethod.DELETE)
    public ResultEntity<RechargeOrder> delete(@PathVariable("id") Integer id) {
        ResultEntity<RechargeOrder> resultEntity = new ResultEntity<RechargeOrder>();
        rechargeOrderService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete rechargeOrder id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/rechargeorder", method = RequestMethod.POST)
    public ResultEntity<RechargeOrder> save(@RequestBody RechargeOrder rechargeOrder) {
        ResultEntity<RechargeOrder> resultEntity = new ResultEntity<RechargeOrder>();
        rechargeOrderService.save(rechargeOrder);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/rechargeorder", method = RequestMethod.GET)
    public ResponseEntity<RechargeOrder> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<RechargeOrder> rechargeOrderList = rechargeOrderService.getAll();
        
        ResponseEntity<RechargeOrder> responseObject = new ResponseEntity<RechargeOrder>();
        long total = ((Page<RechargeOrder>)rechargeOrderList).getTotal();
        responseObject.setData(rechargeOrderList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/rechargeorder/exportFile", method = RequestMethod.POST)
    public ResultEntity<RechargeOrder> exportFile(@RequestBody RechargeOrder  rechargeOrderQuery)
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
        
        ResultEntity<RechargeOrder> resultEntity = new ResultEntity<RechargeOrder>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
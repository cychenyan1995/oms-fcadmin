
package com.glsx.oms.fcadmin.biz.card.orderinfo.controller;

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

import com.glsx.oms.fcadmin.biz.card.orderinfo.service.OrderInfoService;
import com.glsx.oms.fcadmin.biz.card.orderinfo.model.OrderInfo;

/**
 * 流量卡入库订单管理 Controller
 */
@RestController
@RequestMapping(value = "/card")
public class OrderInfoController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(OrderInfoController.class);

    @Autowired
    private OrderInfoService orderInfoService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/orderinfo/{id}", method = RequestMethod.GET)
    public ResultEntity<OrderInfo> get(@PathVariable("id") Integer id) {
        ResultEntity<OrderInfo> resultEntity = new ResultEntity<OrderInfo>();
        resultEntity.setData(orderInfoService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/orderinfo/{id}", method = RequestMethod.DELETE)
    public ResultEntity<OrderInfo> delete(@PathVariable("id") Integer id) {
        ResultEntity<OrderInfo> resultEntity = new ResultEntity<OrderInfo>();
        orderInfoService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete orderInfo id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/orderinfo", method = RequestMethod.POST)
    public ResultEntity<OrderInfo> save(@RequestBody OrderInfo orderInfo) {
        ResultEntity<OrderInfo> resultEntity = new ResultEntity<OrderInfo>();
        orderInfoService.save(orderInfo);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/orderinfo", method = RequestMethod.GET)
    public ResponseEntity<OrderInfo> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<OrderInfo> orderInfoList = orderInfoService.getAll();
        
        ResponseEntity<OrderInfo> responseObject = new ResponseEntity<OrderInfo>();
        long total = ((Page<OrderInfo>)orderInfoList).getTotal();
        responseObject.setData(orderInfoList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/orderinfo/exportFile", method = RequestMethod.POST)
    public ResultEntity<OrderInfo> exportFile(@RequestBody OrderInfo  orderInfoQuery)
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
        
        ResultEntity<OrderInfo> resultEntity = new ResultEntity<OrderInfo>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
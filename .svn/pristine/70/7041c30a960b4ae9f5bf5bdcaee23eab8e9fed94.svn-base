
package com.glsx.oms.fcadmin.biz.op.networkaccess.controller;

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

import com.glsx.oms.fcadmin.biz.op.networkaccess.service.NetworkAccessService;
import com.glsx.oms.fcadmin.biz.op.networkaccess.model.NetworkAccess;

/**
 * 流量平台电信运营商通讯计划定义 Controller
 */
@RestController
@RequestMapping(value = "/op")
public class NetworkAccessController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(NetworkAccessController.class);

    @Autowired
    private NetworkAccessService networkAccessService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/networkaccess/{id}", method = RequestMethod.GET)
    public ResultEntity<NetworkAccess> get(@PathVariable("id") Integer id) {
        ResultEntity<NetworkAccess> resultEntity = new ResultEntity<NetworkAccess>();
        resultEntity.setData(networkAccessService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/networkaccess/{id}", method = RequestMethod.DELETE)
    public ResultEntity<NetworkAccess> delete(@PathVariable("id") Integer id) {
        ResultEntity<NetworkAccess> resultEntity = new ResultEntity<NetworkAccess>();
        networkAccessService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete networkAccess id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/networkaccess", method = RequestMethod.POST)
    public ResultEntity<NetworkAccess> save(@RequestBody NetworkAccess networkAccess) {
        ResultEntity<NetworkAccess> resultEntity = new ResultEntity<NetworkAccess>();
        networkAccessService.save(networkAccess);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/networkaccess", method = RequestMethod.GET)
    public ResponseEntity<NetworkAccess> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<NetworkAccess> networkAccessList = networkAccessService.getAll();
        
        ResponseEntity<NetworkAccess> responseObject = new ResponseEntity<NetworkAccess>();
        long total = ((Page<NetworkAccess>)networkAccessList).getTotal();
        responseObject.setData(networkAccessList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/networkaccess/exportFile", method = RequestMethod.POST)
    public ResultEntity<NetworkAccess> exportFile(@RequestBody NetworkAccess  networkAccessQuery)
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
        
        ResultEntity<NetworkAccess> resultEntity = new ResultEntity<NetworkAccess>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
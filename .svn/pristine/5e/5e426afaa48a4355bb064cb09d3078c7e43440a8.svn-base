
package com.glsx.oms.fcadmin.biz.card.changelog.controller;

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

import com.glsx.oms.fcadmin.biz.card.changelog.service.ChangeLogService;
import com.glsx.oms.fcadmin.biz.card.changelog.model.ChangeLog;

/**
 * 流量卡变更日志 Controller
 */
@RestController
@RequestMapping(value = "/card")
public class ChangeLogController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(ChangeLogController.class);

    @Autowired
    private ChangeLogService changeLogService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/changelog/{id}", method = RequestMethod.GET)
    public ResultEntity<ChangeLog> get(@PathVariable("id") Integer id) {
        ResultEntity<ChangeLog> resultEntity = new ResultEntity<ChangeLog>();
        resultEntity.setData(changeLogService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/changelog/{id}", method = RequestMethod.DELETE)
    public ResultEntity<ChangeLog> delete(@PathVariable("id") Integer id) {
        ResultEntity<ChangeLog> resultEntity = new ResultEntity<ChangeLog>();
        changeLogService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete changeLog id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/changelog", method = RequestMethod.POST)
    public ResultEntity<ChangeLog> save(@RequestBody ChangeLog changeLog) {
        ResultEntity<ChangeLog> resultEntity = new ResultEntity<ChangeLog>();
        changeLogService.save(changeLog);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/changelog", method = RequestMethod.GET)
    public ResponseEntity<ChangeLog> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<ChangeLog> changeLogList = changeLogService.getAll();
        
        ResponseEntity<ChangeLog> responseObject = new ResponseEntity<ChangeLog>();
        long total = ((Page<ChangeLog>)changeLogList).getTotal();
        responseObject.setData(changeLogList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/changelog/exportFile", method = RequestMethod.POST)
    public ResultEntity<ChangeLog> exportFile(@RequestBody ChangeLog  changeLogQuery)
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
        
        ResultEntity<ChangeLog> resultEntity = new ResultEntity<ChangeLog>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
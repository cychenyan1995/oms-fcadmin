
package com.glsx.oms.fcadmin.biz.recovery.recycle.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.glsx.oms.fcadmin.biz.recovery.recycle.service.RecycleService;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.Recycle;
import com.glsx.oms.fcadmin.biz.recovery.recycle.model.RecycleQuery;

/**
 * 流量卡回收处理 Controller
 */
@RestController
@RequestMapping(value = "/recovery")
public class RecycleController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(RecycleController.class);

    @Autowired
    private RecycleService recycleService;
    
    
    
    @RequestMapping(value = "/recycle/{id}", method = RequestMethod.GET)
    public ResultEntity<Recycle> get(@PathVariable("id") Integer id) {
        ResultEntity<Recycle> resultEntity = new ResultEntity<Recycle>();
        resultEntity.setData(recycleService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    
    
    @RequestMapping(value = "/recycle", method = RequestMethod.POST)
    public ResultEntity<Recycle> save(@RequestBody Recycle recycle) {
        ResultEntity<Recycle> resultEntity = new ResultEntity<Recycle>();
        recycleService.save(recycle);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/recycle", method = RequestMethod.GET)
    public ResponseEntity<Recycle> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Recycle> recycleList = recycleService.getAll();
        
        ResponseEntity<Recycle> responseObject = new ResponseEntity<Recycle>();
        long total = ((Page<Recycle>)recycleList).getTotal();
        responseObject.setData(recycleList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    
    @RequestMapping(value = "/toRecyclingOp/{id}", method = RequestMethod.GET)
    public ResultEntity<RecycleQuery> toRecyclingOp(@PathVariable("id") Integer id) {
        ResultEntity<RecycleQuery> resultEntity = new ResultEntity<RecycleQuery>();
        resultEntity.setData(null);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    


    
    
}
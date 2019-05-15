
package com.glsx.oms.fcadmin.biz.op.op.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.op.op.service.OpService;
import com.glsx.oms.fcadmin.biz.op.op.model.Op;

/**
 * 网络运营商 Controller
 */
@RestController
@RequestMapping(value = "/op")
public class OpController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(OpController.class);

    @Autowired
    private OpService opService;
    
    /**
     * 添加
     * @param op
     * @return
     */
    @RequestMapping(value = "/op", method = RequestMethod.POST)
    public ResultEntity<Op> save(@RequestBody Op op) {
        ResultEntity<Op> resultEntity = new ResultEntity<Op>();
        if (op.getOwned() == 3) {//联通
        	 opService.addOp(op);
		}else {//移动
			opService.addMop(op);
		}
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    /**
     * 分页获取
     * @param op
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/op", method = RequestMethod.GET)
    public ResponseEntity<Op> getAll(Op op,Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Op> opList = opService.getOpList(op);
        ResponseEntity<Op> responseObject = new ResponseEntity<Op>();
        long total = ((Page<Op>)opList).getTotal();
        responseObject.setData(opList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    /**
     * 获取移动
     * @param op
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/mop", method = RequestMethod.GET)
    public ResponseEntity<Op> getAllOp(Op op,Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Op> opList = opService.getMobileOpList(op);
        ResponseEntity<Op> responseObject = new ResponseEntity<Op>();
        long total = ((Page<Op>)opList).getTotal();
        responseObject.setData(opList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    /**
     * 判断名称是否重复
     * @param op
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/existsByName")
    @ResponseBody
    public Map<String, Object> existsByName(@RequestBody Op op) {
    	Map<String, Object> map=new HashMap<String, Object>();
        Integer count = opService.existsByName(op);
        if(count!=null&&count>0){
        	map.put("result", false);	
        }else{
        	map.put("result", true);	
        }
        return map;
    }
  
}
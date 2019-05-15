package com.glsx.oms.fcadmin.biz.pkg.renewpackage.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glsx.oms.fcadmin.biz.pkg.renewpackage.mapper.RenewPackageMapper;
import com.glsx.oms.fcadmin.biz.pkg.renewpackage.model.RenewPackage;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.mapper.FlowPackageListMapper;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model.FlowPackageList;
import com.glsx.oms.fcadmin.biz.sp.flowservice.mapper.FlowServiceMapper;
import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;

/**
 * 服务商流量套歺 Service
 */
@Service
public class RenewPackageService {

    private final static Logger LOGGER = LoggerFactory.getLogger(RenewPackageService.class);
    
    @Autowired
    private RenewPackageMapper renewPackageMapper;
    
    @Autowired
    private FlowServiceMapper flowServiceMapper;
    
    @Autowired
    private FlowPackageListMapper flowPackageListMapper;
    
    public List<RenewPackage> getAll(){
        return renewPackageMapper.selectAll();
    }
    
    public List<RenewPackage> selectByPageNumSize(RenewPackage flowPackage){
        return renewPackageMapper.selectByPageNumSize(flowPackage);
    }
    
    public List<RenewPackage> getPackageList(Integer type){
        return renewPackageMapper.getPackageList(type);
    }

    public RenewPackage getById(Integer id) {
        return renewPackageMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return renewPackageMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(RenewPackage flowPackage) throws Exception {
        LOGGER.info("创建续费套餐：" + flowPackage.toString());
    	renewPackageMapper.saveFlowPackage(flowPackage);

    	FlowService flowService = new FlowService();
    	BeanUtils.copyProperties(flowService, flowPackage);
    	flowService.setFlowservName("套餐一");
        if(0 == flowPackage.getFlowservType()){
            flowService.setChargeCycle(flowPackage.getValidCycle());
            flowService.setChargeMode(flowPackage.getValidCycleUnit());

            flowService.setPerCycleFlow(flowPackage.getTotalFlow());
        }else if (1 == flowPackage.getFlowservType()){
            flowService.setTotalFlow(flowPackage.getPerCycleFlow() * flowPackage.getChargeCycle());
            flowService.setIsUnlimitFlow(false);
            flowService.setChargeMode(1);
        }
    	flowServiceMapper.saveFlowService(flowService);

        if(flowPackage.getPackageCode() == null){
            flowPackage.setPackageCode(20000);
        }
        LOGGER.info("PackageCode = " + flowPackage.getPackageCode());

        int flowPackageId = renewPackageMapper.getPackageIdByCode(flowPackage.getPackageCode());
    	FlowPackageList flowPackageList = new FlowPackageList();
    	BeanUtils.copyProperties(flowPackageList, flowPackage);
    	flowPackageList.setPackageId(flowPackageId);
    	flowPackageList.setFlowservId(flowService.getFlowservId());
    	flowPackageListMapper.saveFlowPackageList(flowPackageList);
    	
        return 1;
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
	public int changePackageStatus(RenewPackage flowPackage) {
		return renewPackageMapper.changePackageStatus(flowPackage);
	}
   
}
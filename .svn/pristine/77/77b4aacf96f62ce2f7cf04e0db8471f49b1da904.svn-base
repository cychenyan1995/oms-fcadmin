package com.glsx.oms.fcadmin.biz.pkg.flowpackage.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glsx.oms.fcadmin.biz.pkg.flowpackage.mapper.FlowPackageMapper;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.mapper.FlowPackageListMapper;
import com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model.FlowPackageList;
import com.glsx.oms.fcadmin.biz.sp.flowservice.mapper.FlowServiceMapper;
import com.glsx.oms.fcadmin.biz.sp.flowservice.model.FlowService;

/**
 * 服务商流量套歺 Service
 */
@Service
public class FlowPackageService {

    private final static Logger LOGGER = LoggerFactory.getLogger(FlowPackageService.class);
    
    @Autowired
    private FlowPackageMapper flowPackageMapper;
    
    @Autowired
    private FlowServiceMapper flowServiceMapper;
    
    @Autowired
    private FlowPackageListMapper flowPackageListMapper;
    
    public List<FlowPackage> getAll(){
        return flowPackageMapper.selectAll();
    }
    
    public List<FlowPackage> selectByPageNumSize(FlowPackage flowPackage){
        return flowPackageMapper.selectByPageNumSize(flowPackage);
    }
    
    public List<FlowPackage> getPackageList(Integer type){
        return flowPackageMapper.getPackageList(type);
    }
    
    public List<FlowPackage> getPackageListByOwner(FlowPackage flowPackage){
    	return flowPackageMapper.getPackageListByOwner(flowPackage);
    }

    public FlowPackage getById(Integer id) {
        return flowPackageMapper.selectByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int deleteById(Integer id) {
        return flowPackageMapper.deleteByPrimaryKey(id);
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
    public int save(FlowPackage flowPackage) throws Exception {
        LOGGER.info("创建开卡套餐：" + flowPackage.toString());
    	flowPackageMapper.saveFlowPackage(flowPackage);

    	FlowService flowService = new FlowService();
    	BeanUtils.copyProperties(flowService, flowPackage);
    	flowService.setFlowservName("套餐一");
        if(0 == flowPackage.getFlowservType()){
            //总流量
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
            flowPackage.setPackageCode(10000);
        }
        LOGGER.info("PackageCode = " + flowPackage.getPackageCode());

        int flowPackageId = flowPackageMapper.getPackageIdByCode(flowPackage.getPackageCode());
    	FlowPackageList flowPackageList = new FlowPackageList();
    	BeanUtils.copyProperties(flowPackageList, flowPackage);
    	flowPackageList.setPackageId(flowPackageId);
    	flowPackageList.setFlowservId(flowService.getFlowservId());
    	flowPackageListMapper.saveFlowPackageList(flowPackageList);
    	
        return 1;
    }

    @Transactional(rollbackFor = {IllegalArgumentException.class})
	public int changePackageStatus(FlowPackage flowPackage) {
		return flowPackageMapper.changePackageStatus(flowPackage);
	}
   
	public boolean existsByName(String packageName) {
		List<FlowPackage> list = flowPackageMapper.selectByName(packageName);
		if(list != null && list.size() > 0){
			return true;
		}
		return false;
	}
	
	public List<FlowPackage> getPackageByCardId(Integer cardId){
		return flowPackageMapper.getPackageByCardId(cardId);
	}
	
	public List<FlowPackage> getCurPkgByCardId(Integer cardId){
		return flowPackageMapper.getCurPkgByCardId(cardId);
	}
}
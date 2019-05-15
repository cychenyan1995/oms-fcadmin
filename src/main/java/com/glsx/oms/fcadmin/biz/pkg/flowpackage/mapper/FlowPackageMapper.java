package com.glsx.oms.fcadmin.biz.pkg.flowpackage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;

/**
 * 服务商流量套歺 Mapper
 */
@Mapper
public interface FlowPackageMapper extends OreMapper<FlowPackage>{
    
	public List<FlowPackage> getPackageList(Integer type);
	
	public List<FlowPackage> getPackageListByOwner(FlowPackage flowPackage);
	
	List<FlowPackage> selectByPageNumSize(FlowPackage flowPackage);

	public int changePackageStatus(FlowPackage flowPackage);
	
	public int saveFlowPackage(FlowPackage flowPackage);
	
	public int getPackageIdByCode(Integer packageCode);
	
	public List<FlowPackage> selectByName(String packageName);
	
	public List<FlowPackage> getPackageByCardId(Integer cardId);
	
	public List<FlowPackage> getCurPkgByCardId(Integer cardId);
   
}
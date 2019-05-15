package com.glsx.oms.fcadmin.biz.pkg.renewpackage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.pkg.renewpackage.model.RenewPackage;

/**
 * 服务商流量套歺 Mapper
 */
@Mapper
public interface RenewPackageMapper extends OreMapper<RenewPackage>{
    
	public List<RenewPackage> getPackageList(Integer type);
	
	List<RenewPackage> selectByPageNumSize(RenewPackage flowPackage);

	public int changePackageStatus(RenewPackage flowPackage);
	
	public int saveFlowPackage(RenewPackage flowPackage);
	
	public int getPackageIdByCode(Integer packageCode);
   
}
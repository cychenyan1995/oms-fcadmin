
package com.glsx.oms.fcadmin.biz.sp.flowpackagelist.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 服务商流量套歺 实体
 */
@Table(name = "flowmgn_sp_flowpackage_list")
public class FlowPackageList extends BaseModel{
	
	
	/**
	 * 序列ID
	 */
	@Id
	private Integer flowlistId;
	
	/**
	 * 套餐ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer packageId;
	
	/**
	 * 流量消耗次序（0：不分）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer consumeOrder;
	
	/**
	 * 流量服务ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer flowservId;

	public FlowPackageList(){
	}

	public FlowPackageList(
		java.lang.Integer flowlistId
	){
		this.flowlistId = flowlistId;
	}

		
	public void setFlowlistId(Integer value) {
		this.flowlistId = value;
	}
		
	public Integer getFlowlistId() {
		return this.flowlistId;
	}
		
	
		
	public void setPackageId(Integer value) {
		this.packageId = value;
	}
		
	public Integer getPackageId() {
		return this.packageId;
	}
		
	
		
	public void setConsumeOrder(Integer value) {
		this.consumeOrder = value;
	}
		
	public Integer getConsumeOrder() {
		return this.consumeOrder;
	}
		
	
		
	public void setFlowservId(Integer value) {
		this.flowservId = value;
	}
		
	public Integer getFlowservId() {
		return this.flowservId;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


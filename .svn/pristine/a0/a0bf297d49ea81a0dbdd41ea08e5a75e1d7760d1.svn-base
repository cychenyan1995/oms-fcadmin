
package com.glsx.oms.fcadmin.biz.card.postage.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量池与资费计划关联表 实体
 */
@Table(name = "flowmgn_flowpool_postage")
public class Postage extends BaseModel{
	
	
	/**
	 * 记录序列号
	 */
	@Id
	private Integer poolPostagelId;
	
	/**
	 * 流量池ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer flowpoolId;
	
	/**
	 * 资费计划
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer postageId;

	public Postage(){
	}

	public Postage(
		java.lang.Integer poolPostagelId
	){
		this.poolPostagelId = poolPostagelId;
	}

		
	public void setPoolPostagelId(Integer value) {
		this.poolPostagelId = value;
	}
		
	public Integer getPoolPostagelId() {
		return this.poolPostagelId;
	}
		
	
		
	public void setFlowpoolId(Integer value) {
		this.flowpoolId = value;
	}
		
	public Integer getFlowpoolId() {
		return this.flowpoolId;
	}
		
	
		
	public void setPostageId(Integer value) {
		this.postageId = value;
	}
		
	public Integer getPostageId() {
		return this.postageId;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


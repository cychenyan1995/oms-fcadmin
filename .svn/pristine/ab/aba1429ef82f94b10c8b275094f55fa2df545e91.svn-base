
package com.glsx.oms.fcadmin.biz.op.postageplan.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 运营商资费计划 实体
 */
@Table(name = "flowmgn_op_postageplan")
public class PostagePlan extends BaseModel{
	
	
	/**
	 * 序列ID,唯一标识
	 */
	@Id
	private Integer postageId;
	
	/**
	 * 资费编码
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer postageCode;
	
	/**
	 * 资费计划名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String postageName;
	
	/**
	 * 运营商ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer opId;
	
	/**
	 * 付款方式：0=预付-灵活共享池/1=后付
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer payMode;
	
	/**
	 * 是否分离计费 (0:不支持分离计费 / 1:支持分离计费)
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer isSeparateBill;
	
	/**
	 * 计划内流量(每月支付流量)
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer planFlow;
	
	/**
	 * 流量单位G/M
	 */
	@ColumnType(jdbcType=JdbcType.CHAR)
	private String flowUnit;
	
	/**
	 * 有效时长（单位：天）
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer validDays;
	
	/**
	 * 运营商每月的出帐日(0:自然月 1-28指定日期出帐）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer balanceDay;
	
	/**
	 * 超出流量计费方式
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float overChargemode;
	
	/**
	 * 超出流量单位G/M
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String overUnit;
	
	/**
	 * 共享流量（0=否/1=是）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer isShare;
	
	/**
	 * 是否针对APN （0=公网卡/1=APN卡）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer isApncard;
	
	/**
	 * 资费计划状态 （1启用 2停用）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;

	public PostagePlan(){
	}

	public PostagePlan(
		java.lang.Integer postageId
	){
		this.postageId = postageId;
	}

		
	public void setPostageId(Integer value) {
		this.postageId = value;
	}
		
	public Integer getPostageId() {
		return this.postageId;
	}
		
	
		
	public void setPostageCode(Integer value) {
		this.postageCode = value;
	}
		
	public Integer getPostageCode() {
		return this.postageCode;
	}
		
	
		
	public void setPostageName(String value) {
		this.postageName = value;
	}
		
	public String getPostageName() {
		return this.postageName;
	}
		
	
		
	public void setOpId(Integer value) {
		this.opId = value;
	}
		
	public Integer getOpId() {
		return this.opId;
	}
		
	
		
	public void setPayMode(Integer value) {
		this.payMode = value;
	}
		
	public Integer getPayMode() {
		return this.payMode;
	}
		
	
		
	public void setIsSeparateBill(Integer value) {
		this.isSeparateBill = value;
	}
		
	public Integer getIsSeparateBill() {
		return this.isSeparateBill;
	}
		
	
		
	public void setPlanFlow(Integer value) {
		this.planFlow = value;
	}
		
	public Integer getPlanFlow() {
		return this.planFlow;
	}
		
	
		
	public void setFlowUnit(String value) {
		this.flowUnit = value;
	}
		
	public String getFlowUnit() {
		return this.flowUnit;
	}
		
	
		
	public void setValidDays(Integer value) {
		this.validDays = value;
	}
		
	public Integer getValidDays() {
		return this.validDays;
	}
		
	
		
	public void setBalanceDay(Integer value) {
		this.balanceDay = value;
	}
		
	public Integer getBalanceDay() {
		return this.balanceDay;
	}
		
	
		
	public void setOverChargemode(Float value) {
		this.overChargemode = value;
	}
		
	public Float getOverChargemode() {
		return this.overChargemode;
	}
		
	
		
	public void setOverUnit(String value) {
		this.overUnit = value;
	}
		
	public String getOverUnit() {
		return this.overUnit;
	}
		
	
		
	public void setIsShare(Integer value) {
		this.isShare = value;
	}
		
	public Integer getIsShare() {
		return this.isShare;
	}
		
	
		
	public void setIsApncard(Integer value) {
		this.isApncard = value;
	}
		
	public Integer getIsApncard() {
		return this.isApncard;
	}
		
	
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


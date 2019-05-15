
package com.glsx.oms.fcadmin.biz.sp.flowservice.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 服务商流量服务包 实体
 */
@Table(name = "flowmgn_sp_flowservice")
public class FlowService extends BaseModel{
	
	
	/**
	 * 流量服务包序列ID
	 */
	@Id
	private Integer flowservId;
	
	/**
	 * 流量服务包编号
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer flowservCode;
	
	/**
	 * 流量服务包名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String flowservName;
	
	/**
	 * 流量包别名
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String flowservAlias;
	
	/**
	 * 流量服务包分类(分类计费)：0=基础套餐/1=增值套餐
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer flowservCategory;
	
	/**
	 * 流量服务描述
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String flowservDesc;
	
	/**
	 * 是否无限流量（0：有限流量 1：无限流量）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean isUnlimitFlow;
	
	/**
	 * 流量服务类型（0：总流量 1：月付流量 2：其他）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean flowservType;
	
	/**
	 * 流量服务包总流量
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float totalFlow;
	
	/**
	 * 每期流量
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float perCycleFlow;
	
	/**
	 * 流量服务包单位（G/M）
	 */
	@ColumnType(jdbcType=JdbcType.CHAR)
	private String flowUnit;
	
	/**
	 * 流量服务包状态（1：上架 2：下架)
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;
	
	/**
	 * 计费方式:(0：天/ 1：月 /2：年）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer chargeMode;
	
	/**
	 * 计费周期
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer chargeCycle;
	
	/**
	 * 是否月底清零（0：不清零 1：清零）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer isMonthClean;
	
	/**
	 * 是否当月生效（0：下期生效 1：立即生效）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer isNowApply;
	
	/**
	 * 月付流量月付日期（1-31，默认每月1号）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer flowservPayDate;
	
	/**
	 * 流量服务包失效时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date flowservEndtime;
	
	/**
	 * 流量使用完操作 （0：维持现状 1：停卡 2：变更通讯计划）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer overFlowOp;
	
	/**
	 * 流量超出时变更通讯计划(0:表示不处理）
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer overFlowAccessId;

	public FlowService(){
	}

	public FlowService(
		java.lang.Integer flowservId
	){
		this.flowservId = flowservId;
	}

		
	public void setFlowservId(Integer value) {
		this.flowservId = value;
	}
		
	public Integer getFlowservId() {
		return this.flowservId;
	}
		
	
		
	public void setFlowservCode(Integer value) {
		this.flowservCode = value;
	}
		
	public Integer getFlowservCode() {
		return this.flowservCode;
	}
		
	
		
	public void setFlowservName(String value) {
		this.flowservName = value;
	}
		
	public String getFlowservName() {
		return this.flowservName;
	}
		
	
		
	public void setFlowservAlias(String value) {
		this.flowservAlias = value;
	}
		
	public String getFlowservAlias() {
		return this.flowservAlias;
	}
		
	
		
	public void setFlowservCategory(Integer value) {
		this.flowservCategory = value;
	}
		
	public Integer getFlowservCategory() {
		return this.flowservCategory;
	}
		
	
		
	public void setFlowservDesc(String value) {
		this.flowservDesc = value;
	}
		
	public String getFlowservDesc() {
		return this.flowservDesc;
	}
		
	
		
	public void setIsUnlimitFlow(Boolean value) {
		this.isUnlimitFlow = value;
	}
		
	public Boolean getIsUnlimitFlow() {
		return this.isUnlimitFlow;
	}
		
	
		
	public void setFlowservType(Boolean value) {
		this.flowservType = value;
	}
		
	public Boolean getFlowservType() {
		return this.flowservType;
	}
		
	
		
	public void setTotalFlow(Float value) {
		this.totalFlow = value;
	}
		
	public Float getTotalFlow() {
		return this.totalFlow;
	}
		
	
		
	public void setPerCycleFlow(Float value) {
		this.perCycleFlow = value;
	}
		
	public Float getPerCycleFlow() {
		return this.perCycleFlow;
	}
		
	
		
	public void setFlowUnit(String value) {
		this.flowUnit = value;
	}
		
	public String getFlowUnit() {
		return this.flowUnit;
	}
		
	
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	
		
	public void setChargeMode(Integer value) {
		this.chargeMode = value;
	}
		
	public Integer getChargeMode() {
		return this.chargeMode;
	}
		
	
		
	public void setChargeCycle(Integer value) {
		this.chargeCycle = value;
	}
		
	public Integer getChargeCycle() {
		return this.chargeCycle;
	}
		
	
		
	public void setIsMonthClean(Integer value) {
		this.isMonthClean = value;
	}
		
	public Integer getIsMonthClean() {
		return this.isMonthClean;
	}
		
	
		
	public void setIsNowApply(Integer value) {
		this.isNowApply = value;
	}
		
	public Integer getIsNowApply() {
		return this.isNowApply;
	}
		
	
		
	public void setFlowservPayDate(Integer value) {
		this.flowservPayDate = value;
	}
		
	public Integer getFlowservPayDate() {
		return this.flowservPayDate;
	}
		
	
	
		
	public void setFlowservEndtime(Date value) {
		this.flowservEndtime = value;
	}
		
	public Date getFlowservEndtime() {
		return this.flowservEndtime;
	}
		
	
		
	public void setOverFlowOp(Integer value) {
		this.overFlowOp = value;
	}
		
	public Integer getOverFlowOp() {
		return this.overFlowOp;
	}
		
	
		
	public void setOverFlowAccessId(Integer value) {
		this.overFlowAccessId = value;
	}
		
	public Integer getOverFlowAccessId() {
		return this.overFlowAccessId;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


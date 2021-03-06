
package com.glsx.oms.fcadmin.biz.pkg.renewpackage.model;

import javax.persistence.Table;

import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;

/**
 * 服务商流量套歺 实体
 */
@Table(name = "flowmgn_sp_flowpackage")
public class RenewPackage extends FlowPackage{
	
	
	/**
	 * 
	 *//*
	private static final long serialVersionUID = -4434386067289632675L;

	*//**
	 * 序列ID
	 *//*
	@Id
	private Integer packageId;
	
	*//**
	 * 服务商ID（0：表示通用）
	 *//*
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer spId;
	
	*//**
	 * 服务套餐编号
	 *//*
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer packageCode;
	
	*//**
	 * 服务套餐名称
	 *//*
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String packageName;
	
	*//**
	 * 服务套餐别名(用于展示）
	 *//*
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String packageAlias;
	
	*//**
	 * 服务套餐类型:(1:初始套餐 2:续约套餐 3:续约流量包)
	 *//*
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer packageType;
	
	*//**
	 * 服务套餐描述
	 *//*
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String packageDesc;
	
	*//**
	 * 服务套餐价格
	 *//*
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float packagePrice;
	
	*//**
	 * 是否分离计费 (0:不支持分离计费 / 1:支持分离计费)
	 *//*
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer isSeparateBill;
	
	*//**
	 * 服务套餐状态（1：已上架 2：已下架)
	 *//*
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;
	
	*//**
	 * 初始套餐：激活套餐宽限期(天)
	 *//*
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer autoactivePackageDays;
	
	*//**
	 * 所属运营商
	 *//*
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer opId;
	
	*//**
	 * 有效期周期
	 *//*
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer validCycle;
	
	*//**
	 * 有效期周期单位 （1：天 /2：月）
	 *//*
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer validCycleUnit;
	
	*//**
	 * 续费套餐名称
	 *//*
//	private String flowpkgname;
	
	*//**
	 * 关联Id
	 *//*
//	private Integer relation_id;
	
	private String spName;
	
	private String opName;
	
	private Integer owned;
	
	private Integer flowservType;
	
	private float totalFlow;
	
	private String flowUnit;
	
	private Integer isUnlimitFlow;
	
	private Integer isMonthClean;
	
	private Integer isNowApply;
	
	private Integer flowservPayDate;
	
	private Integer chargeCycle;
	
	private float perCycleFlow;

	public RenewPackage(){
	}

	public RenewPackage(
		java.lang.Integer packageId
	){
		this.packageId = packageId;
	}
		
	public void setPackageId(Integer value) {
		this.packageId = value;
	}
		
	public Integer getPackageId() {
		return this.packageId;
	}
		
	public void setSpId(Integer value) {
		this.spId = value;
	}
		
	public Integer getSpId() {
		return this.spId;
	}
		
	public Integer getIsUnlimitFlow() {
		return isUnlimitFlow;
	}

	public void setIsUnlimitFlow(Integer isUnlimitFlow) {
		this.isUnlimitFlow = isUnlimitFlow;
	}

	public void setPackageCode(Integer value) {
		this.packageCode = value;
	}
		
	public Integer getPackageCode() {
		return this.packageCode;
	}
		
	public void setPackageName(String value) {
		this.packageName = value;
	}
		
	public String getPackageName() {
		return this.packageName;
	}
		
	public void setPackageAlias(String value) {
		this.packageAlias = value;
	}
		
	public String getPackageAlias() {
		return this.packageAlias;
	}
		
	public void setPackageType(Integer value) {
		this.packageType = value;
	}
		
	public Integer getPackageType() {
		return this.packageType;
	}
		
	public void setPackageDesc(String value) {
		this.packageDesc = value;
	}
		
	public String getPackageDesc() {
		return this.packageDesc;
	}
		
	public void setPackagePrice(Float value) {
		this.packagePrice = value;
	}
		
	public Float getPackagePrice() {
		return this.packagePrice;
	}
		
	public void setIsSeparateBill(Integer value) {
		this.isSeparateBill = value;
	}
		
	public Integer getIsSeparateBill() {
		return this.isSeparateBill;
	}
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	public void setAutoactivePackageDays(Integer value) {
		this.autoactivePackageDays = value;
	}
		
	public Integer getAutoactivePackageDays() {
		return this.autoactivePackageDays;
	}
		
	public void setOpId(Integer value) {
		this.opId = value;
	}
		
	public Integer getOpId() {
		return this.opId;
	}
		
	public void setValidCycle(Integer value) {
		this.validCycle = value;
	}
		
	public Integer getValidCycle() {
		return this.validCycle;
	}
		
	public void setValidCycleUnit(Integer value) {
		this.validCycleUnit = value;
	}
		
	public Integer getValidCycleUnit() {
		return this.validCycleUnit;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public Integer getOwned() {
		return owned;
	}

	public void setOwned(Integer owned) {
		this.owned = owned;
	}

	public Integer getFlowservType() {
		return flowservType;
	}

	public void setFlowservType(Integer flowservType) {
		this.flowservType = flowservType;
	}

	public float getTotalFlow() {
		return totalFlow;
	}

	public void setTotalFlow(float totalFlow) {
		this.totalFlow = totalFlow;
	}

	public String getFlowUnit() {
		return flowUnit;
	}

	public void setFlowUnit(String flowUnit) {
		this.flowUnit = flowUnit;
	}

	public Integer getIsMonthClean() {
		return isMonthClean;
	}

	public void setIsMonthClean(Integer isMonthClean) {
		this.isMonthClean = isMonthClean;
	}

	public Integer getIsNowApply() {
		return isNowApply;
	}

	public void setIsNowApply(Integer isNowApply) {
		this.isNowApply = isNowApply;
	}

	public Integer getFlowservPayDate() {
		return flowservPayDate;
	}

	public void setFlowservPayDate(Integer flowservPayDate) {
		this.flowservPayDate = flowservPayDate;
	}

	public Integer getChargeCycle() {
		return chargeCycle;
	}

	public void setChargeCycle(Integer chargeCycle) {
		this.chargeCycle = chargeCycle;
	}

	public float getPerCycleFlow() {
		return perCycleFlow;
	}

	public void setPerCycleFlow(float perCycleFlow) {
		this.perCycleFlow = perCycleFlow;
	}*/
	
	/*public String getFlowpkgname() {
		return flowpkgname;
	}

	public void setFlowpkgname(String flowpkgname) {
		this.flowpkgname = flowpkgname;
	}

	public Integer getRelation_id() {
		return relation_id;
	}

	public void setRelation_id(Integer relation_id) {
		this.relation_id = relation_id;
	}*/
	
}


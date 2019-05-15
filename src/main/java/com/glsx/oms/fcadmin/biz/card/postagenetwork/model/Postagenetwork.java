package com.glsx.oms.fcadmin.biz.card.postagenetwork.model;

import java.util.List;

public class Postagenetwork {

	private Integer postageId;		//资费计划ID号
	private String postageName;	//资费计划名称
	private String opName;		//运营商名称
	private Integer payMode;		//计划类型 0=预付-灵活共享池/1=后付
	private Integer isSeparateBill;	//是否分离计费 (0:不支持分离计费 / 1:支持分离计费)
	private Integer validDays;		//有效时长（单位：天）
	private Integer planFlow;	//计划内流量(每月支付流量)
	private String flowUnit;	//单位G/M
	private String createTime;	//新建时间
	private String updateTime;	//更新时间
	//private List<NetworkAccess> networkAccessList;

	public Integer getPostageId() {
		return postageId;
	}
	public void setPostageId(Integer postageId) {
		this.postageId = postageId;
	}
	public String getPostageName() {
		return postageName;
	}
	public void setPostageName(String postageName) {
		this.postageName = postageName;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public Integer getPayMode() {
		return payMode;
	}
	public void setPayMode(Integer payMode) {
		this.payMode = payMode;
	}
	public Integer getIsSeparateBill() {
		return isSeparateBill;
	}
	public void setIsSeparateBill(Integer isSeparateBill) {
		this.isSeparateBill = isSeparateBill;
	}
	public Integer getValidDays() {
		return validDays;
	}
	public void setValidDays(Integer validDays) {
		this.validDays = validDays;
	}
	public Integer getPlanFlow() {
		return planFlow;
	}
	public void setPlanFlow(Integer planFlow) {
		this.planFlow = planFlow;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getFlowUnit() {
		return flowUnit;
	}
	public void setFlowUnit(String flowUnit) {
		this.flowUnit = flowUnit;
	}
	/*public List<NetworkAccess> getNetworkAccessList() {
		return networkAccessList;
	}
	public void setNetworkAccessList(List<NetworkAccess> networkAccessList) {
		this.networkAccessList = networkAccessList;
	}*/
	
}

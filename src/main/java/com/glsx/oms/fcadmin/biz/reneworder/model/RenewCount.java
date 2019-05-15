package com.glsx.oms.fcadmin.biz.reneworder.model;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.oreframework.web.model.BaseModel;
/**
 * 续费统计
 * @author Administrator
 *
 */
public class RenewCount extends BaseModel{

	private String orderPaytime;  //支付时间
	private String spIdName;      //服务商名称
	private Integer wechatTotalNum;//微信续费次数
	private Integer openTotalNum;	//开放平台续费次数
	private Float wechatTotalMoney; //微信续费金额
	private Float openTotalMoney;	//开放平台续费金额
	private Integer allTotalNum;	//总次数   微信+开放
	private Float allTotalMoney;	//总金额
	
	public String getOrderPaytime() {
		return orderPaytime;
	}
	public void setOrderPaytime(String orderPaytime) {
		this.orderPaytime = orderPaytime;
	}
	public String getSpIdName() {
		return spIdName;
	}
	public void setSpIdName(String spIdName) {
		this.spIdName = spIdName;
	}
	public Integer getWechatTotalNum() {
		return wechatTotalNum;
	}
	public void setWechatTotalNum(Integer wechatTotalNum) {
		this.wechatTotalNum = wechatTotalNum;
	}
	public Integer getOpenTotalNum() {
		return openTotalNum;
	}
	public void setOpenTotalNum(Integer openTotalNum) {
		this.openTotalNum = openTotalNum;
	}
	public Float getWechatTotalMoney() {
		return wechatTotalMoney;
	}
	public void setWechatTotalMoney(Float wechatTotalMoney) {
		this.wechatTotalMoney = wechatTotalMoney;
	}
	public Float getOpenTotalMoney() {
		return openTotalMoney;
	}
	public void setOpenTotalMoney(Float openTotalMoney) {
		this.openTotalMoney = openTotalMoney;
	}
	public Integer getAllTotalNum() {
		return allTotalNum;
	}
	public void setAllTotalNum(Integer allTotalNum) {
		this.allTotalNum = allTotalNum;
	}
	public Float getAllTotalMoney() {
		return allTotalMoney;
	}
	public void setAllTotalMoney(Float allTotalMoney) {
		this.allTotalMoney = allTotalMoney;
	}
}
package com.glsx.oms.fcadmin.biz.reneworder.model;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.oreframework.web.model.BaseModel;

/**
 * 续费订单明细
 * @author Lenovo
 *
 */
public class RenewOrder extends BaseModel{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -3041152736051248685L;
	
	private String orderNo;//订单号
	private String iccid;//iccid
    private String imsi;//imsi
    private String cardNo;//网卡号
    private Integer cardStatus;//卡状态 
    private Integer source;//来源 0=微信商城/1=流量管理平台/2=开放平台
    private String merchantName;//服务商名称
    private String packageName;//套餐名称
    private Float orderPrice;//价格(元)
    private Integer payStatus;//支付状态
    private Integer openStatus;//开通状态
    private String payNo;//交易流水
    private String payTime;//交易时间
    
    //条件查询使用字段
    private String startTime;
    private String endTime;
    
    
    public String getOrderNo() {
 		return orderNo;
 	}
 	public void setOrderNo(String orderNo) {
 		this.orderNo = orderNo;
 	}
 	public String getIccid() {
 		return iccid;
 	}
 	public void setIccid(String iccid) {
 		this.iccid = iccid;
 	}
 	public String getImsi() {
 		return imsi;
 	}
 	public void setImsi(String imsi) {
 		this.imsi = imsi;
 	}
 	public String getCardNo() {
 		return cardNo;
 	}
 	public void setCardNo(String cardNo) {
 		this.cardNo = cardNo;
 	}
 	public Integer getSource() {
 		return source;
 	}
 	public void setSource(Integer source) {
 		this.source = source;
 	}
 	public String getMerchantName() {
 		return merchantName;
 	}
 	public void setMerchantName(String merchantName) {
 		this.merchantName = merchantName;
 	}
 	public String getPackageName() {
 		return packageName;
 	}
 	public void setPackageName(String packageName) {
 		this.packageName = packageName;
 	}
 	public Float getOrderPrice() {
 		return orderPrice;
 	}
 	public void setOrderPrice(Float orderPrice) {
 		this.orderPrice = orderPrice;
 	}
 	public Integer getPayStatus() {
 		return payStatus;
 	}
 	public void setPayStatus(Integer payStatus) {
 		this.payStatus = payStatus;
 	}
 	public Integer getOpenStatus() {
 		return openStatus;
 	}
 	public void setOpenStatus(Integer openStatus) {
 		this.openStatus = openStatus;
 	}
 	public String getPayNo() {
 		return payNo;
 	}
 	public void setPayNo(String payNo) {
 		this.payNo = payNo;
 	}
 	public String getPayTime() {
 		return payTime;
 	}
 	public void setPayTime(String payTime) {
 		this.payTime = payTime;
 	}
	public Integer getCardStatus() {
		return cardStatus;
	}
	public void setCardStatus(Integer cardStatus) {
		this.cardStatus = cardStatus;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String toString(){
		return ToStringBuilder.reflectionToString(this); 		
 	}
}

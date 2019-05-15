package com.glsx.oms.fcadmin.biz.mobilecard.opencard.model;

import org.oreframework.web.model.BaseModel;

public class MobileOpenCard extends BaseModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3154939954123039733L;

	/**
	 * ICCID
	 */
	private String ICCID;
	/**
	 * IMSI
	 */
	private String IMSI;
	/**
	 * 网卡号
	 */
	private String cardNo;
	/**
	 * 卡类型 1:工业贴片卡/2:工业大卡/3:双切卡
	 */
	private Integer cardType;
	/**
	 * 卡状态 0=可测试/1=库存卡/3=可激活/4=已激活/5=已停卡/6=已销卡
	 */
	private Integer cardStatus;
	/**
	 * 商户号
	 */
	private Integer spCode;
	/**
	 * 商户名
	 */
	private String spName;
	/**
	 * 套餐号
	 */
	private Integer packageCode;
	/**
	 * 套餐名
	 */
	private String packageName;
	/**
	 * 套餐价格
	 */
	private Float packagePrice;
	/**
	 * 激活宽限天数
	 */
	private Integer autoactivePackageDays;
	/**
	 * 激活宽限剩余天数
	 */
	private Integer activePackageRestDays;

	//条件查询  激活宽限天数
	private Integer activeDaysSmall;
	private Integer activeDaysBig;
	private Integer activeDaysBetweenSmall;
	private Integer activeDaysBetweenBig;
	
	//条件查询  激活宽限剩余天数
	private Integer activeRestDaysSmall;
	private Integer activeRestDaysBig;
	private Integer activeRestDaysBetweenSmall;
	private Integer activeRestDaysBetweenBig;
	
	public String getICCID() {
		return ICCID;
	}
	public void setICCID(String iCCID) {
		ICCID = iCCID;
	}
	public String getIMSI() {
		return IMSI;
	}
	public void setIMSI(String iMSI) {
		IMSI = iMSI;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Integer getCardType() {
		return cardType;
	}
	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}
	public Integer getCardStatus() {
		return cardStatus;
	}
	public void setCardStatus(Integer cardStatus) {
		this.cardStatus = cardStatus;
	}
	public Integer getSpCode() {
		return spCode;
	}
	public void setSpCode(Integer spCode) {
		this.spCode = spCode;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public Integer getPackageCode() {
		return packageCode;
	}
	public void setPackageCode(Integer packageCode) {
		this.packageCode = packageCode;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public Float getPackagePrice() {
		return packagePrice;
	}
	public void setPackagePrice(Float packagePrice) {
		this.packagePrice = packagePrice;
	}
	public Integer getAutoactivePackageDays() {
		return autoactivePackageDays;
	}
	public void setAutoactivePackageDays(Integer autoactivePackageDays) {
		this.autoactivePackageDays = autoactivePackageDays;
	}
	public Integer getActivePackageRestDays() {
		return activePackageRestDays;
	}
	public void setActivePackageRestDays(Integer activePackageRestDays) {
		this.activePackageRestDays = activePackageRestDays;
	}
	public Integer getActiveDaysSmall() {
		return activeDaysSmall;
	}
	public void setActiveDaysSmall(Integer activeDaysSmall) {
		this.activeDaysSmall = activeDaysSmall;
	}
	public Integer getActiveDaysBig() {
		return activeDaysBig;
	}
	public void setActiveDaysBig(Integer activeDaysBig) {
		this.activeDaysBig = activeDaysBig;
	}
	public Integer getActiveRestDaysSmall() {
		return activeRestDaysSmall;
	}
	public void setActiveRestDaysSmall(Integer activeRestDaysSmall) {
		this.activeRestDaysSmall = activeRestDaysSmall;
	}
	public Integer getActiveRestDaysBig() {
		return activeRestDaysBig;
	}
	public void setActiveRestDaysBig(Integer activeRestDaysBig) {
		this.activeRestDaysBig = activeRestDaysBig;
	}
	public Integer getActiveDaysBetweenSmall() {
		return activeDaysBetweenSmall;
	}
	public void setActiveDaysBetweenSmall(Integer activeDaysBetweenSmall) {
		this.activeDaysBetweenSmall = activeDaysBetweenSmall;
	}
	public Integer getActiveDaysBetweenBig() {
		return activeDaysBetweenBig;
	}
	public void setActiveDaysBetweenBig(Integer activeDaysBetweenBig) {
		this.activeDaysBetweenBig = activeDaysBetweenBig;
	}
	public Integer getActiveRestDaysBetweenSmall() {
		return activeRestDaysBetweenSmall;
	}
	public void setActiveRestDaysBetweenSmall(Integer activeRestDaysBetweenSmall) {
		this.activeRestDaysBetweenSmall = activeRestDaysBetweenSmall;
	}
	public Integer getActiveRestDaysBetweenBig() {
		return activeRestDaysBetweenBig;
	}
	public void setActiveRestDaysBetweenBig(Integer activeRestDaysBetweenBig) {
		this.activeRestDaysBetweenBig = activeRestDaysBetweenBig;
	}
	
}

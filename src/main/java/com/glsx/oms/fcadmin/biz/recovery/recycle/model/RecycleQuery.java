package com.glsx.oms.fcadmin.biz.recovery.recycle.model;

/**
 * 回收的卡信息bean
 * @author Lenovo
 *
 */
public class RecycleQuery extends RecycleRecord{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2847797728047499465L;


	/**
	 * 卡状态
	 */
	private String cardStatus;
	/**
	 * 套餐状态
	 */
	private String packageStatus;
	/**
	 * 套餐开始时间
	 */
	private String packageBegintime;
	/**
	 * 套餐结束时间
	 */
	private String packageEndtime;
	/**
	 * 总流量
	 */
	private Float totalflow;
	/**
	 * 剩余流量
	 */
	private Float remainTotalflow;
	/**
	 * 是否无限流量（0：有限流量 1：无限流量）
	 * @return
	 */
	private Integer isUnlimitFlow;
	
	
	public String getCardStatus() {
		return cardStatus;
	}
	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}
	public String getPackageStatus() {
		return packageStatus;
	}
	public void setPackageStatus(String packageStatus) {
		this.packageStatus = packageStatus;
	}
	public String getPackageBegintime() {
		return packageBegintime;
	}
	public void setPackageBegintime(String packageBegintime) {
		this.packageBegintime = packageBegintime;
	}
	public String getPackageEndtime() {
		return packageEndtime;
	}
	public void setPackageEndtime(String packageEndtime) {
		this.packageEndtime = packageEndtime;
	}
	public Float getTotalflow() {
		return totalflow;
	}
	public void setTotalflow(Float totalflow) {
		this.totalflow = totalflow;
	}
	public Float getRemainTotalflow() {
		return remainTotalflow;
	}
	public void setRemainTotalflow(Float remainTotalflow) {
		this.remainTotalflow = remainTotalflow;
	}
	public Integer getIsUnlimitFlow() {
		return isUnlimitFlow;
	}
	public void setIsUnlimitFlow(Integer isUnlimitFlow) {
		this.isUnlimitFlow = isUnlimitFlow;
	}

	
}

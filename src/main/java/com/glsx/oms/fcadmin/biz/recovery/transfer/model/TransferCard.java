package com.glsx.oms.fcadmin.biz.recovery.transfer.model;

/**
 * 迁移卡信息bean
 * 新增页面的辅助bean
 * @author Lenovo
 *
 */
public class TransferCard {
   
	private String iccid;
	
	private String imsi;
	
	private String cardNo;
	
	private String opName;
	
	private String spName;
	
	private Integer cardStatus;
	
	private Integer packageStatus;
	
	
	
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

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}
	
	public Integer getCardStatus() {
		return cardStatus;
	}

	public void setCardStatus(Integer cardStatus) {
		this.cardStatus = cardStatus;
	}

	public Integer getPackageStatus() {
		return packageStatus;
	}

	public void setPackageStatus(Integer packageStatus) {
		this.packageStatus = packageStatus;
	}
}

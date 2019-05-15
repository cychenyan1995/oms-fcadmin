package com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model;

import javax.persistence.Table;

import org.oreframework.commons.office.poi.zslin.utils.ExcelResources;
import org.oreframework.web.model.BaseModel;


/**
 * 流量平台中心导出失败卡信息 实体
 */
@Table(name = "flowmgn_flowcard")
public class FlowCardExport extends BaseModel {
	
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 8131843162442325129L;

	/**
	 * ICCID 保存19位
	 */
	private String iccid;
	
	/**
	 * IMSI
	 */
	private String imsi;
	
	/**
	 * 卡号
	 */
	private String cardNo;

	/**
	 * 卡类型
	 */
	private String cardType;
	
	/**
	 * 运营商编号
	 */
	private String opId;
	
	/**
	 * 失败原因
	 */
	private String cause;

	@ExcelResources(title="网卡号",order=1)
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	@ExcelResources(title="IMSI",order=3)
	public String getImsi() {
		return imsi;
	}

	public void setImsi(String imsi) {
		this.imsi = imsi;
	}

	@ExcelResources(title="ICCID",order=2)
	public String getIccid() {
		return iccid;
	}

	public void setIccid(String iccid) {
		this.iccid = iccid;
	}

	@ExcelResources(title="卡类型",order=4)
	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	@ExcelResources(title="运营商编号",order=5)
	public String getOpId() {
		return opId;
	}

	public void setOpId(String opId) {
		this.opId = opId;
	}

	@ExcelResources(title="失败原因",order=6)
	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}
}

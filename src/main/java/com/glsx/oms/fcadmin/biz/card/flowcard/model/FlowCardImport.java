package com.glsx.oms.fcadmin.biz.card.flowcard.model;

import javax.persistence.Table;

import org.oreframework.commons.office.poi.zslin.utils.ExcelResources;
import org.oreframework.web.model.BaseModel;


/**
 * 流量平台中心导入卡信息 实体
 */
@Table(name = "flowmgn_flowcard")
public class FlowCardImport extends BaseModel {
	
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 706012422139887588L;

	/**
	 * ICCID 保存20位
	 */
	private String iccidn;
	
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
	
	private Integer type;
	
	/**
	 * 运营商编号
	 */
	private String opId;
	
	private String operId;
	
	/**
	 * 卡出库时间
	 */
	private String outStockTime;
	

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
	public String getIccidn() {
		return iccidn;
	}

	public void setIccidn(String iccidn) {
		this.iccidn = iccidn;
	}

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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@ExcelResources(title="运营商编号",order=5)
	public String getOpId() {
		return opId;
	}

	public void setOpId(String opId) {
		this.opId = opId;
	}

	public String getOperId() {
		return operId;
	}

	public void setOperId(String operId) {
		this.operId = operId;
	}

	public String getOutStockTime() {
		return outStockTime;
	}

	public void setOutStockTime(String outStockTime) {
		this.outStockTime = outStockTime;
	}
	
}

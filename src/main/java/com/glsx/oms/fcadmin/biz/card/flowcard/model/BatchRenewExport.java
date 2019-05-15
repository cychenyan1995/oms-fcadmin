package com.glsx.oms.fcadmin.biz.card.flowcard.model;

import javax.persistence.Table;

import org.oreframework.commons.office.poi.zslin.utils.ExcelResources;
import org.oreframework.web.model.BaseModel;


/**
 * 流量平台中心导出失败卡信息 实体
 */
@Table(name = "flowmgn_flowcard")
public class BatchRenewExport extends BaseModel {
	
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 8131843162442325129L;

	/**
	 * ICCID 
	 */
	private String iccid;
	
	/**
	 * 失败原因
	 */
	private String cause;

	@ExcelResources(title="ICCID",order=1)
	public String getIccid() {
		return iccid;
	}

	public void setIccid(String iccid) {
		this.iccid = iccid;
	}
	
	@ExcelResources(title="失败原因",order=2)
	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}
}

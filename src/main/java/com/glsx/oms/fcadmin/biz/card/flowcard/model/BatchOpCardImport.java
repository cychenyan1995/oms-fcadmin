package com.glsx.oms.fcadmin.biz.card.flowcard.model;

import javax.persistence.Table;

import org.oreframework.commons.office.poi.zslin.utils.ExcelResources;
import org.oreframework.web.model.BaseModel;

/**
 * 流量平台中心导入卡信息 实体
 */
@Table(name = "flowmgn_flowcard")
public class BatchOpCardImport extends BaseModel {

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = -5820367317045437844L;

	/**
	 * ICCID
	 */
	private String iccid;

	/**
	 * 卡状态
	 */
	private String status;

	@ExcelResources(title = "ICCID", order = 1)
	public String getIccid() {
		return iccid;
	}

	public void setIccid(String iccid) {
		this.iccid = iccid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}

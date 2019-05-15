
package com.glsx.oms.fcadmin.biz.card.lifecycle.model;

import org.oreframework.commons.office.poi.zslin.utils.ExcelResources;
import org.oreframework.web.model.BaseModel;

/**
 *  实体
 */
public class StockCardExport extends BaseModel{
	
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = -5864195901652049191L;
	
	/**
	 * ICCID
	 */
    private String iccid;
	/**
	 * 商户编号
	 */
    private String spCode;
    /**
	 * 开卡套餐编号
	 */
    private String packageCode;
    /**
     * 白卡套餐编号
     */
    private String whitePkCode;
    /**
	 * 订单编号
	 */
	private String orderNo;
	/**
	 * 失败原因
	 */
	private String cause;
	
	@ExcelResources(title = "ICCID", order = 1)
	public String getIccid() {
		return iccid;
	}
	public void setIccid(String iccid) {
		this.iccid = iccid;
	}
	@ExcelResources(title = "商户编号", order = 2)
	public String getSpCode() {
		return spCode;
	}
	public void setSpCode(String spCode) {
		this.spCode = spCode;
	}
	@ExcelResources(title = "开卡套餐编号", order = 3)
	public String getPackageCode() {
		return packageCode;
	}
	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}
	@ExcelResources(title = "白卡套餐编号", order = 4)
	public String getWhitePkCode() {
		return whitePkCode;
	}
	public void setWhitePkCode(String whitePkCode) {
		this.whitePkCode = whitePkCode;
	}
	@ExcelResources(title = "订单编号", order = 5)
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	@ExcelResources(title="失败原因",order=5)
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	
}


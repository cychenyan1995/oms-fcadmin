
package com.glsx.oms.fcadmin.biz.card.lifecycle.model;

import org.oreframework.commons.office.poi.zslin.utils.ExcelResources;
import org.oreframework.web.model.BaseModel;

/**
 *  实体
 */
public class StockCardImport extends BaseModel{
	
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
    private Integer spId;
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
	 * 出库临时表查询key
	 */
	private String opKey;
	
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
	public Integer getSpId() {
		return spId;
	}
	public void setSpId(Integer spId) {
		this.spId = spId;
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
	public String getOpKey() {
		return opKey;
	}
	public void setOpKey(String opKey) {
		this.opKey = opKey;
	}
}



package com.glsx.oms.fcadmin.biz.card.lifecycle.model;

import org.oreframework.web.model.BaseModel;

/**
 *  实体
 */
public class LifeCycle extends BaseModel{
	
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = -2967333380364108851L;
	/**
	 * 流量卡序列ID
	 */
	private Integer cardId;
	/**
     * 卡号
     */
    private String cardNo;
	/**
	 * ICCID
	 */
    private String iccid;
	/**
	 * IMSI
	 */
    private String imsi;
    /**
	 * 卡状态
	 */
    private Integer status;
    /**
	 * 卡类型：(1:工业贴片卡/2:工业大卡/3:双切卡)
	 */
	private Integer cardType;
	/**
	 * 卡所属运营商ID
	 */
	private Integer opId;
	/**
	 * 卡所属运营商名称
	 */
	private String opName;
	/**
	 * 运营商发货日期
	 */
	private String deliveryTime;
	/**
	 * 运营商发货开始时间
	 */
	private String deliveryStarttime;
	/**
	 * 运营商发货结束时间
	 */
	private String deliveryEndtime;
	/**
	 * 查询条件
	 */
	private String queryText;
	
	public Integer getCardId() {
		return cardId;
	}
	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getCardType() {
		return cardType;
	}
	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}
	public Integer getOpId() {
		return opId;
	}
	public void setOpId(Integer opId) {
		this.opId = opId;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getDeliveryStarttime() {
		return deliveryStarttime;
	}
	public void setDeliveryStarttime(String deliveryStarttime) {
		this.deliveryStarttime = deliveryStarttime;
	}
	public String getDeliveryEndtime() {
		return deliveryEndtime;
	}
	public void setDeliveryEndtime(String deliveryEndtime) {
		this.deliveryEndtime = deliveryEndtime;
	}
	public String getQueryText() {
		return queryText;
	}
	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}
}


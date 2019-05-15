
package com.glsx.oms.fcadmin.biz.order.outorder.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡出库订单管理 实体
 */
@Table(name = "flowmgn_out_stock_order")
public class OutOrder extends BaseModel{
	
	
	/**
	 * 订单序号
	 */
	@Id
	private Integer outOrderId;
	
	/**
	 * 订单号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String outOrderNo;
	
	/**
	 * 订单名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String outOrderName;
	
	/**
	 * 订单描述
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String outOrderDesc;
	
	/**
	 * 服务商ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer spId;
	
	/**
	 * 总计多少张卡
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer totalCard;
	
	/**
	 * 卡类型：(0:通用/1:工业贴片卡/2:工业大卡/3:双切卡)
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer cardType;
	
	/**
	 * 总价
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float totalPrice;
	
	/**
	 * 套餐ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer packageId;
	
	/**
	 * 订单状态（1:待发货 2:已取消 3:已发货 4:发货失败）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;
	
	/**
	 * 发货时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private String postTime;
	
	/**
	 * 收件人姓名
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String recipients;
	
	/**
	 * 收件人手机号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String recipientsMobileno;
	
	/**
	 * 收件人地址
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String recipientsAddr;
	
	/**
	 * 收件人邮政编码
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String recipientsPostcode;
	
	/**
	 * 快递单号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String expressNo;
	
	private String packageName;
	
	private String spCode;
	
	private String spName;
	
	private String orderTime;
	
	private Integer failReason;
	
	private String failReasonDesc;
	
	private String expressPic;
	
	/**
	 * 激活开始时间
	 */
	private String orderBegintime;

	/**
	 * 激活结束时间
	 */
	private String orderEndtime;

	public OutOrder(){
	}

	public OutOrder(
		java.lang.Integer outOrderId
	){
		this.outOrderId = outOrderId;
	}

		
	public void setOutOrderId(Integer value) {
		this.outOrderId = value;
	}
		
	public Integer getOutOrderId() {
		return this.outOrderId;
	}
		
	
		
	public void setOutOrderNo(String value) {
		this.outOrderNo = value;
	}
		
	public String getOutOrderNo() {
		return this.outOrderNo;
	}
		
	
		
	public void setOutOrderName(String value) {
		this.outOrderName = value;
	}
		
	public String getOutOrderName() {
		return this.outOrderName;
	}
		
	
		
	public void setOutOrderDesc(String value) {
		this.outOrderDesc = value;
	}
		
	public String getOutOrderDesc() {
		return this.outOrderDesc;
	}
		
	
		
	public void setSpId(Integer value) {
		this.spId = value;
	}
		
	public Integer getSpId() {
		return this.spId;
	}
		
	
		
	public void setTotalCard(Integer value) {
		this.totalCard = value;
	}
		
	public Integer getTotalCard() {
		return this.totalCard;
	}
		
	
		
	public void setCardType(Integer value) {
		this.cardType = value;
	}
		
	public Integer getCardType() {
		return this.cardType;
	}
		
	
		
	public void setTotalPrice(Float value) {
		this.totalPrice = value;
	}
		
	public Float getTotalPrice() {
		return this.totalPrice;
	}
		
	
		
	public void setPackageId(Integer value) {
		this.packageId = value;
	}
		
	public Integer getPackageId() {
		return this.packageId;
	}
		
	
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	
	
		
	public void setPostTime(String value) {
		this.postTime = value;
	}
		
	public String getPostTime() {
		return this.postTime;
	}
		
	
		
	public void setRecipients(String value) {
		this.recipients = value;
	}
		
	public String getRecipients() {
		return this.recipients;
	}
		
	
		
	public void setRecipientsMobileno(String value) {
		this.recipientsMobileno = value;
	}
		
	public String getRecipientsMobileno() {
		return this.recipientsMobileno;
	}
		
	
		
	public void setRecipientsAddr(String value) {
		this.recipientsAddr = value;
	}
		
	public String getRecipientsAddr() {
		return this.recipientsAddr;
	}
		
	
		
	public void setRecipientsPostcode(String value) {
		this.recipientsPostcode = value;
	}
		
	public String getRecipientsPostcode() {
		return this.recipientsPostcode;
	}
		
	
		
	public void setExpressNo(String value) {
		this.expressNo = value;
	}
		
	public String getExpressNo() {
		return this.expressNo;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getSpCode() {
		return spCode;
	}

	public void setSpCode(String spCode) {
		this.spCode = spCode;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getFailReason() {
		return failReason;
	}

	public void setFailReason(Integer failReason) {
		this.failReason = failReason;
	}

	public String getFailReasonDesc() {
		return failReasonDesc;
	}

	public void setFailReasonDesc(String failReasonDesc) {
		this.failReasonDesc = failReasonDesc;
	}

	public String getExpressPic() {
		return expressPic;
	}

	public void setExpressPic(String expressPic) {
		this.expressPic = expressPic;
	}

	public String getOrderBegintime() {
		return orderBegintime;
	}

	public void setOrderBegintime(String orderBegintime) {
		this.orderBegintime = orderBegintime;
	}

	public String getOrderEndtime() {
		return orderEndtime;
	}

	public void setOrderEndtime(String orderEndtime) {
		this.orderEndtime = orderEndtime;
	}

}


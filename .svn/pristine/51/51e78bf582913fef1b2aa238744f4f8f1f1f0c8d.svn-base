
package com.glsx.oms.fcadmin.biz.recharge.rechargeorder.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 充值订单表 实体
 */
@Table(name = "flowmgn_recharge_order")
public class RechargeOrder extends BaseModel{
	
	
	/**
	 * id
	 */
	@Id
	private Integer orderId;
	
	/**
	 * 订单号（格式：）
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String orderNo;
	
	/**
	 * 套餐ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer packageId;
	
	/**
	 * 订单总价
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float orderPrice;
	
	/**
	 * 订单支付时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date orderPaytime;
	
	/**
	 * 订单所属商户
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer orderSpId;
	
	/**
	 * 订单状态（0：未支付 1：已支付 2：已完成 3：已取消）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;
	
	/**
	 * 来源：（0=微信商城/1=流量管理平台/2=开放平台）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer source;
	
	/**
	 * 第三方订单编号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String thirdOrderNo;

	public RechargeOrder(){
	}

	public RechargeOrder(
		java.lang.Integer orderId
	){
		this.orderId = orderId;
	}

		
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
		
	public Integer getOrderId() {
		return this.orderId;
	}
		
	
		
	public void setOrderNo(String value) {
		this.orderNo = value;
	}
		
	public String getOrderNo() {
		return this.orderNo;
	}
		
	
		
	public void setPackageId(Integer value) {
		this.packageId = value;
	}
		
	public Integer getPackageId() {
		return this.packageId;
	}
		
	
		
	public void setOrderPrice(Float value) {
		this.orderPrice = value;
	}
		
	public Float getOrderPrice() {
		return this.orderPrice;
	}
		
	
	
		
	public void setOrderPaytime(Date value) {
		this.orderPaytime = value;
	}
		
	public Date getOrderPaytime() {
		return this.orderPaytime;
	}
		
	
		
	public void setOrderSpId(Integer value) {
		this.orderSpId = value;
	}
		
	public Integer getOrderSpId() {
		return this.orderSpId;
	}
		
	
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	
		
	public void setSource(Integer value) {
		this.source = value;
	}
		
	public Integer getSource() {
		return this.source;
	}
		
	
		
	public void setThirdOrderNo(String value) {
		this.thirdOrderNo = value;
	}
		
	public String getThirdOrderNo() {
		return this.thirdOrderNo;
	}
		
	
	
		
	
	
		
	
		
	

}


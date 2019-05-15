
package com.glsx.oms.fcadmin.biz.card.orderinfo.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡入库订单管理 实体
 */
@Table(name = "flowmgn_in_stock_order")
public class OrderInfo extends BaseModel{
	
	
	/**
	 * 订单序号
	 */
	@Id
	private Integer inStkOrderId;
	
	/**
	 * 订单描述
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String inStkOrderDesc;
	
	/**
	 * 运营商ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer opId;
	
	/**
	 * 总计多少张卡
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer totalCard;
	
	/**
	 * 卡类型：(1:工业贴片卡/2:工业大卡/3:双切卡)
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer cardType;

	public OrderInfo(){
	}

	public OrderInfo(
		java.lang.Integer inStkOrderId
	){
		this.inStkOrderId = inStkOrderId;
	}

		
	public void setInStkOrderId(Integer value) {
		this.inStkOrderId = value;
	}
		
	public Integer getInStkOrderId() {
		return this.inStkOrderId;
	}
		
	
		
	public void setInStkOrderDesc(String value) {
		this.inStkOrderDesc = value;
	}
		
	public String getInStkOrderDesc() {
		return this.inStkOrderDesc;
	}
		
	
		
	public void setOpId(Integer value) {
		this.opId = value;
	}
		
	public Integer getOpId() {
		return this.opId;
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
		
	
	
		
	
	
		
	
		
	
		
	

}


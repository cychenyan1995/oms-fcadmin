
package com.glsx.oms.fcadmin.biz.card.flowpool.model;

import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.ibatis.type.JdbcType;
import org.oreframework.web.model.BaseModel;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量池每月明细定义 实体
 */
@Table(name = "flowmgn_flowpool_sp_monthflow")
public class FlowPoolMonthDetail extends BaseModel {

	/**
	 * 流量池ID
	 */
	@Id
	private Integer flowpoolId;

	/**
	 * 流量池名称
	 */
	@ColumnType(jdbcType = JdbcType.VARCHAR)
	private String flowpoolName;

	/**
	 * 流量池所属运营商
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer spId;

	// 运营商名称
	private String spName;

	// 本月流量池（MB）
	private float currmonthTotalflow;

	// 本月累计消耗（MB）
	private float currmonthUsedflow;

	// 本月剩余流量（MB）
	private float currmonthRemainflow;

	// 卡总数
	private Integer cardTotal;

	private Integer addCard;
	
	private Integer stockCard;

	// 开卡总数
	private Integer openCard;

	// 销卡总数
	private Integer cancelCard;
	
	private String consumeMonth;

	public FlowPoolMonthDetail() {
	}

	public FlowPoolMonthDetail(java.lang.Integer flowpoolId) {
		this.flowpoolId = flowpoolId;
	}

	public Integer getFlowpoolId() {
		return flowpoolId;
	}

	public void setFlowpoolId(Integer flowpoolId) {
		this.flowpoolId = flowpoolId;
	}

	public String getFlowpoolName() {
		return flowpoolName;
	}

	public void setFlowpoolName(String flowpoolName) {
		this.flowpoolName = flowpoolName;
	}

	public Integer getSpId() {
		return spId;
	}

	public void setSpId(Integer spId) {
		this.spId = spId;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public float getCurrmonthTotalflow() {
		return currmonthTotalflow;
	}

	public void setCurrmonthTotalflow(float currmonthTotalflow) {
		this.currmonthTotalflow = currmonthTotalflow;
	}

	public float getCurrmonthUsedflow() {
		return currmonthUsedflow;
	}

	public void setCurrmonthUsedflow(float currmonthUsedflow) {
		this.currmonthUsedflow = currmonthUsedflow;
	}

	public float getCurrmonthRemainflow() {
		return currmonthRemainflow;
	}

	public void setCurrmonthRemainflow(float currmonthRemainflow) {
		this.currmonthRemainflow = currmonthRemainflow;
	}

	public Integer getCardTotal() {
		return cardTotal;
	}

	public void setCardTotal(Integer cardTotal) {
		this.cardTotal = cardTotal;
	}

	public Integer getAddCard() {
		return addCard;
	}

	public void setAddCard(Integer addCard) {
		this.addCard = addCard;
	}

	public Integer getStockCard() {
		return stockCard;
	}

	public void setStockCard(Integer stockCard) {
		this.stockCard = stockCard;
	}

	public Integer getOpenCard() {
		return openCard;
	}

	public void setOpenCard(Integer openCard) {
		this.openCard = openCard;
	}

	public Integer getCancelCard() {
		return cancelCard;
	}

	public void setCancelCard(Integer cancelCard) {
		this.cancelCard = cancelCard;
	}

	public String getConsumeMonth() {
		return consumeMonth;
	}

	public void setConsumeMonth(String consumeMonth) {
		this.consumeMonth = consumeMonth;
	}


}

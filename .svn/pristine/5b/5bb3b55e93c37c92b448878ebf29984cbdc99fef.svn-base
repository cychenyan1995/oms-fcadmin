
package com.glsx.oms.fcadmin.biz.card.flowpool.model;

import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.ibatis.type.JdbcType;
import org.oreframework.web.model.BaseModel;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量池定义 实体
 */
@Table(name = "flowmgn_flowpool")
public class FlowPool extends BaseModel {

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
	private Integer opId;

	// 运营商名称
	private String opName;
	
	private String postageId;

	// 资费计划名称
	private String postageName;

	// 本月流量池（MB）
	private float currmonthTotalflow;

	// 本月累计消耗（MB）
	private float currmonthUsedflow;

	// 本月剩余流量（MB）
	private float currmonthRemainflow;

	// 卡总数
	private Integer cardTotal;

	// 未开卡总数
	private Integer notopenCard;

	// 开卡总数
	private Integer openCard;

	// 销卡总数
	private Integer cancelCard;

	private String remark;
	
	public FlowPool() {
	}

	public FlowPool(java.lang.Integer flowpoolId) {
		this.flowpoolId = flowpoolId;
	}

	public void setFlowpoolId(Integer value) {
		this.flowpoolId = value;
	}

	public Integer getFlowpoolId() {
		return this.flowpoolId;
	}

	public void setFlowpoolName(String value) {
		this.flowpoolName = value;
	}

	public String getFlowpoolName() {
		return this.flowpoolName;
	}

	public void setOpId(Integer value) {
		this.opId = value;
	}

	public Integer getOpId() {
		return this.opId;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getPostageName() {
		return postageName;
	}

	public void setPostageName(String postageName) {
		this.postageName = postageName;
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

	public Integer getNotopenCard() {
		return notopenCard;
	}

	public void setNotopenCard(Integer notopenCard) {
		this.notopenCard = notopenCard;
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

	public String getPostageId() {
		return postageId;
	}

	public void setPostageId(String postageId) {
		this.postageId = postageId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}


package com.glsx.oms.fcadmin.biz.card.flowpool.model;

import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.ibatis.type.JdbcType;
import org.oreframework.web.model.BaseModel;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量池与资费计划关联表
 */
@Table(name = "flowmgn_flowpool_postage")
public class FlowpoolPostage extends BaseModel {

	/**
	 * 记录序列号
	 */
	@Id
	private Integer poolPostagelId;

	/**
	 * 流量池ID
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer flowpoolId;

	private Integer postageId;

	public FlowpoolPostage() {
	}

	public Integer getPoolPostagelId() {
		return poolPostagelId;
	}

	public void setPoolPostagelId(Integer poolPostagelId) {
		this.poolPostagelId = poolPostagelId;
	}

	public Integer getFlowpoolId() {
		return flowpoolId;
	}

	public void setFlowpoolId(Integer flowpoolId) {
		this.flowpoolId = flowpoolId;
	}

	public Integer getPostageId() {
		return postageId;
	}

	public void setPostageId(Integer postageId) {
		this.postageId = postageId;
	}

	
}

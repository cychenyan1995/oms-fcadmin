
package com.glsx.oms.fcadmin.biz.card.optlog.model;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量平台中心批量操作记录  实体
 */
@Table(name = "flowmgn_api_optlog")
public class Optlog extends BaseModel{
	
	/**
	 * 序列化
	 */

	private static final long serialVersionUID = -898230575825883187L;

	/**
	 * 记录ID
	 */
	@Id
	private Integer optId;
	
	/**
	 * 操作类型
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String optType;
	
	/**
	 * 操作原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String optReason;
	
	/**
	 * 操作返回结果
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String optDesc;
	
	/**
	 * 卡所属运营商
	 */
	private int optOp;

	public Integer getOptId() {
		return optId;
	}

	public void setOptId(Integer optId) {
		this.optId = optId;
	}

	public String getOptType() {
		return optType;
	}

	public void setOptType(String optType) {
		this.optType = optType;
	}

	public String getOptReason() {
		return optReason;
	}

	public void setOptReason(String optReason) {
		this.optReason = optReason;
	}

	public String getOptDesc() {
		return optDesc;
	}

	public void setOptDesc(String optDesc) {
		this.optDesc = optDesc;
	}

	public int getOptOp() {
		return optOp;
	}

	public void setOptOp(int optOp) {
		this.optOp = optOp;
	}
}



package com.glsx.oms.fcadmin.biz.recovery.recycle.model;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;
import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡回收处理 实体
 */
@Table(name = "flowmgn_card_recycle")
public class Recycle extends BaseModel{
	
	
	/**
	 * 序列ID
	 */
	@Id
	private Integer recycleId;
	
	/**
	 * 回收卡ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer cardId;
	
	/**
	 * 回收原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String reason;
	
	/**
	 * 回收状态（1：确认回收 2：取消回收）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean status;

	public Recycle(){
	}

	public Recycle(
		java.lang.Integer recycleId
	){
		this.recycleId = recycleId;
	}

		
	public void setRecycleId(Integer value) {
		this.recycleId = value;
	}
		
	public Integer getRecycleId() {
		return this.recycleId;
	}
		
	
		
	public void setCardId(Integer value) {
		this.cardId = value;
	}
		
	public Integer getCardId() {
		return this.cardId;
	}
		
	
		
	public void setReason(String value) {
		this.reason = value;
	}
		
	public String getReason() {
		return this.reason;
	}
		
	
		
	public void setStatus(Boolean value) {
		this.status = value;
	}
		
	public Boolean getStatus() {
		return this.status;
	}

}


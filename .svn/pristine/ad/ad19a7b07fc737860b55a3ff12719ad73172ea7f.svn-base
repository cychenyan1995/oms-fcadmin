
package com.glsx.oms.fcadmin.biz.card.changelog.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡变更日志 实体
 */
@Table(name = "flowmgn_cardinfo_change_log")
public class ChangeLog extends BaseModel{
	
	
	/**
	 * 序列ID
	 */
	@Id
	private Integer id;
	
	/**
	 * 流量卡ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer cardId;
	
	/**
	 * ICCID
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String iccid;
	
	/**
	 * 变更类型:库存状态XXX;业务状态XXX;是否实名认证XX;业务状态XXX;有效期续费;流量续费;
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String changeType;
	
	/**
	 * 变更前状态，状态的文字描述:已出库/已入库/运营开卡/已激活/是/已停机/已销卡/续费期数3个月/续费50M
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String changeBefore;
	
	/**
	 * 变更后状态，状态的文字描述;状态的文字描述:已出库/已入库/运营开卡/已激活/是/已停机/已销卡/续费期数3个月/续费50M
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String changeAfter;
	
	/**
	 * 变更时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date changeTime;

	public ChangeLog(){
	}

	public ChangeLog(
		java.lang.Integer id
	){
		this.id = id;
	}

		
	public void setId(Integer value) {
		this.id = value;
	}
		
	public Integer getId() {
		return this.id;
	}
		
	
		
	public void setCardId(Integer value) {
		this.cardId = value;
	}
		
	public Integer getCardId() {
		return this.cardId;
	}
		
	
		
	public void setIccid(String value) {
		this.iccid = value;
	}
		
	public String getIccid() {
		return this.iccid;
	}
		
	
		
	public void setChangeType(String value) {
		this.changeType = value;
	}
		
	public String getChangeType() {
		return this.changeType;
	}
		
	
		
	public void setChangeBefore(String value) {
		this.changeBefore = value;
	}
		
	public String getChangeBefore() {
		return this.changeBefore;
	}
		
	
		
	public void setChangeAfter(String value) {
		this.changeAfter = value;
	}
		
	public String getChangeAfter() {
		return this.changeAfter;
	}
		
	
	
		
	public void setChangeTime(Date value) {
		this.changeTime = value;
	}
		
	public Date getChangeTime() {
		return this.changeTime;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


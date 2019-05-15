
package com.glsx.oms.fcadmin.biz.recovery.recycle.model;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡回收记录 实体
 */
@Table(name = "flowmgn_card_recycle_record")
public class RecycleRecord extends BaseModel{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3993627813444191642L;

	/**
	 * 序列ID
	 */
	@Id
	private Integer recycleRecordId;
	
	/**
	 * iccid
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String iccid;
	
	/**
	 * imsi
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String imsi;
	
	/**
	 * 卡号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String cardNo;
	
	/**
	 * 运营商类型
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String opName;
	
	/**
	 * 来源
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String source;
		
	/**
	 * 服务商名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String spName;
	
	/**
	 * 回收原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String recycleReason;
	
	/**
	 * 请求时间
	 */
	@ColumnType(jdbcType=JdbcType.DATE)
	private String requestTime;
	
	/**
	 * 回收状态
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String recycleStatus;

	/**
	 * 失败原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String failReason;
	
	/**
	 * 回收时间
	 */
	@ColumnType(jdbcType=JdbcType.DATE)
	private String recycleTime;
	
	/**
	 * 联系人
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String contactorName;
	
	/**
	 * 联系人电话
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String contactorTel;


	public Integer getRecycleRecordId() {
		return recycleRecordId;
	}

	public void setRecycleRecordId(Integer recycleRecordId) {
		this.recycleRecordId = recycleRecordId;
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

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getRecycleReason() {
		return recycleReason;
	}

	public void setRecycleReason(String recycleReason) {
		this.recycleReason = recycleReason;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public String getRecycleStatus() {
		return recycleStatus;
	}

	public void setRecycleStatus(String recycleStatus) {
		this.recycleStatus = recycleStatus;
	}

	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}

	public String getRecycleTime() {
		return recycleTime;
	}

	public void setRecycleTime(String recycleTime) {
		this.recycleTime = recycleTime;
	}

	public String getContactorName() {
		return contactorName;
	}

	public void setContactorName(String contactorName) {
		this.contactorName = contactorName;
	}

	public String getContactorTel() {
		return contactorTel;
	}

	public void setContactorTel(String contactorTel) {
		this.contactorTel = contactorTel;
	}
    	
    public String toString(){
    	return ToStringBuilder.reflectionToString(this);
    }
}


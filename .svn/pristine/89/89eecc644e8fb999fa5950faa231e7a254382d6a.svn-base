package com.glsx.oms.fcadmin.biz.recovery.transfer.model;

import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.ibatis.type.JdbcType;
import org.oreframework.web.model.BaseModel;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡迁移记录
 * @author Lenovo
 *
 */
@Table(name = "flowmgn_card_transfer_record")
public class TransferRecord extends BaseModel {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7927156898237012673L;
	
	@Id
	private Integer transRecordId;
	
	/**
	 * 旧卡iccid
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String srcIccid;
	
	/**
	 * 新卡iccid
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String dstIccid;
	
	/**
	 * 旧卡imsi
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String srcImsi;
	
	/**
	 * 新卡imsi
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String dstImsi;
	
	/**
	 * 新卡卡号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String srcCardNo;
    
	/**
	 * 旧卡卡号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String dstCardNo;
	
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
	 * 迁移原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String transReason;
	
	/**
	 * 请求时间
	 */
	@ColumnType(jdbcType=JdbcType.DATE)
	private String requestTime; 

	/**
	 * 迁移状态
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String transStatus;
	
	/**
	 * 失败原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String failReason;
	
	/**
	 * 迁移时间
	 */
	@ColumnType(jdbcType=JdbcType.DATE)
	private String transTime;
	
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
	
	public Integer getTransRecordId() {
		return transRecordId;
	}

	public void setTransRecordId(Integer transRecordId) {
		this.transRecordId = transRecordId;
	}

	public String getSrcIccid() {
		return srcIccid;
	}

	public void setSrcIccid(String srcIccid) {
		this.srcIccid = srcIccid;
	}

	public String getDstIccid() {
		return dstIccid;
	}

	public void setDstIccid(String dstIccid) {
		this.dstIccid = dstIccid;
	}

	public String getSrcImsi() {
		return srcImsi;
	}

	public void setSrcImsi(String srcImsi) {
		this.srcImsi = srcImsi;
	}

	public String getDstImsi() {
		return dstImsi;
	}

	public void setDstImsi(String dstImsi) {
		this.dstImsi = dstImsi;
	}

	public String getSrcCardNo() {
		return srcCardNo;
	}

	public void setSrcCardNo(String srcCardNo) {
		this.srcCardNo = srcCardNo;
	}

	public String getDstCardNo() {
		return dstCardNo;
	}

	public void setDstCardNo(String dstCardNo) {
		this.dstCardNo = dstCardNo;
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

	public String getTransReason() {
		return transReason;
	}

	public void setTransReason(String transReason) {
		this.transReason = transReason;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public String getTransStatus() {
		return transStatus;
	}

	public void setTransStatus(String transStatus) {
		this.transStatus = transStatus;
	}

	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}

	public String getTransTime() {
		return transTime;
	}

	public void setTransTime(String transTime) {
		this.transTime = transTime;
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

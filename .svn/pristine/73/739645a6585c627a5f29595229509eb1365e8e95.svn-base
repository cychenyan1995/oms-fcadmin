
package com.glsx.oms.fcadmin.biz.op.networkaccess.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量平台电信运营商通讯计划定义 实体
 */
@Table(name = "flowmgn_op_networkaccess")
public class NetworkAccess extends BaseModel{
	
	
	/**
	 * 通讯计划ID
	 */
	@Id
	private Integer accessId;
	
	/**
	 * 通讯计划执行码（与运营商对接）
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer accessCode;
	
	/**
	 * 运营商ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer opId;
	
	/**
	 * 通讯计划英文名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String enName;
	
	/**
	 * 通讯计划中文名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String cnName;
	
	/**
	 * 通讯计划描述
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String accessDesc;
	
	/**
	 * 通讯计划状态 （1：启用 2：停用） 
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;
	
	/**
	 * 设置项-数据功能（0:无 1：开启 2：关闭）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean itemData;
	
	/**
	 * 设置项-被叫功能（0:无 1：开启 2：关闭）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean itemVoiceCalled;
	
	/**
	 * 设置项-短信功能（0:无 1：开启 2：关闭）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean itemMsg;
	
	/**
	 * 设置项-开通4G功能（0:无 1：开启 2：关闭）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean itemFourG;
	
	/**
	 * 设置项-白名单功能（0:无 1：开启 2：关闭）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean itemWhite;
	
	/**
	 * 设置项-黑名单功能（0:无 1：开启 2：关闭）
	 */
	@ColumnType(jdbcType=JdbcType.BIT)
	private Boolean itemBlack;
	
	/**
	 * 设置项-APN节点名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String itemApn;

	public NetworkAccess(){
	}

	public NetworkAccess(
		java.lang.Integer accessId
	){
		this.accessId = accessId;
	}

		
	public void setAccessId(Integer value) {
		this.accessId = value;
	}
		
	public Integer getAccessId() {
		return this.accessId;
	}
		
	
		
	public void setAccessCode(Integer value) {
		this.accessCode = value;
	}
		
	public Integer getAccessCode() {
		return this.accessCode;
	}
		
	
		
	public void setOpId(Integer value) {
		this.opId = value;
	}
		
	public Integer getOpId() {
		return this.opId;
	}
		
	
		
	public void setEnName(String value) {
		this.enName = value;
	}
		
	public String getEnName() {
		return this.enName;
	}
		
	
		
	public void setCnName(String value) {
		this.cnName = value;
	}
		
	public String getCnName() {
		return this.cnName;
	}
		
	
		
	public void setAccessDesc(String value) {
		this.accessDesc = value;
	}
		
	public String getAccessDesc() {
		return this.accessDesc;
	}
		
	
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	
		
	public void setItemData(Boolean value) {
		this.itemData = value;
	}
		
	public Boolean getItemData() {
		return this.itemData;
	}
		
	
		
	public void setItemVoiceCalled(Boolean value) {
		this.itemVoiceCalled = value;
	}
		
	public Boolean getItemVoiceCalled() {
		return this.itemVoiceCalled;
	}
		
	
		
	public void setItemMsg(Boolean value) {
		this.itemMsg = value;
	}
		
	public Boolean getItemMsg() {
		return this.itemMsg;
	}
		
	public Boolean getItemFourG() {
		return itemFourG;
	}

	public void setItemFourG(Boolean itemFourG) {
		this.itemFourG = itemFourG;
	}

	public void setItemWhite(Boolean value) {
		this.itemWhite = value;
	}
		
	public Boolean getItemWhite() {
		return this.itemWhite;
	}
		
	
		
	public void setItemBlack(Boolean value) {
		this.itemBlack = value;
	}
		
	public Boolean getItemBlack() {
		return this.itemBlack;
	}
		
	
		
	public void setItemApn(String value) {
		this.itemApn = value;
	}
		
	public String getItemApn() {
		return this.itemApn;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


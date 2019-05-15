
package com.glsx.oms.fcadmin.biz.sp.sp.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量平台商户信息 实体
 */
@Table(name = "flowmgn_sp")
public class Sp extends BaseModel{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8458769925844035030L;

	/**
	 * 服务商户ID
	 */
	@Id
	private Integer spId;
	
	/**
	 * 服务商（6位编码，广联8位）',
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer spCode;
	
	/**
	 * 服务商名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String spName;
	
	/**
	 * 服务商描述
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String spDesc;
	
	/**
	 * 联系人
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String contactperson;
	
	/**
	 * 联系电话
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String contactphone;
	
	/**
	 * 通讯地址
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String commAddr;
	
	private String province; //省
	private String city; //市
	private String otherAddr;//详细地址
	
	/**
	 * 访问KEY
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String accesskey;
	
	/**
	 * 最多用户数
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer maxUsers;
	
	/**
	 * 商户状态 （0：无效 1：有效）
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer status;
	
	/**
	 * 父系服务商ID
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer parentId;
	
	/**
	 * 层级
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer level;
	
	/**
	 * 注册日期
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date registryDate;
	
	
	/**
	 * 隶属商户号
	 */
	private Integer parentSpCode;
	
	/**
	 * 隶属商户名称
	 */
	private String parentSpName;

	public Sp(){
	}

	public Sp(
		java.lang.Integer spId
	){
		this.spId = spId;
	}

		
	public void setSpId(Integer value) {
		this.spId = value;
	}
		
	public Integer getSpId() {
		return this.spId;
	}
		
	
		
	public void setSpCode(Integer value) {
		this.spCode = value;
	}
		
	public Integer getSpCode() {
		return this.spCode;
	}
		
	
		
	public void setSpName(String value) {
		this.spName = value;
	}
		
	public String getSpName() {
		return this.spName;
	}
		
	
		
	public void setSpDesc(String value) {
		this.spDesc = value;
	}
		
	public String getSpDesc() {
		return this.spDesc;
	}
		
	
		
	public void setContactperson(String value) {
		this.contactperson = value;
	}
		
	public String getContactperson() {
		return this.contactperson;
	}
		
	
		
	public void setContactphone(String value) {
		this.contactphone = value;
	}
		
	public String getContactphone() {
		return this.contactphone;
	}
		
	
		
	public void setCommAddr(String value) {
		this.commAddr = value;
	}
		
	public String getCommAddr() {
		return this.commAddr;
	}
		
	
		
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getOtherAddr() {
		return otherAddr;
	}

	public void setOtherAddr(String otherAddr) {
		this.otherAddr = otherAddr;
	}

	public void setAccesskey(String value) {
		this.accesskey = value;
	}
		
	public String getAccesskey() {
		return this.accesskey;
	}
		
	
		
	public void setMaxUsers(Integer value) {
		this.maxUsers = value;
	}
		
	public Integer getMaxUsers() {
		return this.maxUsers;
	}
		
	
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	
		
	public void setParentId(Integer value) {
		this.parentId = value;
	}
		
	public Integer getParentId() {
		return this.parentId;
	}
		
	
		
	public void setLevel(Integer value) {
		this.level = value;
	}
		
	public Integer getLevel() {
		return this.level;
	}
		
	
	
		
	public void setRegistryDate(Date value) {
		this.registryDate = value;
	}
		
	public Date getRegistryDate() {
		return this.registryDate;
	}

	public Integer getParentSpCode() {
		return parentSpCode;
	}

	public void setParentSpCode(Integer parentSpCode) {
		this.parentSpCode = parentSpCode;
	}

	public String getParentSpName() {
		return parentSpName;
	}

	public void setParentSpName(String parentSpName) {
		this.parentSpName = parentSpName;
	}
		
}


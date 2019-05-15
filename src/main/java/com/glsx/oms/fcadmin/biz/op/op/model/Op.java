
package com.glsx.oms.fcadmin.biz.op.op.model;
import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;
import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 网络运营商 实体
 */
@Table(name = "flowmgn_op")
public class Op extends BaseModel{
	
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4027009335377567137L;

	/**
	 * 序列号ID
	 */
	@Id
	private Integer opId;
	
	/**
	 * 运营商编号：建议和运营平台的商户号一
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer opCode;
	
	/**
	 * 运营商名称
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String opName;
	
	/**
	 * 运营商描述
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String opDesc;
	
	/**
	 * 号码前缀
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String prevCode;
	
	/**
	 * 号码段信息
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String middCode;
	
	/**
	 * 所属运营商 （1：移动 2：电信 3：联通）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer owned;
	
	/**
	 * 服务方域名或者IP
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String srvAddr;
	
	/**
	 * 服务方端口号
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer srvPort;
	
	/**
	 * 验证服务URL地址
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String checkUrl;
	
	/**
	 * 运营商分配的账号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String spAccount;
	
	/**
	 * 通讯KEY
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String commKey;
	
	/**
	 * 服务方用户帐号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String svrUsers;
	
	/**
	 * 服务方密码
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String svrPassword;
	
	/**
	 * 联系人姓名
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String contactPerson;
	
	/**
	 * 联系人电话
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String contactMobile;
	
	/**
	 * url
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String url;
	
	/**
	 * appkey
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String appkey;

	public Op(){
	}

	public Op(
		java.lang.Integer opId
	){
		this.opId = opId;
	}

		
	public void setOpId(Integer value) {
		this.opId = value;
	}
		
	public Integer getOpId() {
		return this.opId;
	}
		
	
		
	public void setOpCode(Integer value) {
		this.opCode = value;
	}
		
	public Integer getOpCode() {
		return this.opCode;
	}
		
	
		
	public void setOpName(String value) {
		this.opName = value;
	}
		
	public String getOpName() {
		return this.opName;
	}
		
	
		
	public void setOpDesc(String value) {
		this.opDesc = value;
	}
		
	public String getOpDesc() {
		return this.opDesc;
	}
		
	
		
	public void setPrevCode(String value) {
		this.prevCode = value;
	}
		
	public String getPrevCode() {
		return this.prevCode;
	}
		
	
		
	public void setMiddCode(String value) {
		this.middCode = value;
	}
		
	public String getMiddCode() {
		return this.middCode;
	}
		
	
		
	public void setOwned(Integer value) {
		this.owned = value;
	}
		
	public Integer getOwned() {
		return this.owned;
	}
		
	
		
	public void setSrvAddr(String value) {
		this.srvAddr = value;
	}
		
	public String getSrvAddr() {
		return this.srvAddr;
	}
		
	
		
	public void setSrvPort(Integer value) {
		this.srvPort = value;
	}
		
	public Integer getSrvPort() {
		return this.srvPort;
	}
		
	
		
	public void setCheckUrl(String value) {
		this.checkUrl = value;
	}
		
	public String getCheckUrl() {
		return this.checkUrl;
	}
		
	public String getSpAccount() {
		return spAccount;
	}

	public void setSpAccount(String spAccount) {
		this.spAccount = spAccount;
	}
		
	public void setCommKey(String value) {
		this.commKey = value;
	}
		
	public String getCommKey() {
		return this.commKey;
	}
		
	
		
	public void setSvrUsers(String value) {
		this.svrUsers = value;
	}
		
	public String getSvrUsers() {
		return this.svrUsers;
	}
		
	
		
	public void setSvrPassword(String value) {
		this.svrPassword = value;
	}
		
	public String getSvrPassword() {
		return this.svrPassword;
	}
		
	
		
	public void setContactPerson(String value) {
		this.contactPerson = value;
	}
		
	public String getContactPerson() {
		return this.contactPerson;
	}
		
	
		
	public void setContactMobile(String value) {
		this.contactMobile = value;
	}
		
	public String getContactMobile() {
		return this.contactMobile;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAppkey() {
		return appkey;
	}

	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}
}


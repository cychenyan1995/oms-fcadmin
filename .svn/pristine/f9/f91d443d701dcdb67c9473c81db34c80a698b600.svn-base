
package com.glsx.oms.fcadmin.biz.auth.nameauth.model;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡实名认证 实体
 */
@Table(name = "flowmgn_flowcard_nameauth")
public class Nameauth extends BaseModel{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -113502027269451108L;

	/**
	 * 主键
	 */
	@Id
	private Integer id;
	
	/**
	 * 记录序号
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer nameauthId;
	
	/**
	 * 流量卡ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer cardId;
	
	/**
	 * 个人姓名
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String personName;
	
	/**
	 * 个人联系手机号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String personMobileno;
	
	/**
	 * 个人身份证号
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String personId;
	
	/**
	 * 手持身份证照片
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String personPhoto;
	
	/**
	 * 身份证照正面
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String personPhotoPos;
	
	/**
	 * 身份证照反面
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String personPhotoOop;
	
	/**
	 * 资料审核结果（0：待审核 1：审核通过 2：审核不通过 3：重新审核）
	 */
	@ColumnType(jdbcType=JdbcType.TINYINT)
	private Integer status;
	
	/**
	 * 审核不通过原因
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String failReason;
	
	/**
	 * ICCID
	 */
	private String iccid;
	
	/**
	 * IMSI
	 */
	private String imsi;

	/**
	 * 网卡号
	 */
	private String cardNo;
	
	/**
	 * 运营商类型 （1：移动 2：电信 3：联通）
	 */
	private Integer owned;
	
	/**
	 * 运营商名称
	 */
	private String opName;
	
	/**
	 * 查询条件
	 */
	private String keyWork;
	
	/**
	 * 提交时间
	 */
	private String createDate;
	
	/**
	 * 审核时间
	 */
	private String approveDate;
	
	/**
	 * openId
	 */
	private String openId;
	
	public Nameauth(){
	}

	public Nameauth(
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
		
	public void setNameauthId(Integer value) {
		this.nameauthId = value;
	}
		
	public Integer getNameauthId() {
		return this.nameauthId;
	}
		
	public void setCardId(Integer value) {
		this.cardId = value;
	}
		
	public Integer getCardId() {
		return this.cardId;
	}
		
	public void setPersonName(String value) {
		this.personName = value;
	}
		
	public String getPersonName() {
		return this.personName;
	}
		
	public void setPersonMobileno(String value) {
		this.personMobileno = value;
	}
		
	public String getPersonMobileno() {
		return this.personMobileno;
	}
		
	public void setPersonId(String value) {
		this.personId = value;
	}
		
	public String getPersonId() {
		return this.personId;
	}
		
	public void setPersonPhoto(String value) {
		this.personPhoto = value;
	}
		
	public String getPersonPhoto() {
		return this.personPhoto;
	}
		
	public void setPersonPhotoPos(String value) {
		this.personPhotoPos = value;
	}
		
	public String getPersonPhotoPos() {
		return this.personPhotoPos;
	}
		
	public void setPersonPhotoOop(String value) {
		this.personPhotoOop = value;
	}
		
	public String getPersonPhotoOop() {
		return this.personPhotoOop;
	}
		
	public void setStatus(Integer value) {
		this.status = value;
	}
		
	public Integer getStatus() {
		return this.status;
	}
		
	public void setFailReason(String value) {
		this.failReason = value;
	}
		
	public String getFailReason() {
		return this.failReason;
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

	public Integer getOwned() {
		return owned;
	}

	public void setOwned(Integer owned) {
		this.owned = owned;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getKeyWork() {
		return keyWork;
	}

	public void setKeyWork(String keyWork) {
		this.keyWork = keyWork;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
}


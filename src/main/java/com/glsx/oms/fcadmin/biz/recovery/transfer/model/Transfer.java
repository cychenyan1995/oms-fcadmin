
package com.glsx.oms.fcadmin.biz.recovery.transfer.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量卡迁移记录 实体
 */
@Table(name = "flowmgn_card_transfer")
public class Transfer extends BaseModel{
	
	
	/**
	 * 序列ID
	 */
	@Id
	private Integer transId;
	
	/**
	 * 原始卡ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer srcCardId;
	
	/**
	 * 目标卡ID
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer dstCardId;
	
	/**
	 * 流量从此imsi迁出
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String srcImsi;
	
	/**
	 * 流量迁入此imsi
	 */
	@ColumnType(jdbcType=JdbcType.VARCHAR)
	private String dstImsi;
	
	/**
	 * 迁出卡总流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float srcPkgTotalflow;
	
	/**
	 * 迁出卡已用流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float srcPkgUsedflow;
	
	/**
	 * 迁出卡剩余流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float srcPkgRemainflow;
	
	/**
	 * 迁出卡当月消耗流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float srcCurrmonthConsumeflow;
	
	/**
	 * 迁出卡套餐内除去当月的累计使用流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float srcPkgAccuFlow;
	
	/**
	 * 迁出卡需要剔除的套餐流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float srcPkgDeleteFlow;
	
	/**
	 * 迁出卡套餐开始时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date srcPkgStarttime;
	
	/**
	 * 迁出卡套餐结束时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date srcPkgEndttime;
	
	/**
	 * 迁出卡当前套餐编码
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer srcPkgId;
	
	/**
	 * 迁入卡总流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float dstPkgTotalflow;
	
	/**
	 * 迁入卡已用流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float dstPkgUsedflow;
	
	/**
	 * 迁入卡剩余流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float dstPkgRemainflow;
	
	/**
	 * 迁入卡当月消耗流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float dstCurrmonthConsumeflow;
	
	/**
	 * 迁入卡套餐内除去当月的累计使用流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float dstPkgAccuFlow;
	
	/**
	 * 迁入卡需要剔除的套餐流量(M)
	 */
	@ColumnType(jdbcType=JdbcType.REAL)
	private Float dstPkgDeleteFlow;
	
	/**
	 * 迁入卡套餐开始时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date dstPkgStarttime;
	
	/**
	 * 迁入卡套餐结束时间
	 */
	@ColumnType(jdbcType=JdbcType.TIMESTAMP)
	private Date dstPkgEndttime;
	
	/**
	 * 迁入卡当前套餐编码
	 */
	@ColumnType(jdbcType=JdbcType.INTEGER)
	private Integer dstPkgId;

	public Transfer(){
	}

	public Transfer(
		java.lang.Integer transId
	){
		this.transId = transId;
	}

		
	public void setTransId(Integer value) {
		this.transId = value;
	}
		
	public Integer getTransId() {
		return this.transId;
	}
		
	
		
	public void setSrcCardId(Integer value) {
		this.srcCardId = value;
	}
		
	public Integer getSrcCardId() {
		return this.srcCardId;
	}
		
	
		
	public void setDstCardId(Integer value) {
		this.dstCardId = value;
	}
		
	public Integer getDstCardId() {
		return this.dstCardId;
	}
		
	
		
	public void setSrcImsi(String value) {
		this.srcImsi = value;
	}
		
	public String getSrcImsi() {
		return this.srcImsi;
	}
		
	
		
	public void setDstImsi(String value) {
		this.dstImsi = value;
	}
		
	public String getDstImsi() {
		return this.dstImsi;
	}
		
	
		
	public void setSrcPkgTotalflow(Float value) {
		this.srcPkgTotalflow = value;
	}
		
	public Float getSrcPkgTotalflow() {
		return this.srcPkgTotalflow;
	}
		
	
		
	public void setSrcPkgUsedflow(Float value) {
		this.srcPkgUsedflow = value;
	}
		
	public Float getSrcPkgUsedflow() {
		return this.srcPkgUsedflow;
	}
		
	
		
	public void setSrcPkgRemainflow(Float value) {
		this.srcPkgRemainflow = value;
	}
		
	public Float getSrcPkgRemainflow() {
		return this.srcPkgRemainflow;
	}
		
	
		
	public void setSrcCurrmonthConsumeflow(Float value) {
		this.srcCurrmonthConsumeflow = value;
	}
		
	public Float getSrcCurrmonthConsumeflow() {
		return this.srcCurrmonthConsumeflow;
	}
		
	
		
	public void setSrcPkgAccuFlow(Float value) {
		this.srcPkgAccuFlow = value;
	}
		
	public Float getSrcPkgAccuFlow() {
		return this.srcPkgAccuFlow;
	}
		
	
		
	public void setSrcPkgDeleteFlow(Float value) {
		this.srcPkgDeleteFlow = value;
	}
		
	public Float getSrcPkgDeleteFlow() {
		return this.srcPkgDeleteFlow;
	}
		
	
	
		
	public void setSrcPkgStarttime(Date value) {
		this.srcPkgStarttime = value;
	}
		
	public Date getSrcPkgStarttime() {
		return this.srcPkgStarttime;
	}
		
	
	
		
	public void setSrcPkgEndttime(Date value) {
		this.srcPkgEndttime = value;
	}
		
	public Date getSrcPkgEndttime() {
		return this.srcPkgEndttime;
	}
		
	
		
	public void setSrcPkgId(Integer value) {
		this.srcPkgId = value;
	}
		
	public Integer getSrcPkgId() {
		return this.srcPkgId;
	}
		
	
		
	public void setDstPkgTotalflow(Float value) {
		this.dstPkgTotalflow = value;
	}
		
	public Float getDstPkgTotalflow() {
		return this.dstPkgTotalflow;
	}
		
	
		
	public void setDstPkgUsedflow(Float value) {
		this.dstPkgUsedflow = value;
	}
		
	public Float getDstPkgUsedflow() {
		return this.dstPkgUsedflow;
	}
		
	
		
	public void setDstPkgRemainflow(Float value) {
		this.dstPkgRemainflow = value;
	}
		
	public Float getDstPkgRemainflow() {
		return this.dstPkgRemainflow;
	}
		
	
		
	public void setDstCurrmonthConsumeflow(Float value) {
		this.dstCurrmonthConsumeflow = value;
	}
		
	public Float getDstCurrmonthConsumeflow() {
		return this.dstCurrmonthConsumeflow;
	}
		
	
		
	public void setDstPkgAccuFlow(Float value) {
		this.dstPkgAccuFlow = value;
	}
		
	public Float getDstPkgAccuFlow() {
		return this.dstPkgAccuFlow;
	}
		
	
		
	public void setDstPkgDeleteFlow(Float value) {
		this.dstPkgDeleteFlow = value;
	}
		
	public Float getDstPkgDeleteFlow() {
		return this.dstPkgDeleteFlow;
	}
		
	
	
		
	public void setDstPkgStarttime(Date value) {
		this.dstPkgStarttime = value;
	}
		
	public Date getDstPkgStarttime() {
		return this.dstPkgStarttime;
	}
		
	
	
		
	public void setDstPkgEndttime(Date value) {
		this.dstPkgEndttime = value;
	}
		
	public Date getDstPkgEndttime() {
		return this.dstPkgEndttime;
	}
		
	
		
	public void setDstPkgId(Integer value) {
		this.dstPkgId = value;
	}
		
	public Integer getDstPkgId() {
		return this.dstPkgId;
	}
		
	
	
		
	
	
		
	
		
	
		
	

}


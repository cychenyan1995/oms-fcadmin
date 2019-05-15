
package com.glsx.oms.fcadmin.biz.card.flowcard.model;

import javax.persistence.Id;
import javax.persistence.Table;
import org.oreframework.web.model.BaseModel;
import org.apache.ibatis.type.JdbcType;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 流量平台中心卡信息 实体
 */
@Table(name = "flowmgn_flowcard")
public class FlowCard extends BaseModel {

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 4580970206118604972L;

	/**
	 * 流量卡序列ID
	 */
	@Id
	private Integer cardId;

	/**
	 * 卡号
	 */
	@ColumnType(jdbcType = JdbcType.VARCHAR)
	private String cardNo;

	/**
	 * IMSI
	 */
	@ColumnType(jdbcType = JdbcType.VARCHAR)
	private String imsi;

	/**
	 * 卡的imei值
	 */
	@ColumnType(jdbcType = JdbcType.VARCHAR)
	private String imei;

	/**
	 * ICCID 保存19位
	 */
	@ColumnType(jdbcType = JdbcType.VARCHAR)
	private String iccid;

	/**
	 * 运营商发货日期
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String deliveryTime;

	/**
	 * 运营商激活日期
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String activeTime;

	/**
	 * 资费计划ID（运营商侧）
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer postageId;

	/**
	 * 资费计划生效日期
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String postageBegintime;

	/**
	 * 资费计划到期日期
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String postageEndtime;

	/**
	 * 服务商套餐ID（服务侧）
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer packageId;

	/**
	 * 套餐状态（0：库存/1:已激活2：已过期）
	 */
	@ColumnType(jdbcType = JdbcType.TINYINT)
	private Integer packageStatus;

	/**
	 * 服务商套餐生效时间
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String packageBegintime;

	/**
	 * 服务商套餐结束时间
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String packageEndtime;

	/**
	 * 入库订单序号
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer inStkOrderId;

	/**
	 * 卡入库时间
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String inStockTime;

	/**
	 * 卡出库时间
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String outStockTime;

	/**
	 * 卡状态 (0=可测试/1=库存卡/3=可激活/4=已激活/5=已停卡/6=已销卡)
	 */
	@ColumnType(jdbcType = JdbcType.TINYINT)
	private Integer status;

	/**
	 * 卡状态变更时间
	 */
	@ColumnType(jdbcType = JdbcType.TIMESTAMP)
	private String statusChangeTime;

	/**
	 * 卡所属运营商ID
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer opId;

	/**
	 * 卡发货给服务商ID
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer spId;

	/**
	 * 初始通讯计划ID
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer initAccessId;

	/**
	 * 当前通讯计划ID
	 */
	@ColumnType(jdbcType = JdbcType.INTEGER)
	private Integer currAccessId;

	/**
	 * 运营商加+“N"带检验位
	 */
	@ColumnType(jdbcType = JdbcType.VARCHAR)
	private String iccidn;

	/**
	 * 实名认证状态 （0：未认证 1：已认证）
	 */
	@ColumnType(jdbcType = JdbcType.TINYINT)
	private Integer isAuthname;

	private Integer authStatus;

	/**
	 * 卡类型：(1:工业贴片卡/2:工业大卡/3:双切卡)
	 */
	@ColumnType(jdbcType = JdbcType.TINYINT)
	private Integer cardType;

	/**
	 * 自动激活截止日期, 激活宽限期计算而来
	 */
	@ColumnType(jdbcType = JdbcType.DATE)
	private String autoActiveDate;

	/**
	 * 是否回收卡（0：新卡 /1:回收卡）
	 */
	@ColumnType(jdbcType = JdbcType.BIT)
	private Boolean isRecycleCard;

	/**
	 * 服务商名称
	 */
	private String spName;
	
	/**
	 * 服务商层级
	 */
	private String level;

	/**
	 * 当月消耗(MB)
	 */
	private float consumeMonthflow;
	/**
	 * 总流量
	 */
	private float totalFlow;
	/**
	 * 总消耗
	 */
	private float usedTotalflow;
	/**
	 * 总剩余
	 */
	private float remainTotalflow;

	/**
	 * 激活开始时间
	 */
	private String activeBegintime;

	/**
	 * 激活结束时间
	 */
	private String activeEndtime;

	/**
	 * 运营商发货开始时间
	 */
	private String deliveryStarttime;

	/**
	 * 运营商发货结束时间
	 */
	private String deliveryEndtime;

	/**
	 * 套餐开始时间
	 */
	private String startTime;

	/**
	 * 套餐结束时间
	 */
	private String endTime;

	/**
	 * 开始时间
	 */
	private String startDate;

	/**
	 * 套餐结束时间
	 */
	private String endDate;

	/**
	 * 导入开始时间
	 */
	private String inStockBegintime;

	/**
	 * 导入结束时间
	 */
	private String inStrockEndtime;

	/**
	 * 出库开始时间
	 */
	private String outStrockBegintime;

	/**
	 * 出库结束时间
	 */
	private String outStrockEndtime;

	/**
	 * 当月总消耗流量
	 */
	private float curUsedSmall;
	private float curUsedBig;

	/**
	 * 总流量
	 */
	private float totalSmall;
	private float totalBig;

	/**
	 * 总消耗
	 */
	private float usedSmall;
	private float usedBig;

	/**
	 * 总剩余
	 */
	private float remainSmall;
	private float remainBig;

	/**
	 * 流量池名称
	 */
	private String poolId;

	/**
	 * 卡状态变更原因
	 */
	private String statusChangeReason;
	
	/**
	 * 资费计划名称
	 */
	private String postageName;

	/**
	 * 查询条件
	 */
	private String queryText;
	
	/**
	 * 套餐编号
	 */
	private String packageCode;
	
	/**
	 * 套餐名称
	 */
	private String packageName;
	
	/**
	 * 参数列表
	 */
//	@ColumnType(jdbcType = JdbcType.ARRAY)
//	private List<String> cardNos;

	/**
	 * 列排序
	 */
	private String column;

	/**
	 * 升序或者降序
	 */
	private String sort;
	
	/**
	 * 流量池名称
	 */
	private String flowpoolName;
	
	/**
	 * 运营商类型
	 */
	private Integer owned;
	
	/**
	 * 服务商名称
	 */
	private String opName;
	
	/**
	 * 初始资费计划
	 */
	private String initPostageName;
	
	/**
	 * 当前资费计划
	 */
	private String currPostageName;
	
	/**
	 * 初始通信计划
	 */
	private String initaccessName;
	
	/**
	 * 当前通信计划
	 */
	private String currAccessName;

	/**
	 * 是否无限流量
	 */
	private Integer isUnlimitFlow;
	
	/**
	 * 查询开始
	 */
	private Integer searchStart;
	
	/**
	 * 查询页数量
	 */
	private Integer searchSize;
	
	/**
	 * 白卡状态
	 */
	private Integer emptyStatus;
	
	/**
	 * 开通套餐手机号
	 */
	private String phoneNo;
	
	public FlowCard() {
	}

	public FlowCard(java.lang.Integer cardId) {
		this.cardId = cardId;
	}

	public void setCardId(Integer value) {
		this.cardId = value;
	}

	public Integer getCardId() {
		return this.cardId;
	}

	public void setCardNo(String value) {
		this.cardNo = value;
	}

	public String getCardNo() {
		return this.cardNo;
	}

	public void setImsi(String value) {
		this.imsi = value;
	}

	public String getImsi() {
		return this.imsi;
	}

	public void setImei(String value) {
		this.imei = value;
	}

	public String getImei() {
		return this.imei;
	}

	public void setIccid(String value) {
		this.iccid = value;
	}

	public String getIccid() {
		return this.iccid;
	}

	public void setDeliveryTime(String value) {
		this.deliveryTime = value;
	}

	public String getDeliveryTime() {
		return this.deliveryTime;
	}

	public void setActiveTime(String value) {
		this.activeTime = value;
	}

	public String getActiveTime() {
		return this.activeTime;
	}

	public void setPostageId(Integer value) {
		this.postageId = value;
	}

	public Integer getPostageId() {
		return this.postageId;
	}

	public void setPostageBegintime(String value) {
		this.postageBegintime = value;
	}

	public String getPostageBegintime() {
		return this.postageBegintime;
	}

	public void setPostageEndtime(String value) {
		this.postageEndtime = value;
	}

	public String getPostageEndtime() {
		return this.postageEndtime;
	}

	public void setPackageId(Integer value) {
		this.packageId = value;
	}

	public Integer getPackageId() {
		return this.packageId;
	}

	public void setPackageStatus(Integer value) {
		this.packageStatus = value;
	}

	public Integer getPackageStatus() {
		return this.packageStatus;
	}

	public void setPackageBegintime(String value) {
		this.packageBegintime = value;
	}

	public String getPackageBegintime() {
		return this.packageBegintime;
	}

	public void setPackageEndtime(String value) {
		this.packageEndtime = value;
	}

	public String getPackageEndtime() {
		return this.packageEndtime;
	}

	public void setInStkOrderId(Integer value) {
		this.inStkOrderId = value;
	}

	public Integer getInStkOrderId() {
		return this.inStkOrderId;
	}

	public void setInStockTime(String value) {
		this.inStockTime = value;
	}

	public String getInStockTime() {
		return this.inStockTime;
	}

	public void setOutStockTime(String value) {
		this.outStockTime = value;
	}

	public String getOutStockTime() {
		return this.outStockTime;
	}

	public void setStatus(Integer value) {
		this.status = value;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatusChangeTime(String value) {
		this.statusChangeTime = value;
	}

	public String getStatusChangeTime() {
		return this.statusChangeTime;
	}

	public void setOpId(Integer value) {
		this.opId = value;
	}

	public Integer getOpId() {
		return this.opId;
	}

	public void setSpId(Integer value) {
		this.spId = value;
	}

	public Integer getSpId() {
		return this.spId;
	}

	public void setInitAccessId(Integer value) {
		this.initAccessId = value;
	}

	public Integer getInitAccessId() {
		return this.initAccessId;
	}

	public void setCurrAccessId(Integer value) {
		this.currAccessId = value;
	}

	public Integer getCurrAccessId() {
		return this.currAccessId;
	}

	public void setIccidn(String value) {
		this.iccidn = value;
	}

	public String getIccidn() {
		return this.iccidn;
	}

	public void setIsAuthname(Integer value) {
		this.isAuthname = value;
	}

	public Integer getIsAuthname() {
		return this.isAuthname;
	}

	public Integer getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(Integer authStatus) {
		this.authStatus = authStatus;
	}

	public void setCardType(Integer value) {
		this.cardType = value;
	}

	public Integer getCardType() {
		return this.cardType;
	}

	public void setAutoActiveDate(String value) {
		this.autoActiveDate = value;
	}

	public String getAutoActiveDate() {
		return this.autoActiveDate;
	}

	public void setIsRecycleCard(Boolean value) {
		this.isRecycleCard = value;
	}

	public Boolean getIsRecycleCard() {
		return this.isRecycleCard;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public float getConsumeMonthflow() {
		return consumeMonthflow;
	}

	public void setConsumeMonthflow(float consumeMonthflow) {
		this.consumeMonthflow = consumeMonthflow;
	}

	public float getTotalFlow() {
		return totalFlow;
	}

	public void setTotalFlow(float totalFlow) {
		this.totalFlow = totalFlow;
	}

	public float getUsedTotalflow() {
		return usedTotalflow;
	}

	public void setUsedTotalflow(float usedTotalflow) {
		this.usedTotalflow = usedTotalflow;
	}

	public float getRemainTotalflow() {
		return remainTotalflow;
	}

	public void setRemainTotalflow(float remainTotalflow) {
		this.remainTotalflow = remainTotalflow;
	}

	public String getActiveBegintime() {
		return activeBegintime;
	}

	public void setActiveBegintime(String activeBegintime) {
		this.activeBegintime = activeBegintime;
	}

	public String getActiveEndtime() {
		return activeEndtime;
	}

	public void setActiveEndtime(String activeEndtime) {
		this.activeEndtime = activeEndtime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getInStockBegintime() {
		return inStockBegintime;
	}

	public void setInStockBegintime(String inStockBegintime) {
		this.inStockBegintime = inStockBegintime;
	}

	public String getInStrockEndtime() {
		return inStrockEndtime;
	}

	public void setInStrockEndtime(String inStrockEndtime) {
		this.inStrockEndtime = inStrockEndtime;
	}

	public String getDeliveryStarttime() {
		return deliveryStarttime;
	}

	public void setDeliveryStarttime(String deliveryStarttime) {
		this.deliveryStarttime = deliveryStarttime;
	}

	public String getDeliveryEndtime() {
		return deliveryEndtime;
	}

	public void setDeliveryEndtime(String deliveryEndtime) {
		this.deliveryEndtime = deliveryEndtime;
	}

	public String getOutStrockBegintime() {
		return outStrockBegintime;
	}

	public void setOutStrockBegintime(String outStrockBegintime) {
		this.outStrockBegintime = outStrockBegintime;
	}

	public String getOutStrockEndtime() {
		return outStrockEndtime;
	}

	public void setOutStrockEndtime(String outStrockEndtime) {
		this.outStrockEndtime = outStrockEndtime;
	}

	public float getCurUsedSmall() {
		return curUsedSmall;
	}

	public void setCurUsedSmall(float curUsedSmall) {
		this.curUsedSmall = curUsedSmall;
	}

	public float getCurUsedBig() {
		return curUsedBig;
	}

	public void setCurUsedBig(float curUsedBig) {
		this.curUsedBig = curUsedBig;
	}

	public float getTotalSmall() {
		return totalSmall;
	}

	public void setTotalSmall(float totalSmall) {
		this.totalSmall = totalSmall;
	}

	public float getTotalBig() {
		return totalBig;
	}

	public void setTotalBig(float totalBig) {
		this.totalBig = totalBig;
	}

	public float getUsedSmall() {
		return usedSmall;
	}

	public void setUsedSmall(float usedSmall) {
		this.usedSmall = usedSmall;
	}

	public float getUsedBig() {
		return usedBig;
	}

	public void setUsedBig(float usedBig) {
		this.usedBig = usedBig;
	}

	public float getRemainSmall() {
		return remainSmall;
	}

	public void setRemainSmall(float remainSmall) {
		this.remainSmall = remainSmall;
	}

	public float getRemainBig() {
		return remainBig;
	}

	public void setRemainBig(float remainBig) {
		this.remainBig = remainBig;
	}

	public String getPoolId() {
		return poolId;
	}

	public void setPoolId(String poolId) {
		this.poolId = poolId;
	}

	public String getStatusChangeReason() {
		return statusChangeReason;
	}

	public void setStatusChangeReason(String statusChangeReason) {
		this.statusChangeReason = statusChangeReason;
	}

	public String getPostageName() {
		return postageName;
	}

	public void setPostageName(String postageName) {
		this.postageName = postageName;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}

	public String getPackageCode() {
		return packageCode;
	}

	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

/*	public List<String> getCardNos() {
		return cardNos;
	}

	public void setCardNos(List<String> cardNos) {
		this.cardNos = cardNos;
	}*/

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getFlowpoolName() {
		return flowpoolName;
	}

	public void setFlowpoolName(String flowpoolName) {
		this.flowpoolName = flowpoolName;
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

	public String getInitPostageName() {
		return initPostageName;
	}

	public void setInitPostageName(String initPostageName) {
		this.initPostageName = initPostageName;
	}

	public String getCurrPostageName() {
		return currPostageName;
	}

	public void setCurrPostageName(String currPostageName) {
		this.currPostageName = currPostageName;
	}

	public String getInitaccessName() {
		return initaccessName;
	}

	public void setInitaccessName(String initaccessName) {
		this.initaccessName = initaccessName;
	}

	public String getCurrAccessName() {
		return currAccessName;
	}

	public void setCurrAccessName(String currAccessName) {
		this.currAccessName = currAccessName;
	}

	public Integer getIsUnlimitFlow() {
		return isUnlimitFlow;
	}

	public void setIsUnlimitFlow(Integer isUnlimitFlow) {
		this.isUnlimitFlow = isUnlimitFlow;
	}

	public Integer getSearchStart() {
		return searchStart;
	}

	public void setSearchStart(Integer searchStart) {
		this.searchStart = searchStart;
	}

	public Integer getSearchSize() {
		return searchSize;
	}

	public void setSearchSize(Integer searchSize) {
		this.searchSize = searchSize;
	}

	public Integer getEmptyStatus() {
		return emptyStatus;
	}

	public void setEmptyStatus(Integer emptyStatus) {
		this.emptyStatus = emptyStatus;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
}

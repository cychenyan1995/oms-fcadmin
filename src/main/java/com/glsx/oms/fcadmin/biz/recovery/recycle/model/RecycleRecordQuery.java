package com.glsx.oms.fcadmin.biz.recovery.recycle.model;

/**
 * 回收记录列表页查询条件类
 * @author Lenovo
 *
 */
public class RecycleRecordQuery extends RecycleRecord{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7324931614422693300L;
	
	
	private String requestStartTime;
	private String requestEndTime;
	private String recycleStartTime;
	private String recycleEndTime;
	

	public String getRequestStartTime() {
		return requestStartTime;
	}
	public void setRequestStartTime(String requestStartTime) {
		this.requestStartTime = requestStartTime;
	}
	public String getRequestEndTime() {
		return requestEndTime;
	}
	public void setRequestEndTime(String requestEndTime) {
		this.requestEndTime = requestEndTime;
	}
	public String getRecycleStartTime() {
		return recycleStartTime;
	}
	public void setRecycleStartTime(String recycleStartTime) {
		this.recycleStartTime = recycleStartTime;
	}
	public String getRecycleEndTime() {
		return recycleEndTime;
	}
	public void setRecycleEndTime(String recycleEndTime) {
		this.recycleEndTime = recycleEndTime;
	}
	
}

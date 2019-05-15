package com.glsx.oms.fcadmin.biz.download.task.model;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

//import org.oreframework.common.lang.date.DateFormatConstants;
//import org.oreframework.common.lang.date.DateUtils;
import org.apache.ibatis.type.JdbcType;
import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;

import tk.mybatis.mapper.annotation.ColumnType;

/**
 * 异步任务表 实体
 */
@Table(name = "flowmgn_async_task")
public class Task
{
    
    /**
     * 任务主键
     */
    @Id
    private Integer taskId;
    
    /**
     * 任务名称
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskName;
    
    /**
     * 任务描述
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskDesc;
    
    /**
     * 任务类型：0=订单数据导出下载类型
     */
    @ColumnType(jdbcType = JdbcType.TINYINT)
    private Integer taskType;
    
    /**
     * 任务状态：0=未执行/1=已执行
     */
    @ColumnType(jdbcType = JdbcType.TINYINT)
    private Integer taskStatus;
    
    /**
     * 任务创建时间
     */
    @ColumnType(jdbcType = JdbcType.TIMESTAMP)
    private Date taskCreatetime;
    
    @Transient
    private String taskCreatetimeFormat;
    
    /**
     * 任务更新时间
     */
    @ColumnType(jdbcType = JdbcType.TIMESTAMP)
    private Date taskUpdatetime;
    
    /**
     * 任务来源
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskSource;
    
    /**
     * 任务创建者
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskCreator;
    
    /**
     * 任务创建者ID
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskCreatorId;
    
    /**
     * 任务执行参数
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskExecParams;
    
    /**
     * 任务执行结果状态：-1=执行失败/0=未执行/1=执行成功
     */
    @ColumnType(jdbcType = JdbcType.TINYINT)
    private Integer taskExecStatus;
    
    /**
     * 任务执行结果描述（包括失败描述异常信息）
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String taskExecResult;
    
    /**
     * 任务执行时间
     */
    @ColumnType(jdbcType = JdbcType.TIMESTAMP)
    private Date taskExecDatetime;
    
    /**
     * 文件下载路径
     */
    @ColumnType(jdbcType = JdbcType.VARCHAR)
    private String fileDownloadUrl;
    
    /**
     * 是否下载：0=未下载/1=已下载
     */
    @ColumnType(jdbcType = JdbcType.INTEGER)
    private int isDownload;
    
    public Task()
    {
    }
    
    public Task(java.lang.Integer taskId)
    {
        this.taskId = taskId;
    }
    
    public void setTaskId(Integer value)
    {
        this.taskId = value;
    }
    
    public Integer getTaskId()
    {
        return this.taskId;
    }
    
    public void setTaskName(String value)
    {
        this.taskName = value;
    }
    
    public String getTaskName()
    {
        return this.taskName;
    }
    
    public void setTaskDesc(String value)
    {
        this.taskDesc = value;
    }
    
    public String getTaskDesc()
    {
        return this.taskDesc;
    }
    
    public void setTaskType(Integer value)
    {
        this.taskType = value;
    }
    
    public Integer getTaskType()
    {
        return this.taskType;
    }
    
    public void setTaskStatus(Integer value)
    {
        this.taskStatus = value;
    }
    
    public Integer getTaskStatus()
    {
        return this.taskStatus;
    }
    
    public void setTaskCreatetime(Date value)
    {
        this.taskCreatetime = value;
    }
    
    public Date getTaskCreatetime()
    {
        return this.taskCreatetime;
    }
    
    public void setTaskUpdatetime(Date value)
    {
        this.taskUpdatetime = value;
    }
    
    public Date getTaskUpdatetime()
    {
        return this.taskUpdatetime;
    }
    
    public void setTaskSource(String value)
    {
        this.taskSource = value;
    }
    
    public String getTaskSource()
    {
        return this.taskSource;
    }
    
    public void setTaskCreator(String value)
    {
        this.taskCreator = value;
    }
    
    public String getTaskCreator()
    {
        return this.taskCreator;
    }
    
    public void setTaskCreatorId(String value)
    {
        this.taskCreatorId = value;
    }
    
    public String getTaskCreatorId()
    {
        return this.taskCreatorId;
    }
    
    public void setTaskExecParams(String value)
    {
        this.taskExecParams = value;
    }
    
    public String getTaskExecParams()
    {
        return this.taskExecParams;
    }
    
    public void setTaskExecStatus(Integer value)
    {
        this.taskExecStatus = value;
    }
    
    public Integer getTaskExecStatus()
    {
        return this.taskExecStatus;
    }
    
    public void setTaskExecResult(String value)
    {
        this.taskExecResult = value;
    }
    
    public String getTaskExecResult()
    {
        return this.taskExecResult;
    }
    
    public void setTaskExecDatetime(Date value)
    {
        this.taskExecDatetime = value;
    }
    
    public Date getTaskExecDatetime()
    {
        return this.taskExecDatetime;
    }
    
    public void setFileDownloadUrl(String value)
    {
        this.fileDownloadUrl = value;
    }
    
    public String getFileDownloadUrl()
    {
        return this.fileDownloadUrl;
    }
    
    public String getTaskCreatetimeFormat()
    {
        taskCreatetimeFormat = DateUtils.convertDateToString(taskCreatetime, DateFormatConstants.DATE_HOUR_FORMAT);
        return taskCreatetimeFormat;
    }
    
    public void setTaskCreatetimeFormat(String taskCreatetimeFormate)
    {
        this.taskCreatetimeFormat = taskCreatetimeFormate;
    }
    
    public int getIsDownload()
    {
        return isDownload;
    }
    
    public void setIsDownload(int isDownload)
    {
        this.isDownload = isDownload;
    }
    
}

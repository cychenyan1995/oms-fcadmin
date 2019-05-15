package com.glsx.oms.fcadmin.framework;

public class Contants
{
    public static final String SYSTEM_NAME = "流量管理平台";
    
	/**
     * 卡类型
     */
    public static final Integer CARD_TYPE_ONE = 1;		  //工业贴片卡
    public static final Integer CARD_TYPE_TWO = 2;		  //工业大卡
    public static final Integer CARD_TYPE_THREE = 3;	  //双切卡
    
    public static final String CARD_TYPE_TP = "工业贴片卡";
    public static final String CARD_TYPE_DK = "工业大卡";
    public static final String CARD_TYPE_SQ = "双切卡";
    
    /**
     * 启用、停用操作
     */
    public static final String OPERATE_OPEN = "1";
    public static final String OPERATE_STOP = "2";
    
    /**
     * 卡状态
     */
    public static final String CARD_TEST = "0";      	 //可测试
    public static final String CARD_ACTIVE = "4";		 //已激活
    public static final String CARD_CANCEL = "6";		 //已销卡
    public static final String CARD_REPERTORY = "1";	 //库存
    public static final String CARD_BEACTIVE = "3";		 //可激活
    public static final String CARD_STOP = "5";		     //已停用
    
    /**
     * 启用停用卡
     */
    public static final Integer OPEN_CARD = 0;			//启用
    public static final Integer STOP_CARD = 1;			//停用
    
    /**
     * 套餐类型
     */
    public static final Integer CARD_TYPE_OPEN = 1;  	//开卡套餐
    
    
    /**
     * 服务商ID（1：表示通用）
     */
    public static final Integer SPID_COMMEN = 1;
    
    /**
     * 审核操作
     */
    public static final Integer OPERATE_FLAG = 1;		//审核通过
    
    public static final Integer NO_OPERATE_FLAG = 2;	//审核不通过
    
    /**
     * 流量单位
     */
    public static final String FLOW_UNIT_G = "G";      //流量单位G
    
    public static final String SP_CHILD="-2";			//服务商有子集
    
    
    /**
     * 运营商
     */
    public static final Integer OWNER_CMCC = 1;			//移动
    
    public static final Integer OWNER_UNICOM = 3;       //联通
    
    /**
     * 套餐分类
     */
    public static final Integer PK_OPEN = 0;			//开卡套餐
    
    public static final Integer PK_WHITE = 1;			//白卡套餐
}


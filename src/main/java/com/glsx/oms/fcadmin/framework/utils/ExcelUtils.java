/**
 * 项目名：广联运营平台
 * 包名：com.glsx.operating.cyb.util
 * 文件名：GeneralHelper.java
 * 版本信息：1.0.0
 * 日期：2013-8-15-下午4:49:57
 * 
 * Copyright (c) 2013 深圳广联赛讯有限公司-版权所有
 * 
 */

package com.glsx.oms.fcadmin.framework.utils;

import java.io.InputStream;
import java.io.OutputStream;

/**
 * excel工具类
 * 
 * @author 陈展鹏
 * 
 * 修改：张祥涛
 * 
 */
public class ExcelUtils {
	
	/**
	 * @Title: downloadExcelTemplate
	 * @Description: 下载Excle模版文件
	 * @author: 杨培弘
	 * @param os
	 * @param path
	 * @throws Exception
	 */
	public static void downloadExcelTemplate(OutputStream os, String path) throws Exception {
		InputStream is = 
			Thread.currentThread().getContextClassLoader().getResourceAsStream(path);
		
		byte[] bs = new byte[1024];
		int len = -1;
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.flush();
		if (os != null) {
			os.close();
		}
		if (is != null) {
			is.close();
		}
	}
}

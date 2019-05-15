
package com.glsx.oms.fcadmin.biz.order.outorder.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.order.outorder.service.OutOrderService;
import com.glsx.oms.fcadmin.framework.config.FcadminProperty;

import net.sf.json.JSONObject;

import com.glsx.oms.fcadmin.biz.order.outorder.model.OutOrder;

/**
 * 流量卡出库订单管理 Controller
 */
@RestController
@RequestMapping(value = "/order")
public class OutOrderController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(OutOrderController.class);

    @Autowired
    private OutOrderService outOrderService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    /**
	 * 静态变量配置类
	 */
	@Autowired
	private FcadminProperty fcadminProperty;
    
    @RequestMapping(value = "/outorder/{id}", method = RequestMethod.GET)
    public ResultEntity<OutOrder> get(@PathVariable("id") Integer id) {
        ResultEntity<OutOrder> resultEntity = new ResultEntity<OutOrder>();
        resultEntity.setData(outOrderService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/outorder/{id}", method = RequestMethod.DELETE)
    public ResultEntity<OutOrder> delete(@PathVariable("id") Integer id) {
        ResultEntity<OutOrder> resultEntity = new ResultEntity<OutOrder>();
        outOrderService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete outOrder id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/outorder", method = RequestMethod.POST)
    public ResultEntity<OutOrder> save(@RequestBody OutOrder outOrder) {
        ResultEntity<OutOrder> resultEntity = new ResultEntity<OutOrder>();
        outOrderService.save(outOrder);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/outorder", method = RequestMethod.GET)
    public ResponseEntity<OutOrder> getAll(OutOrder outOrderQuery, Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<OutOrder> outOrderList = outOrderService.getAll(outOrderQuery, pagination);
        
        ResponseEntity<OutOrder> responseObject = new ResponseEntity<OutOrder>();
        long total = ((Page<OutOrder>)outOrderList).getTotal();
        responseObject.setData(outOrderList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/outorder/exportFile", method = RequestMethod.POST)
    public ResultEntity<OutOrder> exportFile(@RequestBody OutOrder  outOrderQuery)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("{");
        sb.append("\"taskName\":\"购卡订单下载\",");
        sb.append("\"taskDesc\":\"购卡订单下载\",");
        sb.append("\"taskType\":\"2\",");
        sb.append("\"taskSource\":\"流量管理平台\",");
        sb.append("\"taskCreator\":\"admin\",");
        sb.append("\"taskCreatorId\":\"123456\",");
        
        JSONObject jsonObject = JSONObject.fromObject(outOrderQuery);
        System.out.println(jsonObject.toString());
        
        sb.append("\"taskExecParams\":{\"template\":\"order.xml\",\"kewWork\":"+ jsonObject.toString() +"}");
        sb.append("}");
        kafkaTemplate.sendDefault(sb.toString());
        
        ResultEntity<OutOrder> resultEntity = new ResultEntity<OutOrder>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/outorder/addExpressPic",method = RequestMethod.POST) 
    @ResponseBody
	public String addExpressPic(@RequestParam(value = "file") MultipartFile uploadFiles, String type) {
		String downUrl = null;
		HttpClient httpclient = new HttpClient();
		String fileName = uploadFiles.getOriginalFilename();
		PostMethod postMethod = null;
		
		try {
			String fileNamePrefix = fileName.substring(0, fileName.lastIndexOf("."));
			String fileNameSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			
			String encoder = URLEncoder.encode(fileNamePrefix, "utf-8");

//			String TIME_STR_FORMAT = "yyyyMMddHHmmss";
//			String currentTime = new SimpleDateFormat(TIME_STR_FORMAT).format(Calendar.getInstance().getTime());
			
			String saveFileName = encoder + fileNameSuffix;
			
			Long size = uploadFiles.getSize();
			String url = fcadminProperty.getImageUrl();//"http://192.168.3.153:8525/v1/tfscom"
			postMethod = new PostMethod(url + "?user=outorder&fname=" + saveFileName + "&fsize=" + size);
			List<Header> headers = new ArrayList<Header>();
			headers.add(new Header("Content-Length", String.valueOf(size)));
			httpclient.getHostConfiguration().getParams().setParameter("http.default-headers", headers);
			postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
		
		
			postMethod.setRequestBody(uploadFiles.getInputStream());

			// （4）执行postMethod
			int statusCode = httpclient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed:" + postMethod.getStatusLine());
			}

			InputStream inputStream = postMethod.getResponseBodyAsStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
			StringBuffer stringBuffer = new StringBuffer();
			String str = "";
			while ((str = br.readLine()) != null) {
				stringBuffer.append(str);
			}

			System.out.print(stringBuffer.toString());
			String reuslt = stringBuffer.toString();
			JSONObject json = JSONObject.fromObject(reuslt);
			String results = json.get("results").toString();
			JSONObject jsons = JSONObject.fromObject(results);
			downUrl = jsons.get("downUrl").toString();
		} catch (Exception e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
			System.out.println("Please check your provided http address!");
			e.printStackTrace();
		} finally {
			// 释放连接
			postMethod.releaseConnection();
		}
		return downUrl;
	}
    
    @RequestMapping(value = "/outorder/addDeliveryResult", method = RequestMethod.POST)
    public ResultEntity<OutOrder> addDeliveryResult(@RequestBody OutOrder outOrder) {
        ResultEntity<OutOrder> resultEntity = new ResultEntity<OutOrder>();
        outOrderService.addDeliveryResult(outOrder);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }
}
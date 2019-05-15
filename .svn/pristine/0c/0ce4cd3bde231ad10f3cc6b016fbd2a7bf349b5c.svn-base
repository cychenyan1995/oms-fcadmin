
package com.glsx.oms.fcadmin.biz.auth.nameauth.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.auth.nameauth.service.NameauthService;
import com.glsx.oms.fcadmin.biz.card.flowcard.service.FlowCardService;
import com.glsx.oms.fcadmin.framework.Contants;
import com.glsx.oms.fcadmin.framework.config.FcadminProperty;
import com.rop.utils.RopUtils;
import com.glsx.oms.fcadmin.biz.auth.nameauth.model.Nameauth;

/**
 * 流量卡实名认证 Controller
 */
@RestController
@RequestMapping(value = "/auth")
public class NameauthController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(NameauthController.class);

    @Autowired
    private NameauthService nameauthService;
    
    @Autowired FlowCardService flowCardService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    /**
	 * 静态变量配置类
	 */
	@Autowired
	private FcadminProperty fcadminProperty;
    
    @RequestMapping(value = "/nameauth/{id}", method = RequestMethod.GET)
    public ResultEntity<Nameauth> get(@PathVariable("id") Integer id) {
        ResultEntity<Nameauth> resultEntity = new ResultEntity<Nameauth>();
        resultEntity.setData(nameauthService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/nameauth/{id}", method = RequestMethod.DELETE)
    public ResultEntity<Nameauth> delete(@PathVariable("id") Integer id) {
        ResultEntity<Nameauth> resultEntity = new ResultEntity<Nameauth>();
        nameauthService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete nameauth id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/nameauth", method = RequestMethod.POST)
    public ResultEntity<Nameauth> save(@RequestBody Nameauth nameauth) {
        ResultEntity<Nameauth> resultEntity = new ResultEntity<Nameauth>();
        nameauthService.save(nameauth);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/nameauth", method = RequestMethod.GET)
    public ResponseEntity<Nameauth> getAll(Pagination pagination,Nameauth nameauth) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Nameauth> nameauthList = nameauthService.getAll(nameauth);
        
        ResponseEntity<Nameauth> responseObject = new ResponseEntity<Nameauth>();
        long total = ((Page<Nameauth>)nameauthList).getTotal();
        responseObject.setData(nameauthList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/approveAuth", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> update(@RequestBody String listJson)
    {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		String failReason = "";
		String status = "";
		String authNameStatus = "";
		try {
			JSONObject json = JSONObject.parseObject(listJson);
			// 实名认证ID
			Integer id = Integer.parseInt(String.valueOf(json.get("id")));
			// ICCID
			String iccid = String.valueOf(json.get("iccid"));
			// IMSI
			String imsi = String.valueOf(json.get("imsi"));
			// 网卡号
			String cardNo = String.valueOf(json.get("cardNo"));
			// OpenId
			String openId = String.valueOf(json.get("openId"));
			// 启用、停用操作
			Integer type = Integer.parseInt(String.valueOf(json.get("type")));

			Nameauth bean = new Nameauth();
			bean.setNameauthId(id);
			if (Contants.OPERATE_FLAG.equals(type)) {
				bean.setStatus(Contants.OPERATE_FLAG);
				status = "审核通过";
				failReason = "无";
				authNameStatus = "2";
			} else {
				failReason = String.valueOf(json.get("failReason"));
				bean.setFailReason(failReason);
				bean.setStatus(Contants.NO_OPERATE_FLAG);
				status = "审核不通过";
				authNameStatus = "3";
			}
			//修改实名认证信息
			nameauthService.updateAuth(bean);
			
			if (Contants.OPERATE_FLAG.equals(type)) {
				// 审核通过修改卡实名认证信息
				flowCardService.updateAuthName(imsi);
			}
			
			// 将审核结果通知服务侧
			String url = fcadminProperty.getAuthNoticeUrl();
	    	MultiValueMap<String, String> paraMap = new LinkedMultiValueMap<String, String>();
	    	paraMap.add("method", "glsx.opsmgrrop.api.authNameNotice");// <--指定方法名称
	    	paraMap.add("appKey", fcadminProperty.getAuthAppKey());
	    	paraMap.add("v", "1.0.0");
	    	paraMap.add("sessionId", "mockSessionId1");
	    	paraMap.add("messageFormat", "json");
	    	paraMap.add("timestamp", String.valueOf(new Date().getTime()));
	        paraMap.add("imsi",imsi);
	        paraMap.add("authNameStatus",authNameStatus);

	         //对请求参数列表进行签名
	         String sign = RopUtils.sign(paraMap.toSingleValueMap(), fcadminProperty.getAuthSign());
	         paraMap.add("sign", sign);
	         LOGGER.info("通知服务侧参数：" + paraMap);
	         String noticeResult = restTemplate.postForObject(
	        		 url, paraMap, String.class);
			LOGGER.info("通知服务侧返回结果：" + noticeResult);
			
			//添加推送公众号参数
	    	params.add("appKey", fcadminProperty.getWechatAppkey());
	    	params.add("method", "glsx.fcwechat.api.sendMsg");//<--指定方法名称
	    	params.add("v", "1.0.0");
	    	params.add("sessionId", "mockSessionId1");
	    	params.add("messageFormat", "json");
	        params.add("openId", openId);
	        params.add("imsi", imsi);
	        params.add("iccid", iccid);
	        params.add("cardNo", cardNo);
	        params.add("isauth", status);//审核状态(1成功 2失败)
	        params.add("fail_reason", failReason);//认证失败原因，认证成功可以不传
	        
			map.put("result", true);
		} catch (Exception e) {
			LOGGER.error("实名认证审核异常：", e);
			map.put("result", false);
		}
		
		//对请求参数列表进行签名
        String sign = RopUtils.sign(params.toSingleValueMap(), fcadminProperty.getWechatSign());
        params.add("sign", sign);
        LOGGER.info("实名认证推送消息参数：" + params);
        //推送消息到公众号
        String response = restTemplate.postForObject(
        		fcadminProperty.getWechatUrl(), params, String.class);
        LOGGER.info("实名认证推送消息返回结果：" + response);
		return map;
    }
    
    
    @RequestMapping(value = "/nameauth/exportFile", method = RequestMethod.POST)
    public ResultEntity<Nameauth> exportFile(@RequestBody Nameauth  nameauthQuery)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("{");
        sb.append("\"taskName\":\"下载\",");
        sb.append("\"taskDesc\":\"下载\",");
        sb.append("\"taskType\":\"0\",");
        sb.append("\"taskSource\":\"XXXX平台\",");
        sb.append("\"taskCreator\":\"admin\",");
        sb.append("\"taskCreatorId\":\"123456\",");
        sb.append("\"taskExecParams\":{\"template\":\"order.xml\",\"kewWork\":\"\"}");
        sb.append("}");
        kafkaTemplate.sendDefault(sb.toString());
        
        ResultEntity<Nameauth> resultEntity = new ResultEntity<Nameauth>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }



    
    
}
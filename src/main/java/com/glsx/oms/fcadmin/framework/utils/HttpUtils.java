package com.glsx.oms.fcadmin.framework.utils;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.glsx.oms.fcadmin.framework.config.FcadminProperty;
import com.rop.utils.RopUtils;

public class HttpUtils
{
    public final static Logger log = LoggerFactory.getLogger(HttpUtils.class);
    
    //实名认证审核不通过通知服务侧
    public String authNameNotice(String imsi,String authNameStatus,FcadminProperty fcadminProperty){
    	String url = fcadminProperty.getAuthNoticeUrl();
    	RestTemplate restTemplate = new RestTemplate();
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
         String retSrc = restTemplate.postForObject(
        		 url, paraMap, String.class);
    	log.info(retSrc);
        return retSrc;
    }
}

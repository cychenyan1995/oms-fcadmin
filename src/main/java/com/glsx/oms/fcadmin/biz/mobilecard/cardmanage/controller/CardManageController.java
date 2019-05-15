package com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;
import org.oreframework.commons.office.poi.zslin.utils.ExcelUtil;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultCode;
import org.oreframework.web.ui.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.glsx.oms.fcadmin.biz.card.optlog.model.Optlog;
import com.glsx.oms.fcadmin.biz.card.optlog.service.OptlogService;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.mapper.CardManageMapper;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.CardManage;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.FlowCardExport;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.FlowCardImport;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.service.CardManageService;
import com.glsx.oms.fcadmin.biz.op.op.model.Op;
import com.glsx.oms.fcadmin.biz.op.op.service.OpService;
import com.glsx.oms.fcadmin.biz.system.bean.ImportedResult;
import com.glsx.oms.fcadmin.framework.Contants;
import com.glsx.oms.fcadmin.framework.config.FcadminProperty;
import com.glsx.oms.fcadmin.framework.utils.ExcelUtils;
import com.glsx.oms.fcadmin.framework.utils.PatternUtil;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.entity.OrderFailList;
import com.glsx.oms.fcservice.api.entity.SetStatusList;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.FlowCardRequest;
import com.glsx.oms.fcservice.api.request.SetStatusRequest;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
/**
 * 流量平台移动卡信息 Controller
 */
@RestController
@RequestMapping("/cardmanage")
public class CardManageController {

	private final static Logger LOGGER = LoggerFactory.getLogger(CardManageMapper.class);
	
	@Autowired
	private CardManageService cardManageService;
	
	@Autowired
	private OpService opService;
	
    @Autowired
	private OptlogService optlogService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
	
	/**
	 * 静态变量配置类
	 */
	@Autowired
	private FcadminProperty fcadminProperty;
	
	// 如果用@Reference注解版本号不能去掉
	@Reference(version = "1.0.0")
	private OpsMgrManager opsMgrManager;
	
	/**
	 * 获取列表
	 * @param flowcardQuery
	 * @param pagination
	 * @param tableSort
	 * @return
	 * 2018年1月23日
	 * @author chenyan
	 */
	@RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ResponseEntity<CardManage> getAll(CardManage flowCardQuery,Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        
        long total = cardManageService.getCount(flowCardQuery);
        flowCardQuery.setSearchStart((pagination.getCurrentPage()-1)*pagination.getPageSize());
        flowCardQuery.setSearchSize(pagination.getPageSize());
        
        List<CardManage> cardManageList = cardManageService.getAll(flowCardQuery);
        
        ResponseEntity<CardManage> responseObject = new ResponseEntity<CardManage>();
        responseObject.setData(cardManageList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
	
	 /**
     * <br>
     * <b>功能：</b>模版下载<br>
     * <b>日期：</b> 2017-5-2<br>
     * 
     * @param response
     */
    @RequestMapping(value = "/downloadTemplate", method = RequestMethod.GET)
    public void downloadTemplate(String downloadType, HttpServletResponse response)
    {
        try
        {
            OutputStream os = response.getOutputStream();
            String str = "";
            String name = "";
            
            if ("1".equals(downloadType))
            {
                str = "流量卡入库模板.xlsx";
                name = "templates/mobilecard.xlsx";
            }
            
            response.setHeader("Content-Disposition", "attachment; filename=\""
                + new String(str.getBytes("GBK"), "iso8859-1") + "\"");
            response.setContentType("application/octet-stream;charset=UTF-8");
            ExcelUtils.downloadExcelTemplate(os, name);
            
        }
        catch (Exception e)
        {
            LOGGER.error("下载Excle模版出错：", e);
        }
        return;
    }
    
    /**
     * 
     * 导入卡
     */
    @RequestMapping(value = "/importCards", produces = { "application/json" }, method = RequestMethod.POST)
	public ResponseEntity<ImportedResult> importCards(@RequestParam(value = "file") MultipartFile files,
			HttpServletRequest request, HttpServletResponse response) {

		ResponseEntity<ImportedResult> responseEntity = new ResponseEntity<ImportedResult>();
		List<ImportedResult> importList = new ArrayList<ImportedResult>();
		ImportedResult importedResult = new ImportedResult();
		importedResult.setIsImported(0);
		importedResult.setCause("导入成功");

		// 这里可以支持多文件上传
		if (files != null) {
			BufferedOutputStream bw = null;
			try {
				long totalCount = 0;
				long successCount = 0;
				long failCount = 0;
				String fileName = files.getOriginalFilename();
				// 判断是否有文件且是否为图片文件
				if (fileName != null && !"".equalsIgnoreCase(fileName.trim())
						&& (FilenameUtils.getExtension(fileName.trim()).equals("xls")
								|| FilenameUtils.getExtension(fileName.trim()).equals("xlsx"))) {
					// 可以选择把文件保存到服务器,创建输出文件对象
					File outFile = new File(fcadminProperty.getUploadPath() + "/" + UUID.randomUUID().toString() + "."
							+ FilenameUtils.getExtension(fileName));

					// 文件到输出文件对象
					FileUtils.copyInputStreamToFile(files.getInputStream(), outFile);

					List<FlowCardImport> resultList = new ArrayList<FlowCardImport>();
					List<FlowCardExport> failList = new ArrayList<FlowCardExport>();

					// 获得输入流
					InputStream input = files.getInputStream();
					List<Object> list = null;
					try{
						list = ExcelUtil.getInstance().readExcel2Objs(input, FlowCardImport.class, 0, 0);
					}catch(Exception e){
						importedResult.setIsImported(3);
						importedResult.setCause("请使用有效模板导入数据");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}
					
					totalCount = list.size();
					
					// 查找运营商
			        Op op=new Op();
			        List<Op> opList = opService.getMobileOpList(op);
			        Map<String, String> opMap = new HashMap<String, String>();
			        for (Op opera : opList)
			        {
			        	opMap.put(String.valueOf(opera.getOpCode()), String.valueOf(opera.getOpId()));
			        }
			        
			        int count = 5000;
					int runSize = 0;
					if(totalCount % count == 0){
						runSize = (int)totalCount/count;
					}else{
						runSize = (int) ((totalCount / count)+1);
					}
					ExecutorService executor = Executors.newFixedThreadPool(runSize);
					CountDownLatch downLatch = new CountDownLatch(runSize);
					List<Object> newList = null ;
					
		            for (int i = 0; i < runSize; i++) {
		                if((i+1)==runSize){
		                    int startIndex = (i*count);;
		                    int endIndex = list.size();
		                    newList =list.subList(startIndex,endIndex);
		                }else{
		                    int startIndex = i*count;;
		                    int endIndex = (i+1)*count;
		                    newList =list.subList(startIndex,endIndex);
		                }

		                ExecupteHp hpRunnable = new ExecupteHp(newList,opMap,downLatch,
		                		resultList,failList);
		                executor.execute(hpRunnable);
		            }
		            //等待所有子线程执行完
		            downLatch.await();
		            //执行完关闭线程池
		            executor.shutdown();

					// 保存数据
					if (resultList != null && resultList.size() > 0) {
						importedResult.setIsImported(1);
						cardManageService.batchCreate(resultList);
						String[] iccidList=new String[resultList.size()];
						for(int i=0;i<resultList.size();i++){  
							iccidList[i]=(String)resultList.get(i).getIccid();  
				        }  
						//调用移动接口进行卡状态、流量数据并插入数据库
						LOGGER.info("入库参数：" + JSONObject.toJSON(iccidList));
						FlowCardRequest cardRequest = new FlowCardRequest();
						cardRequest.setIccids(iccidList);
						cardRequest.setConsumer("oms-fcadmin");
						cardRequest.setVersion("1.0.0");
						cardRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
						opsMgrManager.getOpCardInfo(cardRequest);
					}

					failCount = failList.size();
					successCount = totalCount - failCount;
					
					importedResult.setTotalCount(totalCount);
					importedResult.setSuccessCount(successCount);
					importedResult.setFailCount(failCount);
					
					if (failList != null && failList.size() > 0) {

						LOGGER.warn("反馈错误数据...");
						// 不需要模版导出
						String name = UUID.randomUUID().toString()+ "."	+ FilenameUtils.getExtension(fileName); 
						String url = fcadminProperty.getDownloadPath() + name; 
						ExcelUtil.getInstance().exportObj2Excel(url, failList, FlowCardExport.class);
						String reUrl = fcadminProperty.getDomain() + name;
						importedResult.setUrl(reUrl);
					}
				} else {
					importedResult.setCause("上传文件只支持.xls与.xlsx格式，请另存为兼容格式Excel再上传");
					LOGGER.warn("导出结束...");
					importedResult.setIsImported(2);
					importList.add(importedResult);
					responseEntity.setData(importList);
					return responseEntity;
				}
			} catch (Exception e) {
				LOGGER.warn("catch an exception in importCards",e);
			} finally {
				try {
					if (bw != null) {
						bw.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		importList.add(importedResult);
		responseEntity.setData(importList);
		return responseEntity;
	}

    /**
     * 对导入的数据进行校验
     * 
     * @param src
     * @param failList
     * @return
     * @throws Exception
     */
    class ExecupteHp implements Runnable {
    	
    	private List<Object> list;
		private List<FlowCardImport> resultList;
		private List<FlowCardExport> failList;
		private Map<String, String> opMap;
		private CountDownLatch downLatch;

		public ExecupteHp(List<Object> list,Map<String, String> opMap,CountDownLatch downLatch,
				List<FlowCardImport> resultList,List<FlowCardExport> failList) {
			this.list = list;
			this.opMap = opMap;
			this.failList = failList;
			this.resultList = resultList;
			this.downLatch = downLatch;
		}
		@Override
		public void run() {
			if (list == null || list.size() == 0) {
				downLatch.countDown();
	            return;
	        }
	    	
	        int count = 0;
	        List<String> cardNoKeys = new ArrayList<String>();
	        List<String> imsiKeys = new ArrayList<String>();
	        List<String> iccidKeys = new ArrayList<String>();
	        Map<String,FlowCardImport> cardMap = new HashMap<String,FlowCardImport>();
	        Map<String,String> imsiNoMap = new HashMap<String,String>();
	        Map<String,String> iccidMap = new HashMap<String,String>();
	        
	        for (Object bean : list) {
	        	count++;
	        	FlowCardImport flowCard = (FlowCardImport) bean;
	        	String cardNo =flowCard.getCardNo();//卡号
	        	String iccid = flowCard.getIccid();//ICCID
	        	String imsi = flowCard.getImsi();//IMSI
	        	String cardType = flowCard.getCardType();//卡类型
	        	String opId = flowCard.getOpId();//运营商编号
	        	
	        	FlowCardExport fail = new FlowCardExport();
	        	fail.setCardNo(cardNo);
	            fail.setIccid(iccid);
	            fail.setImsi(imsi);
	            fail.setCardType(String.valueOf((cardType)));
	            fail.setOpId(opId);
	            
	            boolean handler = false;
	            boolean add = true;
	            if (list.lastIndexOf(flowCard) == list.size() - 1)
	            {
	                handler = true;
	            }
	            
	            if(StringUtils.isEmpty(cardNo))
	            {
	            	fail.setCause("卡号必填!");
	            	failList.add(fail);
	            	add = false;
	            }else if (!PatternUtil.checkNumber(cardNo,"0+")) {
	            	fail.setCause("卡号只能为数字!");
	            	failList.add(fail);
	            	add = false;
	            }else if(cardNo.length() > 15 || cardNo.length() < 11 ){
	            	fail.setCause("卡号长度必须为11位到15位之间!");
	            	failList.add(fail);
	            	add = false;
	            }else if (cardMap.keySet().contains(flowCard.getCardNo())) {
	    	    	fail.setCause("导入文件中卡号重复!");
	    	    	failList.add(fail);
	    	    	add = false;
	    	    }else if(StringUtils.isEmpty(iccid)){
	    	    	fail.setCause("ICCID必填!");
	            	failList.add(fail);
	            	add = false;
	    	    }else if(iccid.length() != 20){
	    	    	fail.setCause("ICCID长度必须为20位!");
	            	failList.add(fail);
	            	add = false;
	    	    }else if(StringUtils.isEmpty(imsi)){
	    	    	fail.setCause("IMSI必填!");
	            	failList.add(fail);
	            	add = false;
	    	    }else if (!PatternUtil.checkNumber(imsi,"0+")) {
	            	fail.setCause("IMSI只能为数字!");
	            	failList.add(fail);
	            	add = false;
	            }else if(imsi.length() != 15){
	            	fail.setCause("IMSI长度必须为15位!");
	            	failList.add(fail);
	            	add = false;
	            }else if(StringUtils.isEmpty(String.valueOf(cardType))){
	    	    	fail.setCause("卡类型必填!");
	            	failList.add(fail);
	            	add = false;
	    	    }else if(StringUtils.isEmpty(String.valueOf(opId))){
	    	    	fail.setCause("运营商编号必填!");
	            	failList.add(fail);
	            	add = false;
	    	    }
	            
	            if (add)
	            {
	            	/**补充入库时需要的值**/  
	            	String operateId = opMap.get(opId.trim());
	    	    	flowCard.setCardNo(cardNo.trim());
	    	    	flowCard.setImsi(imsi.trim());
	    	    	flowCard.setIccid(iccid.trim());
	    	    	flowCard.setOperId(opId);
	    	    	if(!StringUtils.isEmpty(operateId)){
	    	    		flowCard.setOpId(operateId);
	    	    	}
	    	    	flowCard.setLastOperatorId(19180009);
	    	    	flowCard.setLastOperatorName("广联赛讯");
	                
	    	    	flowCard.setCardType(cardType);
					if (Contants.CARD_TYPE_TP.equals(cardType)) {
						flowCard.setType(Contants.CARD_TYPE_ONE);
					} else if (Contants.CARD_TYPE_DK.equals(cardType)) {
						flowCard.setType(Contants.CARD_TYPE_TWO);
					} else if (Contants.CARD_TYPE_SQ.equals(cardType)) {
						flowCard.setType(Contants.CARD_TYPE_THREE);
					}
	                cardMap.put(flowCard.getCardNo(), flowCard);
	                imsiNoMap.put(flowCard.getImsi(), flowCard.getCardNo());
	                iccidMap.put(flowCard.getIccid(), flowCard.getCardNo());
	                
	                cardNoKeys.add(flowCard.getCardNo());
	                imsiKeys.add(flowCard.getImsi());
	                iccidKeys.add(iccid);
	            }

		    	 if (count == 5000 || handler){
		    		List<FlowCardImport> list = new ArrayList<FlowCardImport>();
	        	    if(cardNoKeys.size() > 0){
	            	    list = cardManageService.getFlowcardListByCardNo(cardNoKeys);
	        	    	for(FlowCardImport card : list){
	        	    		FlowCardImport exitFlowcard = cardMap.get(card.getCardNo());
	        	    		
	        	    		if(exitFlowcard == null){
		    	    			continue;
		    	    		}
	        	    		
	        	    		fail = new FlowCardExport();
	        	    		fail.setCardNo(exitFlowcard.getCardNo());
	        	            fail.setIccid(exitFlowcard.getIccid());
	        	            fail.setImsi(exitFlowcard.getImsi());
	        	            fail.setCardType(exitFlowcard.getCardType());
	        	            fail.setOpId(exitFlowcard.getOperId());
	        	    		fail.setCause("卡号已存在!");
	        	    		failList.add(fail);
	        	    		
	        	    		cardMap.remove(card.getCardNo());
	        	    		continue;
	        	    	}
	        	    }
	    	    	
	    	    	if(imsiKeys.size() > 0){
		        	    list = cardManageService.getFlowcardListByImsi(imsiKeys);
		    	    	for(FlowCardImport card : list){
		    	    		String tempCardNo = imsiNoMap.get(card.getImsi());
		    	    		FlowCardImport exitFlowcard = cardMap.get(tempCardNo);
		    	    		
		    	    		if(exitFlowcard == null){
		    	    			continue;
		    	    		}
		    	    		
		    	    		fail = new FlowCardExport();
		    	    		fail.setCardNo(exitFlowcard.getCardNo());
	        	            fail.setIccid(exitFlowcard.getIccid());
	        	            fail.setImsi(exitFlowcard.getImsi());
	        	            fail.setCardType(exitFlowcard.getCardType());
	        	            fail.setOpId(exitFlowcard.getOperId());
		    	    		fail.setCause("IMSI已存在!");
		    	    		failList.add(fail);
		    	    		
		    	    		cardMap.remove(tempCardNo);
		    	    		continue;
		    	    	}
	    	    	}
	    	    	
	    	    	if(iccidKeys.size() > 0){
	            	    list = cardManageService.getFlowcardListByIccid(iccidKeys);
	        	    	for(FlowCardImport card : list){
	        	    		String tempCardNo = iccidMap.get(card.getIccid());
	        	    		FlowCardImport exitFlowcard = cardMap.get(tempCardNo);
	        	    		
	        	    		if(exitFlowcard == null){
	        	    			continue;
	        	    		}
	        	    		
	        	    		fail = new FlowCardExport();
	        	    		fail.setCardNo(exitFlowcard.getCardNo());
	        	            fail.setIccid(exitFlowcard.getIccid());
	        	            fail.setImsi(exitFlowcard.getImsi());
	        	            fail.setCardType(exitFlowcard.getCardType());
	        	            fail.setOpId(exitFlowcard.getOperId());
	        	    		fail.setCause("ICCID已存在!");
	        	    		failList.add(fail);
	        	    		
	        	    		cardMap.remove(tempCardNo);
	        	    		continue;
	        	    	}
	    	    	}
	    	    	
	    	    	Iterator iterator = cardMap.entrySet().iterator();
	    	    	List<String> removeList = new ArrayList<String>();
	    	    	while(iterator.hasNext()){
	    	    		Map.Entry entry = (Map.Entry)iterator.next();
	    	    		FlowCardImport flowCardImport = (FlowCardImport) entry.getValue();
	    	    		
	    	    		if (!opMap.containsValue(flowCardImport.getOpId()))
	    	    		{
	    	    			fail = new FlowCardExport();
	    	    			fail.setCardNo(flowCardImport.getCardNo());
	    	    			fail.setIccid(flowCardImport.getIccid());
	    	    			fail.setImsi(flowCardImport.getImsi());
	    	    			fail.setCardType(String.valueOf((flowCardImport.getCardType())));
	    	    			fail.setOpId(flowCardImport.getOpId());
	    	    			fail.setCause("运营商编号不存在!");
	    	    			failList.add(fail);
	    	    			
	    	    			removeList.add(flowCardImport.getCardNo());
	    	    			continue;
	    	    		}
	    	    	}
	    	    	
	    	    	if(removeList.size() > 0){
	    	    		for (int i = 0; i < removeList.size(); i++) {
	    	    			cardMap.remove(removeList.get(i));
						}
	    	    	}
	    	    	
	        	    count = 0;
	                list.clear();
	                list = null;
	                cardNoKeys=null;
	                imsiKeys=null;
	                iccidKeys=null;
	    	    }
	        }
	        resultList.addAll(new ArrayList<FlowCardImport>(cardMap.values()));
	        downLatch.countDown();
		}
    }
    
    
    @RequestMapping(value = "/stopCards")
    @ResponseBody
    public Map<String, Boolean> stopCards(@RequestBody String listJson)
    {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        try
        {
        	Gson gson=new Gson();
        	JSONObject json = JSONObject.parseObject(listJson);
            JSONArray list = json.getJSONArray("list");
            String description = String.valueOf(json.get("description"));
            List<SetStatusList> iccidList = gson.fromJson(list.toJSONString(), new TypeToken<List<SetStatusList>>(){}.getType());
            for (SetStatusList flowcard : iccidList) {
				flowcard.setReason(URLEncoder.encode(description, "UTF-8"));
			}
            SetStatusRequest statusRequest = new SetStatusRequest();
			statusRequest.setStatusList(iccidList);
			statusRequest.setConsumer("oms-fcadmin");
			statusRequest.setVersion("1.0.0");
			statusRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
			FlowResponse<List<OrderFailList>> retStr = opsMgrManager.setStatus(statusRequest);
			if ("1000".equals(retStr.getCode())) {
				map.put("result", true);
			} else {
				map.put("result", false);
			}
            
            Optlog log = new Optlog();
            log.setOptOp(1);//移动单卡启用操作记录
            log.setOptType("单卡停用");
            log.setOptReason(description);
            log.setOptDesc(StringUtils.join(retStr.getEntiy(),","));
            optlogService.insertLog(log);
        }
        catch (Exception e)
        {
        	LOGGER.error("单卡停用异常：", e);
            map.put("result", false);
        }
        return map;
    }
	
	@RequestMapping(value = "/openCards")
    @ResponseBody
    public Map<String, Boolean> openCards(@RequestBody String listJson)
    {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        try
        {
        	Gson gson=new Gson();
        	JSONObject json = JSONObject.parseObject(listJson);
            JSONArray list = json.getJSONArray("list");
            String description = String.valueOf(json.get("description"));
            List<SetStatusList> iccidList = gson.fromJson(list.toJSONString(), new TypeToken<List<SetStatusList>>(){}.getType());
            for (SetStatusList flowcard : iccidList) {
				flowcard.setReason(URLEncoder.encode(description, "UTF-8"));
			}
            SetStatusRequest statusRequest = new SetStatusRequest();
			statusRequest.setStatusList(iccidList);
			statusRequest.setConsumer("oms-fcadmin");
			statusRequest.setVersion("1.0.0");
			statusRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
			
			FlowResponse<List<OrderFailList>> retStr = opsMgrManager.setStatus(statusRequest);
			if ("1000".equals(retStr.getCode())) {
				map.put("result", true);
			} else {
				map.put("result", false);
			}
            
            Optlog log = new Optlog();
            log.setOptOp(1);
            log.setOptType("单卡启用");
            log.setOptReason(description);
            log.setOptDesc(StringUtils.join(retStr.getEntiy(),","));
            optlogService.insertLog(log);
        }
        catch (Exception e)
        {
        	LOGGER.error("单卡启用异常：", e);
            map.put("result", false);
        }
        return map;
    }
	
	//卡导出
	@RequestMapping(value = "/exportFile", method = RequestMethod.POST)
	public ResultEntity<CardManage> exportFile(@RequestBody CardManage cardManage){
		StringBuffer sb=new StringBuffer();
		Gson gson=new GsonBuilder().serializeNulls().create();
		String jsonObject=gson.toJson(cardManage);
		sb.append("{");
		sb.append("\"taskName\":\"移动片管理下载\",");
		sb.append("\"taskDesc\":\"移动卡片管理下载\",");
		sb.append("\"taskType\":\"8\",");
		sb.append("\"taskSource\":\""+Contants.SYSTEM_NAME+"\",");
		sb.append("\"taskCreator\":\"admin\",");
		sb.append("\"taskCreatorId\":\"123456\",");
		sb.append("\"taskExecParams\":{\"template\":\"flowcard.xml\",\"kewWork\":"+ jsonObject.toString() +"}");
        sb.append("}");
        kafkaTemplate.sendDefault(sb.toString());
        
        ResultEntity<CardManage> resultEntity = new ResultEntity<CardManage>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
				
	}
	//卡详情
	@RequestMapping(value = "/getCardDetail", method = RequestMethod.GET)
	@ResponseBody
	public ResultEntity<CardManage> getCardDetail(Integer cardId){
		ResultEntity<CardManage> resultEntity=new ResultEntity<CardManage>();
		resultEntity.setData(cardManageService.getCardDetail(cardId));
		resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
	}
}

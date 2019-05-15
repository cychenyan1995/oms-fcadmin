
package com.glsx.oms.fcadmin.biz.card.flowcard.controller;

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

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.oreframework.common.lang.date.DateFormatConstants;
import org.oreframework.common.lang.date.DateUtils;
import org.oreframework.commons.office.poi.zslin.utils.ExcelUtil;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.TableSort;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.card.flowcard.service.FlowCardService;
import com.glsx.oms.fcadmin.biz.card.optlog.model.Optlog;
import com.glsx.oms.fcadmin.biz.card.optlog.service.OptlogService;
import com.glsx.oms.fcadmin.biz.op.op.model.Op;
import com.glsx.oms.fcadmin.biz.op.op.service.OpService;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.service.FlowPackageService;
import com.glsx.oms.fcadmin.biz.system.bean.ImportedResult;
import com.glsx.oms.fcadmin.framework.Contants;
import com.glsx.oms.fcadmin.framework.config.FcadminProperty;
import com.glsx.oms.fcadmin.framework.utils.ExcelUtils;
import com.glsx.oms.fcadmin.framework.utils.PatternUtil;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.entity.FlowOrder;
import com.glsx.oms.fcservice.api.entity.OrderFailList;
import com.glsx.oms.fcservice.api.entity.SetStatusList;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.FlowCardRequest;
import com.glsx.oms.fcservice.api.request.FlowOrderRequest;
import com.glsx.oms.fcservice.api.request.SetStatusRequest;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import com.glsx.oms.fcadmin.biz.card.flowcard.model.BatchOpCardExport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.BatchOpCardImport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.BatchRenewExport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.BatchRenewImport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCard;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCardExport;
import com.glsx.oms.fcadmin.biz.card.flowcard.model.FlowCardImport;

/**
 * 流量平台中心卡信息 Controller
 */
@RestController
@RequestMapping(value = "/card")
public class FlowCardController{
    
	private final static Logger LOGGER = LoggerFactory.getLogger(FlowCardController.class);

    @Autowired
    private FlowCardService flowCardService;
    
    @Autowired
    private OptlogService optlogService;
    
    @Autowired
    private OpService opService;
    
    @Autowired
    private FlowPackageService flowPackageService;
    
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
	
    @RequestMapping(value = "/flowcard/{id}", method = RequestMethod.GET)
    public ResultEntity<FlowCard> get(@PathVariable("id") Integer id) {
        ResultEntity<FlowCard> resultEntity = new ResultEntity<FlowCard>();
        resultEntity.setData(flowCardService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowcard/{id}", method = RequestMethod.DELETE)
    public ResultEntity<FlowCard> delete(@PathVariable("id") Integer id) {
        ResultEntity<FlowCard> resultEntity = new ResultEntity<FlowCard>();
        flowCardService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete flowCard id{}",id);
        return resultEntity;
    }
    
    @RequestMapping(value = "/flowcard", method = RequestMethod.POST)
    public ResultEntity<FlowCard> save(@RequestBody FlowCard flowCard) {
        ResultEntity<FlowCard> resultEntity = new ResultEntity<FlowCard>();
        flowCardService.save(flowCard);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/flowcard", method = RequestMethod.GET)
    public ResponseEntity<FlowCard> getAll(FlowCard flowcardQuery,Pagination pagination,TableSort tableSort) {
    	flowcardQuery.setColumn(tableSort.getColumn());
		flowcardQuery.setSort(tableSort.getSort());
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        
        long total = flowCardService.getCount(flowcardQuery);
        flowcardQuery.setSearchStart((pagination.getCurrentPage()-1)*pagination.getPageSize());
        flowcardQuery.setSearchSize(pagination.getPageSize());
        
        List<FlowCard> flowCardList = flowCardService.getAll(flowcardQuery);
        
        ResponseEntity<FlowCard> responseObject = new ResponseEntity<FlowCard>();
        responseObject.setData(flowCardList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/getCardDetail", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getCardDetail(Integer cardId){
    	ResponseEntity<Map<String, Object>> responseObject=new ResponseEntity<>();
    	List<Map<String, Object>> mapList=new ArrayList<>();
		Map<String, Object> map=new HashMap<String,Object>();
		List<FlowPackage> planList = new ArrayList<FlowPackage>();
		List<FlowPackage> hisList = new ArrayList<FlowPackage>();
		List<FlowPackage> curList = new ArrayList<FlowPackage>();
		//获取卡的基本信息
    	FlowCard flowcard = flowCardService.getCardDetail(cardId);
    	map.put("flowcard", flowcard);
    	
    	//获取卡的计划套餐、当前套餐及历史套餐
    	List<FlowPackage> packageList = flowPackageService.getPackageByCardId(cardId);
    	if(null != packageList && packageList.size() > 0){
    		for(FlowPackage packages : packageList){
    			if(Contants.FLOW_UNIT_G.equals(packages.getFlowUnit())){
    				float totalFlow = packages.getTotalFlow()*1024;
    				packages.setTotalFlow(totalFlow);
    			}
    			if(packages.getPkStatus() == 0){
    				planList.add(packages);
    			}else if(packages.getPkStatus() == 1){
    				curList.add(packages);
    			}else if(packages.getPkStatus() == 2){
    				hisList.add(packages);
    			}
    		}
    	}
    	
    	map.put("planList", planList);
    	map.put("hisList", hisList);
    	map.put("curList", curList);
    	mapList.add(map);
    	responseObject.setData(mapList);
        return responseObject;
    }
    
    @RequestMapping(value = "/getCurPackage", method = RequestMethod.GET)
    @ResponseBody
    public ResultEntity<FlowCard> getCurPackage(String iccid) {
        ResultEntity<FlowCard> resultEntity = new ResultEntity<FlowCard>();
        resultEntity.setData(flowCardService.getCurPackage(iccid));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
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
                name = "templates/flowcard.xlsx";
            }
            else if ("2".equals(downloadType))
            {
                str = "停卡导入模板.xlsx";
                name = "templates/flowcardstop.xlsx";
            }
            else if ("3".equals(downloadType))
            {
                str = "启用卡导入模板.xlsx";
                name = "templates/flowcardopen.xlsx";
            }
            else if ("4".equals(downloadType))
            {
            	str = "续费导入模板.xlsx";
                name = "templates/flowcardrenew.xlsx";
            }
            else if ("5".equals(downloadType))
            {
            	str = "出库导入模板.xlsx";
                name = "templates/stockcard.xlsx";
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
					
					// 查找运营商
					Op op = new Op();
					List<Op> opList = opService.getOpList(op);
					Map<String, String> opMap = new HashMap<String, String>();
					for (Op opera : opList) {
						opMap.put(String.valueOf(opera.getOpCode()), String.valueOf(opera.getOpId()));
					}

					totalCount = list.size();
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
						flowCardService.batchCreate(resultList);
						String[] iccidList=new String[105];
						/*for(int i=0;i<resultList.size();i++){
							iccidList[i]=(String)resultList.get(i).getIccid();  
				        }  */
						//调用接口初始通信计划和资费计划
						int dd = 4720;
						for(int i =0;i<105;i++){
							String pre = "8986075119175074";
							dd+=1;
							pre = pre +dd;
							iccidList[i] = pre;
						}
						LOGGER.info("入库参数：" + JSONObject.toJSON(iccidList));
						FlowCardRequest cardRequest = new FlowCardRequest();
						cardRequest.setIccids(iccidList);
						cardRequest.setConsumer("oms-fcadmin");
						cardRequest.setVersion("1.0.0");
						cardRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
						opsMgrManager.getOpCardInfo(cardRequest);
					}
					
					importedResult.setSuccessCount(resultList.size());
					importedResult.setFailCount(failList.size());
					
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
     * 
     * 对导入的数据进行校验
     *
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
			Map<String, FlowCardImport> cardMap = new HashMap<String, FlowCardImport>();
			Map<String, String> imsiNoMap = new HashMap<String, String>();
			Map<String, String> iccidMap = new HashMap<String, String>();

			for (Object bean : list) {
				count++;

				FlowCardImport flowCard = (FlowCardImport) bean;

				String cardNo = flowCard.getCardNo();// 卡号
				String iccidn = flowCard.getIccidn();// ICCID
				String imsi = flowCard.getImsi();// IMSI
				String cardType = flowCard.getCardType();// 卡类型
				String opId = flowCard.getOpId();// 运营商编号

				FlowCardExport fail = new FlowCardExport();
				fail.setCardNo(cardNo);
				fail.setIccid(iccidn);
				fail.setImsi(imsi);
				fail.setCardType(String.valueOf((cardType)));
				fail.setOpId(opId);

				boolean handler = false;
				boolean add = true;
				if (list.lastIndexOf(flowCard) == list.size() - 1) {
					handler = true;
				}

				if (StringUtils.isEmpty(cardNo)) {
					fail.setCause("卡号必填!");
					failList.add(fail);
					add = false;
				} else if (!PatternUtil.checkNumber(cardNo, "0+")) {
					fail.setCause("卡号只能为数字!");
					failList.add(fail);
					add = false;
				} else if (cardNo.length() != 15) {
					fail.setCause("卡号长度必须为15位!");
					failList.add(fail);
					add = false;
				} else if (cardMap.keySet().contains(flowCard.getCardNo())) {
					fail.setCause("导入文件中卡号重复!");
					failList.add(fail);
					add = false;
				} else if (StringUtils.isEmpty(iccidn)) {
					fail.setCause("ICCID必填!");
					failList.add(fail);
					add = false;
				} else if (iccidn.length() != 20) {
					fail.setCause("ICCID长度必须为20位!");
					failList.add(fail);
					add = false;
				} else if (!PatternUtil.checkNumber(iccidn, "0+")) {
					fail.setCause("ICCID只能为数字!");
					failList.add(fail);
					add = false;
				} else if (StringUtils.isEmpty(imsi)) {
					fail.setCause("IMSI必填!");
					failList.add(fail);
					add = false;
				} else if (!PatternUtil.checkNumber(imsi, "0+")) {
					fail.setCause("IMSI只能为数字!");
					failList.add(fail);
					add = false;
				} else if (imsi.length() != 15) {
					fail.setCause("IMSI长度必须为15位!");
					failList.add(fail);
					add = false;
				} else if (StringUtils.isEmpty(String.valueOf(cardType))) {
					fail.setCause("卡类型必填!");
					failList.add(fail);
					add = false;
				} else if (StringUtils.isEmpty(String.valueOf(opId))) {
					fail.setCause("运营商编号必填!");
					failList.add(fail);
					add = false;
				}

				if (add) {
					/** 补充入库时需要的值 **/
					String operateId = opMap.get(opId.trim());
					flowCard.setCardNo(cardNo.trim());
					flowCard.setImsi(imsi.trim());
					flowCard.setIccidn(iccidn.trim());
					flowCard.setOperId(opId);
					String iccid = iccidn.trim().substring(0, 19);
					flowCard.setIccid(iccid);
					if (!StringUtils.isEmpty(operateId)) {
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

				if (count == 5000 || handler) {
					List<FlowCardImport> list = new ArrayList<FlowCardImport>();
					if (cardNoKeys.size() > 0) {
						list = flowCardService.getFlowcardListByCardNo(cardNoKeys);
						for (FlowCardImport card : list) {
							FlowCardImport exitFlowcard = cardMap.get(card.getCardNo());

							if (exitFlowcard == null) {
								continue;
							}

							fail = new FlowCardExport();
							fail.setCardNo(exitFlowcard.getCardNo());
							fail.setIccid(exitFlowcard.getIccidn());
							fail.setImsi(exitFlowcard.getImsi());
							fail.setCardType(exitFlowcard.getCardType());
							fail.setOpId(exitFlowcard.getOperId());
							fail.setCause("卡号已存在!");
							failList.add(fail);

							cardMap.remove(card.getCardNo());
							continue;
						}
					}

					if (imsiKeys.size() > 0) {
						list = flowCardService.getFlowcardListByImsi(imsiKeys);
						for (FlowCardImport card : list) {
							String tempCardNo = imsiNoMap.get(card.getImsi());
							FlowCardImport exitFlowcard = cardMap.get(tempCardNo);

							if (exitFlowcard == null) {
								continue;
							}

							fail = new FlowCardExport();
							fail.setCardNo(exitFlowcard.getCardNo());
							fail.setIccid(exitFlowcard.getIccidn());
							fail.setImsi(exitFlowcard.getImsi());
							fail.setCardType(exitFlowcard.getCardType());
							fail.setOpId(exitFlowcard.getOperId());
							fail.setCause("IMSI已存在!");
							failList.add(fail);

							cardMap.remove(tempCardNo);
							continue;
						}
					}

					if (iccidKeys.size() > 0) {
						list = flowCardService.getFlowcardListByIccid(iccidKeys);
						for (FlowCardImport card : list) {
							String tempCardNo = iccidMap.get(card.getIccid());
							FlowCardImport exitFlowcard = cardMap.get(tempCardNo);

							if (exitFlowcard == null) {
								continue;
							}

							fail = new FlowCardExport();
							fail.setCardNo(exitFlowcard.getCardNo());
							fail.setIccid(exitFlowcard.getIccidn());
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
					while (iterator.hasNext()) {
						Map.Entry entry = (Map.Entry) iterator.next();
						FlowCardImport flowCardImport = (FlowCardImport) entry.getValue();

						if (!opMap.containsValue(flowCardImport.getOpId())) {
							fail = new FlowCardExport();
							fail.setCardNo(flowCardImport.getCardNo());
							fail.setIccid(flowCardImport.getIccidn());
							fail.setImsi(flowCardImport.getImsi());
							fail.setCardType(String.valueOf((flowCardImport.getCardType())));
							fail.setOpId(flowCardImport.getOpId());
							fail.setCause("运营商编号不存在!");
							failList.add(fail);

							removeList.add(flowCardImport.getCardNo());
							continue;
						}
					}

					if (removeList.size() > 0) {
						for (int i = 0; i < removeList.size(); i++) {
							cardMap.remove(removeList.get(i));
						}
					}

					count = 0;
					list.clear();
					list = null;
					cardNoKeys = null;
					imsiKeys = null;
					iccidKeys = null;
				}
			}
			resultList.addAll(new ArrayList<FlowCardImport>(cardMap.values()));
			downLatch.countDown();
		}
	}
    
    /**
     * 批量导入(启用、停用)
     * 
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping(value = "batchImport")
    public ResponseEntity<ImportedResult> batchImport(HttpServletRequest request, HttpServletResponse response,
		@RequestParam(value = "file") MultipartFile files,String type)
    {
    	ResponseEntity<ImportedResult> responseEntity = new ResponseEntity<ImportedResult>();
		List<ImportedResult> importList = new ArrayList<ImportedResult>();
		ImportedResult importedResult = new ImportedResult();
		importedResult.setIsImported(0);
		importedResult.setCause("导入成功");
		
		String allowNum = fcadminProperty.getOpAllowNum();
		Integer opAllowNum = 0;
		if(!StringUtils.isEmpty(allowNum)){
			opAllowNum = Integer.parseInt(allowNum);
		}
        
        long totalCount = 0;
        long failCount = 0;
        long successCount = 0;
        
        // 这里可以支持多文件上传
		if (files != null) {
			BufferedOutputStream bw = null;
			try {
				String fileName = files.getOriginalFilename();
				// 判断是否有文件且是否为图片文件
				if (fileName != null && !"".equalsIgnoreCase(fileName.trim())
						&& (FilenameUtils.getExtension(fileName.trim()).equals("xls")
								|| FilenameUtils.getExtension(fileName.trim()).equals("xlsx"))) {
					// 可以选择把文件保存到服务器,创建输出文件对象
					File outFile = new File(fcadminProperty.getUploadPath() + UUID.randomUUID().toString() + "."
							+ FilenameUtils.getExtension(fileName));

					// 文件到输出文件对象
					FileUtils.copyInputStreamToFile(files.getInputStream(), outFile);

					List<BatchOpCardImport> resultList = new ArrayList<BatchOpCardImport>();
					List<BatchOpCardExport> failList = new ArrayList<BatchOpCardExport>();

					// 获得输入流
					InputStream input = files.getInputStream();
					List<Object> list = null;
					try{
						list = ExcelUtil.getInstance().readExcel2Objs(input, BatchOpCardImport.class, 0, 0);
					}catch(Exception e){
						importedResult.setIsImported(4);
						importedResult.setCause("请使用有效模板导入数据");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}
					totalCount = list.size();
					
					if (opAllowNum == 0) {
						opAllowNum = 2000;
					}
					if (totalCount > opAllowNum) {
						importedResult.setIsImported(3);
						importedResult.setCause("模版中最大允许导入" + opAllowNum + "条,请修改数据重新再导!");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}

					for (Object card : list) {
						BatchOpCardImport bean = (BatchOpCardImport) card;
						if(!StringUtils.isEmpty(bean.getIccid())){
							bean.setIccid(bean.getIccid().trim());
						}
						resultList.add(bean);
					}

					resultList = removeInvalidInfo(resultList, failList, type);
					
					failCount = failList.size();
		            successCount = totalCount - failCount;
		            
		            importedResult.setTotalCount(totalCount);
		            importedResult.setSuccessCount(successCount);
		            importedResult.setFailCount(failCount);
					
		            // 保存数据
					if (resultList != null && resultList.size() > 0) {
						String iccid = constrIccid(resultList);
						importedResult.setIsImported(1);
						importedResult.setMsg(iccid);
					}

					if (failList != null && failList.size() > 0) {

						LOGGER.warn("反馈错误数据...");
						// 不需要模版导出
						String name =  UUID.randomUUID().toString() + "."
								+ FilenameUtils.getExtension(fileName); 
						String url = fcadminProperty.getDownloadPath() + name; 
						ExcelUtil.getInstance().exportObj2Excel(url, failList, BatchOpCardExport.class);
						String reUrl = fcadminProperty.getDomain() + name;
						importedResult.setUrl(reUrl);
						LOGGER.warn("导入结束......,总数：" + totalCount + " 成功：" + successCount + " 失败：" + failCount);
					}
				} else {
					importedResult.setCause("上传文件只支持.xls与.xlsx格式，请另存为兼容格式Excel再上传");
					importedResult.setIsImported(2);
					importList.add(importedResult);
					responseEntity.setData(importList);
					LOGGER.warn("导出结束...");
					return responseEntity;
				}
				
			} catch (Exception e) {
				LOGGER.warn("catch an exception in batchImport", e);
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
     * @param List 拼接成String 返回
     * @return String
     */
    public String constrIccid(List<BatchOpCardImport> list)
    {
        
        if (null == list || list.size() < 0)
        {
            
            return null;
        }
        StringBuilder iccid = new StringBuilder();
        for (int i = 0; i < list.size(); i++)
        {
            
            if (i == list.size() - 1)
            {
                iccid.append(list.get(i).getIccid() + "");
                break;
            }
            iccid.append(list.get(i).getIccid() + ",");
            
        }
        
        return iccid.toString();
        
    }
    
    /**
     * 移除非法的内容
     */
    private List<BatchOpCardImport> removeInvalidInfo(List<BatchOpCardImport> src, List<BatchOpCardExport> failList, String type)
        throws Exception
    {
        if (src == null || src.size() == 0)
        {
            return null;
        }
        
        List<BatchOpCardImport> newList = new ArrayList<BatchOpCardImport>();
        
        int z = 0;
        List<String> checkIccid = new ArrayList<String>();
        Map<String, BatchOpCardImport> iccidMap = new HashMap<String, BatchOpCardImport>();
        
        for (int i = 0; i < src.size(); i++)
        {
            z++;
            BatchOpCardImport flowCard = src.get(i);
            BatchOpCardExport fail = new BatchOpCardExport();
            String iccid = flowCard.getIccid();
            fail.setIccid(iccid);
            
            boolean handler = false;
            boolean add = true;
            if (src.lastIndexOf(flowCard) == src.size() - 1)
            {
                handler = true;
            }
            
            if (StringUtils.isEmpty(iccid))
            {
                fail.setCause("ICCID必填!");
                fail.setIccid(iccid);
                failList.add(fail);
                add = false;
            }
            else if (iccid.length() != 19)
            {
                fail.setCause("ICCID长度必须为19位!");
                fail.setIccid(iccid);
                failList.add(fail);
                add = false;
            }
            else
            {
                boolean chkIccid = checkIccid.contains(iccid);
                if (chkIccid)
                {
                    fail.setIccid(iccid);
                    fail.setCause("导入文件中ICCID重复!"); 
                    failList.add(fail);
                    add = false;
                }
            }
            
            if (add)
            {
                checkIccid.add(iccid);
            }
            if (z == 2000 || handler)
            {
                List<BatchOpCardImport> list = new ArrayList<BatchOpCardImport>();
                if (checkIccid.size() > 0)
                {
                    list = flowCardService.getFlowcardList(checkIccid);
                    
                    for (BatchOpCardImport fc : list)
                    {
                        iccidMap.put(fc.getIccid(), fc);
                    }
                    
                    for (String cNo : checkIccid)
                    {
                    	BatchOpCardImport result = iccidMap.get(cNo);
                        if (null == result)
                        {
                        	fail = new BatchOpCardExport();
                        	fail.setIccid(cNo);
                        	fail.setCause("ICCID不存在!");
                        	failList.add(fail);
                            continue;
                        }
                       /* else
                        {
                        	if(Contants.OPERATE_OPEN.equals(type)){
                        		if(Contants.CARD_TEST.equals(result.getStatus()) 
                        			|| Contants.CARD_ACTIVE.equals(result.getStatus())
                        			|| Contants.CARD_CANCEL.equals(result.getStatus())){
                        			fail = new BatchOpCardExport();
                                	fail.setIccid(cNo);
                                	fail.setCause("卡状态为可测试、已激活、已销卡不可启用!");
                                	failList.add(fail);
                                    continue;
                        		}else{
                        			newList.add(result);
                        		}
                        		
                        	}else if(Contants.OPERATE_STOP.equals(type)){
                        		if(Contants.CARD_TEST.equals(result.getStatus()) 
                            			|| Contants.CARD_REPERTORY.equals(result.getStatus())
                            			|| Contants.CARD_BEACTIVE.equals(result.getStatus())
                            			|| Contants.CARD_STOP.equals(result.getStatus())
                            			|| Contants.CARD_CANCEL.equals(result.getStatus())){
                        			fail = new BatchOpCardExport();
                                	fail.setIccid(cNo);
                                	fail.setCause("卡状态为库存、可测试、可激活、已停用、已销卡不可停用!");
                                	failList.add(fail);
                                    continue;
                            	}else{
                            		newList.add(result);
                            	}
                        	}
                        }*/
                    }
                }
                z = 0;
                list.clear();
                list = null;
                iccidMap.clear();
            }
        }
        return newList;
    }
    
    /**
     * 批量启用停用卡
     * @param listJson
     * @return
     */
    @RequestMapping(value = "/batchOpCards")
    @ResponseBody
    public Map<String, Boolean> batchOpCards(@RequestBody String listJson)
    {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		try {
			JSONObject json = JSONObject.parseObject(listJson);
			// ICCID串
			String list = String.valueOf(json.get("list"));
			// 启用、停用原因
			String description = String.valueOf(json.get("description"));
			
			// 启用、停用操作
			String type = String.valueOf(json.get("type"));

			List<SetStatusList> iccidList = new ArrayList<SetStatusList>();
			boolean flg = list.contains(",");

			if (Contants.OPERATE_OPEN.equals(type)) {
				//启用
				if (flg) {
					String[] iccidn = list.split(",");
					for (int i = 0; i < iccidn.length; i++) {
						SetStatusList bean = new SetStatusList();
						bean.setIccid(iccidn[i]);
						bean.setOp(Contants.OPEN_CARD);
						bean.setReason(URLEncoder.encode(description, "UTF-8"));
						iccidList.add(bean);
					}
				} else {
					SetStatusList bean = new SetStatusList();
					bean.setIccid(list);
					bean.setOp(Contants.OPEN_CARD);
					bean.setReason(URLEncoder.encode(description, "UTF-8"));
					iccidList.add(bean);
				}
			} else if (Contants.OPERATE_STOP.equals(type)) {
				//停用
				if (flg) {
					String[] iccidn = list.split(",");
					for (int i = 0; i < iccidn.length; i++) {
						SetStatusList bean = new SetStatusList();
						bean.setIccid(iccidn[i]);
						bean.setOp(Contants.STOP_CARD);
						bean.setReason(URLEncoder.encode(description, "UTF-8"));
						iccidList.add(bean);
					}
				} else {
					SetStatusList bean = new SetStatusList();
					bean.setIccid(list);
					bean.setOp(Contants.STOP_CARD);
					bean.setReason(URLEncoder.encode(description, "UTF-8"));
					iccidList.add(bean);
				}
			}

			List<SetStatusList> iccids = new ArrayList<SetStatusList>();
			int z = 0;
			for (SetStatusList flowCard : iccidList) {
				iccids.add(flowCard);
				z++;
				boolean handler = false;
				if (iccidList.lastIndexOf(flowCard) == iccidList.size() - 1) {
					handler = true;
				}
				
				if (z == 50 || handler) {
					SetStatusRequest statusRequest = new SetStatusRequest();
					statusRequest.setStatusList(iccidList);
					statusRequest.setConsumer("oms-fcadmin");
					statusRequest.setVersion("1.0.0");
					statusRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
					FlowResponse<List<OrderFailList>> retStr = opsMgrManager.setStatus(statusRequest);
					Optlog log = new Optlog();

					if ("1000".equals(retStr.getCode())) {
						map.put("result", true);
					} else {
						map.put("result", false);
					}

					if (Contants.OPERATE_OPEN.equals(type)) {
						log.setOptType("批量启用");
					} else {
						log.setOptType("批量停用");
					}
					log.setOptDesc(StringUtils.join(retStr.getEntiy(),","));
					log.setOptReason(description);

					optlogService.insertLog(log);
					z = 0;
					iccids.clear();
				}
			}
		} catch (Exception e) {
			LOGGER.error("批量操作卡异常：", e);
			map.put("result", false);
		}
		return map;
    }
    
    /**
     * 批量导入(续费)
     * 
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping(value = "batchRenewImport")
    public ResponseEntity<ImportedResult> batchRenewImport(HttpServletRequest request, HttpServletResponse response,
		@RequestParam(value = "file") MultipartFile files,Integer packageType,Integer relationId)
    {
    	ResponseEntity<ImportedResult> responseEntity = new ResponseEntity<ImportedResult>();
		List<ImportedResult> importList = new ArrayList<ImportedResult>();
		ImportedResult importedResult = new ImportedResult();
		importedResult.setIsImported(0);
		importedResult.setCause("导入成功!");
		
		String allowNum = fcadminProperty.getOpAllowNum();
		Integer opAllowNum = 0;
		if(!StringUtils.isEmpty(allowNum)){
			opAllowNum = Integer.parseInt(allowNum);
		}
        
        long totalCount = 0;
        long failCount = 0;
        long successCount = 0;
        
        // 这里可以支持多文件上传
		if (files != null) {
			BufferedOutputStream bw = null;
			try {
				String fileName = files.getOriginalFilename();
				// 判断是否有文件且是否为图片文件
				if (fileName != null && !"".equalsIgnoreCase(fileName.trim())
						&& (FilenameUtils.getExtension(fileName.trim()).equals("xls")
								|| FilenameUtils.getExtension(fileName.trim()).equals("xlsx"))) {
					// 可以选择把文件保存到服务器,创建输出文件对象
					File outFile = new File(fcadminProperty.getUploadPath() + UUID.randomUUID().toString() + "."
							+ FilenameUtils.getExtension(fileName));

					// 文件到输出文件对象
					FileUtils.copyInputStreamToFile(files.getInputStream(), outFile);

					List<BatchRenewImport> resultList = new ArrayList<BatchRenewImport>();
					List<BatchRenewExport> failList = new ArrayList<BatchRenewExport>();

					// 获得输入流
					InputStream input = files.getInputStream();
					List<Object> list = null;
					try{
						list = ExcelUtil.getInstance().readExcel2Objs(input, BatchRenewImport.class, 0, 0);
					}catch(Exception e){
						importedResult.setIsImported(4);
						importedResult.setCause("请使用有效模板导入数据，");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}
					totalCount = list.size();
					
					if (opAllowNum == 0) {
						opAllowNum = 2000;
					}
					if (totalCount > opAllowNum) {
						importedResult.setIsImported(3);
						importedResult.setCause("模版中最大允许导入" + opAllowNum + "条,请修改数据重新再导!");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}

					for (Object card : list) {
						BatchRenewImport bean = (BatchRenewImport) card;
						if(!StringUtils.isEmpty(bean.getIccid())){
							bean.setIccid(bean.getIccid().trim());
						}
						resultList.add(bean);
					}

					String orderNo = removeInvalidRenewInfo(resultList, failList, packageType, relationId);
					
					if(StringUtils.isNotEmpty(orderNo)){
						importedResult.setIsImported(0);
						successCount = resultList.size();
						importedResult.setCause("导入成功"+successCount + "条，");
					}else{
						importedResult.setIsImported(1);
						importedResult.setCause("操作失败：列表中存在无效卡，请下载列表查看详情！");
					}
					
					failCount = failList.size();
		            
		            importedResult.setTotalCount(totalCount);
		            importedResult.setSuccessCount(successCount);
		            importedResult.setFailCount(failCount);
		            importedResult.setMsg(orderNo);

					if (failList != null && failList.size() > 0) {

						LOGGER.warn("反馈错误数据...");
						// 不需要模版导出
						String name = UUID.randomUUID().toString() + "."
								+ FilenameUtils.getExtension(fileName); 
						String url = fcadminProperty.getDownloadPath() + name;
						ExcelUtil.getInstance().exportObj2Excel(url, failList, BatchRenewExport.class);
						String reUrl = fcadminProperty.getDomain() + name;
						importedResult.setUrl(reUrl);
						
						LOGGER.warn("导入结束......,总数：" + totalCount + " 成功：" + successCount + " 失败：" + failCount);
					}
				} else {
					importedResult.setCause("上传文件只支持.xls与.xlsx格式，请另存为兼容格式Excel再上传。");
					importedResult.setIsImported(2);
					importList.add(importedResult);
					responseEntity.setData(importList);
					LOGGER.warn("导出结束...");
					return responseEntity;
				}
				
			} catch (Exception e) {
				LOGGER.warn("catch an exception in batchRenewImport",e);
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
     * 移除非法的内容
     */
    private String removeInvalidRenewInfo(List<BatchRenewImport> src, List<BatchRenewExport> failList,
    		Integer packageType,Integer relationId)
        throws Exception
    {
        if (src == null || src.size() == 0)
        {
            return null;
        }
        
        String[] iccidList = new String[src.size()];
        for (int i = 0; i < src.size(); i++) {
            BatchRenewImport flowCard = src.get(i);
            iccidList[i] = flowCard.getIccid();
		}
        
        //创建订单
        FlowOrderRequest orderRequest = new FlowOrderRequest();
        orderRequest.setIccidList(iccidList);
        orderRequest.setFlowPkgType(packageType);
        orderRequest.setRelationId(relationId);
        orderRequest.setOrderfrom(1);
        orderRequest.setConsumer("oms-fcadmin");
        orderRequest.setVersion("1.0.0");
        orderRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
		FlowResponse<FlowOrder> retResult = opsMgrManager.submitOrder(orderRequest);
		FlowOrder flowOrder = retResult.getEntiy();
		String orderNo = "";
        if ("1000".equals(retResult.getCode()))
        {
        	orderNo = flowOrder.getOrderNo();
        }else{
             List<OrderFailList> orderList = flowOrder.getFailList();
             for (int i = 0; i < orderList.size(); i++) {
            	 OrderFailList orderFail = orderList.get(i);
            	 BatchRenewExport fail = new BatchRenewExport();
                 fail.setIccid(orderFail.getIccid());
                 fail.setCause(orderFail.getMsg());
                 failList.add(fail);
			}
        }
        LOGGER.info("续费生成订单编号：" + orderNo);
        return orderNo;
    }
    
    /**
     * 
     */
    @RequestMapping(value = "/batchOpRenewCards")
    @ResponseBody
    public Map<String, Boolean> batchOpRenewCards(@RequestBody String listJson)
    {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String msg = "";
		try {
			
			JSONObject json = JSONObject.parseObject(listJson);
			String orderNo = String.valueOf(json.get("orderNo"));
			LOGGER.info("批量续费获取订单编号：" + orderNo);
			//执行订单
			if(StringUtils.isNotEmpty(orderNo)){
				FlowOrderRequest orderRequest = new FlowOrderRequest();
				orderRequest.setOrderNo(orderNo);
				orderRequest.setSource("流量管理平台");
				orderRequest.setConsumer("oms-fcadmin");
				orderRequest.setVersion("1.0.0");
				orderRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
				FlowResponse<?> retStr = opsMgrManager.processOrder(orderRequest);
	            if("1000".equals(retStr.getCode())){
	            	map.put("result", true);
	            }else{
	            	map.put("result", false);
	            	msg = retStr.getMessage();
	            }
			}else{
				msg = "生成订单号为空";
				LOGGER.error("获取订单号为空 batchOpRenewCards {}",orderNo);
				map.put("result", false);
			}
			
			Optlog log = new Optlog();
            log.setOptType("批量续费");
            log.setOptDesc(msg);
            log.setOptReason(orderNo);
            optlogService.insertLog(log);
		} catch (Exception e) {
			LOGGER.error("批量续费异常：", e);
			map.put("result", false);
		}
		return map;
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
            statusRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
            statusRequest.setVersion("1.0.0");
			
			FlowResponse<List<OrderFailList>> retStr = opsMgrManager.setStatus(statusRequest);
			if ("1000".equals(retStr.getCode())) {
				map.put("result", true);
			} else {
				map.put("result", false);
			}
            
            Optlog log = new Optlog();
            log.setOptOp(3);
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
            log.setOptOp(3);
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
	
	@RequestMapping(value = "/getValidFlowPkg")
	@ResponseBody
    public ResponseEntity<com.glsx.oms.fcservice.api.entity.FlowPackage> getValidFlowPkg(@RequestBody String listJson) {
        ResponseEntity<com.glsx.oms.fcservice.api.entity.FlowPackage> responseObject = new ResponseEntity<com.glsx.oms.fcservice.api.entity.FlowPackage>();
        List<com.glsx.oms.fcservice.api.entity.FlowPackage> list = new ArrayList<com.glsx.oms.fcservice.api.entity.FlowPackage>();
        try{
        	JSONObject json = JSONObject.parseObject(listJson);
    		String iccid = String.valueOf(json.get("iccid"));
    		Integer flowpkgType =Integer.parseInt((json.get("flowpkgType").toString()));
    		FlowCardRequest cardRequest = new FlowCardRequest();
    		cardRequest.setIccid(iccid);
    		cardRequest.setPackageType(flowpkgType);
    		cardRequest.setConsumer("oms-fcadmin");
    		cardRequest.setVersion("1.0.0");
    		cardRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
    		FlowResponse<List<com.glsx.oms.fcservice.api.entity.FlowPackage>> retResult = opsMgrManager.getValidFlowPkg(cardRequest);
    		if("1000".equals(retResult.getCode())){
    			list = retResult.getEntiy();
    		}
        }catch(Exception e)
        {
        	LOGGER.error("获取可续费套餐异常：", e);
        }
        responseObject.setData(list);
        return responseObject;
    }
	
	@RequestMapping(value = "/renewCards")
    @ResponseBody
    public Map<String, Boolean> renewCards(@RequestBody String listJson)
    {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String msg = "";
		try {
			JSONObject json = JSONObject.parseObject(listJson);
			String[] iccidList = new String[] { String.valueOf(json.get("iccid"))};
    		Integer packageType =Integer.parseInt((json.get("packageType").toString()));
    		Integer relationId =Integer.parseInt((json.get("relationId").toString()));
			
    		FlowOrderRequest orderRequest = new FlowOrderRequest();
    	    orderRequest.setIccidList(iccidList);
    	    orderRequest.setFlowPkgType(packageType);
    	    orderRequest.setRelationId(relationId);
    	    orderRequest.setOrderfrom(1);
    	    orderRequest.setConsumer("oms-fcadmin");
    	    orderRequest.setVersion("1.0.0");
    	    orderRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
    	    // 创建订单
    		FlowResponse<FlowOrder> retResult = opsMgrManager.submitOrder(orderRequest);
    		FlowOrder flowOrder = retResult.getEntiy();
			String orderNo = "";
	        if ("1000".equals(retResult.getCode()))
	        {
	        	orderNo = flowOrder.getOrderNo();
	        }
			//执行订单
			if(StringUtils.isNotEmpty(orderNo)){
				FlowOrderRequest orderBean = new FlowOrderRequest();
				orderBean.setOrderNo(orderNo);
				orderBean.setSource("流量管理平台");
				orderBean.setConsumer("oms-fcadmin");
				orderBean.setVersion("1.0.0");
				orderBean.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
				FlowResponse<?> retStr = opsMgrManager.processOrder(orderBean);
				if("1000".equals(retStr.getCode())){
	            	map.put("result", true);
	            }else{
	            	map.put("result", false);
	            	msg = retStr.getMessage();
	            }
			}else{
				msg = "生成订单号为空";
				LOGGER.error("生成订单号为空 submitOrder {}",orderNo);
				map.put("result", false);
			}
			
			Optlog log = new Optlog();
            log.setOptType("单卡续费");
            log.setOptDesc(msg);
            log.setOptReason(orderNo);
            optlogService.insertLog(log);
		} catch (Exception e) {
			LOGGER.error("单卡续费异常：", e);
			map.put("result", false);
		}
		return map;
    }
	
    @RequestMapping(value = "/flowcard/exportFile", method = RequestMethod.POST)
    public ResultEntity<FlowCard> exportFile(@RequestBody FlowCard  flowCardQuery)
    {
        StringBuffer sb = new StringBuffer();
        Gson gson = new GsonBuilder().serializeNulls().create();
    	String jsonObject = gson.toJson(flowCardQuery);
        
        sb.append("{");
        sb.append("\"taskName\":\"联通卡片管理下载\",");
        sb.append("\"taskDesc\":\"联通卡片管理下载\",");
        sb.append("\"taskType\":\"1\",");
        sb.append("\"taskSource\":\""+Contants.SYSTEM_NAME+"\",");
        sb.append("\"taskCreator\":\"admin\",");
        sb.append("\"taskCreatorId\":\"123456\",");
        sb.append("\"taskExecParams\":{\"template\":\"flowcard.xml\",\"kewWork\":"+ jsonObject.toString() +"}");
        sb.append("}");
        kafkaTemplate.sendDefault(sb.toString());
        
        ResultEntity<FlowCard> resultEntity = new ResultEntity<FlowCard>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }

	public static void main(String[] args)
	{
		Integer count = 50;
		int preSize = 0;
		Integer totalNum = 105;
		if(totalNum % count == 0){
			preSize = (int) (totalNum / count);
		}else{
			preSize = (int) ((totalNum / count)+1);
		}
	}
}

package com.glsx.oms.fcadmin.biz.mobilecard.stockcard.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
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
import org.springframework.web.bind.annotation.RequestBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
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
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.card.lifecycle.model.StockCard;
import com.glsx.oms.fcadmin.biz.card.optlog.model.Optlog;
import com.glsx.oms.fcadmin.biz.card.optlog.service.OptlogService;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.model.FlowCardImport;
import com.glsx.oms.fcadmin.biz.mobilecard.cardmanage.service.CardManageService;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.LifeCycle;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.StockCardExport;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.model.StockCardImport;
import com.glsx.oms.fcadmin.biz.mobilecard.stockcard.service.StockCardService;
import com.glsx.oms.fcadmin.biz.order.outorder.model.OutOrder;
import com.glsx.oms.fcadmin.biz.order.outorder.service.OutOrderService;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.model.FlowPackage;
import com.glsx.oms.fcadmin.biz.pkg.flowpackage.service.FlowPackageService;
import com.glsx.oms.fcadmin.biz.sp.sp.model.Sp;
import com.glsx.oms.fcadmin.biz.sp.sp.service.SpService;
import com.glsx.oms.fcadmin.biz.system.bean.ImportedResult;
import com.glsx.oms.fcadmin.framework.Contants;
import com.glsx.oms.fcadmin.framework.config.FcadminProperty;
import com.glsx.oms.fcservice.api.core.FlowResponse;
import com.glsx.oms.fcservice.api.entity.OpenPackage;
import com.glsx.oms.fcservice.api.entity.OrderFailList;
import com.glsx.oms.fcservice.api.manager.OpsMgrManager;
import com.glsx.oms.fcservice.api.request.OpenPkgRequest;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 *  Controller
 */
@RestController
@RequestMapping(value = "/stock")
public class StockCardController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(StockCardController.class);

    @Autowired
    private StockCardService stockCardService;
    
    @Autowired
    private CardManageService cardManageService;
    
    @Autowired
    private SpService spService;
    
    @Autowired
    private FlowPackageService flowPackageService;
    
    @Autowired
    private OutOrderService outOrderService;
    
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
    

    @RequestMapping(value = "/lifecycle", method = RequestMethod.GET)
    public ResponseEntity<LifeCycle> getAll(Pagination pagination,LifeCycle lifeCycleQuery) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<LifeCycle> stockCardList = stockCardService.getAll(lifeCycleQuery);
        
        ResponseEntity<LifeCycle> responseObject = new ResponseEntity<LifeCycle>();
        long total = ((Page<LifeCycle>)stockCardList).getTotal();
        responseObject.setData(stockCardList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    @RequestMapping(value = "/lifecycle/exportFile", method = RequestMethod.POST)
    public ResultEntity<StockCard> exportFile(@RequestBody LifeCycle  lifeCycleQuery)
    {
        Gson gson = new GsonBuilder().serializeNulls().create();
    	String jsonObject = gson.toJson(lifeCycleQuery);
    	
        StringBuffer sb = new StringBuffer();
        sb.append("{");
        sb.append("\"taskName\":\"库存卡列表下载\",");
        sb.append("\"taskDesc\":\"库存卡列表下载\",");
        sb.append("\"taskType\":\"9\",");
        sb.append("\"taskSource\":\""+Contants.SYSTEM_NAME+"\",");
        sb.append("\"taskCreator\":\"admin\",");
        sb.append("\"taskCreatorId\":\"123456\",");
        sb.append("\"taskExecParams\":{\"template\":\"mobilestockcard.xml\",\"kewWork\":"+ jsonObject.toString() +"}");
        sb.append("}");
        kafkaTemplate.sendDefault(sb.toString());
        
        ResultEntity<StockCard> resultEntity = new ResultEntity<StockCard>();
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("发送成功!");
        return resultEntity;
    }

    /**
     * 卡出库
     * 
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping(value = "/lifecycle/importStockcard")
    public ResponseEntity<ImportedResult> importStockcard(HttpServletRequest request, HttpServletResponse response,
		@RequestParam(value = "file") MultipartFile files)
    {
    	Random random = new Random();  
    	ResponseEntity<ImportedResult> responseEntity = new ResponseEntity<ImportedResult>();
		List<ImportedResult> importList = new ArrayList<ImportedResult>();
		ImportedResult importedResult = new ImportedResult();
		importedResult.setIsImported(0);
		importedResult.setCause("导入成功");
		String opKey = "";
		
		String allowNum = fcadminProperty.getStockAllowNum();
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

					List<StockCardImport> cardList = new ArrayList<StockCardImport>();
					List<StockCardImport> resultList = new ArrayList<StockCardImport>();
					List<StockCardExport> failList = new ArrayList<StockCardExport>();
					HashSet<String> set =new HashSet<String>();

					// 获得输入流
					InputStream input = files.getInputStream();
					List<Object> list = null;
					try{
						list = ExcelUtil.getInstance().readExcel2Objs(input, StockCardImport.class, 0, 0);
						opKey = System.nanoTime() + "_" + random.nextInt(9)+1;
					}catch(Exception e){
						importedResult.setIsImported(3);
						importedResult.setCause("导入失败");
						importedResult.setMsg("文件模板错误，请下载模板重新再导!");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}
					
					totalCount = list.size();
					
					if (opAllowNum == 0) {
						opAllowNum = 10000;
					}
					if (totalCount > opAllowNum) {
						importedResult.setIsImported(3);
						importedResult.setCause("导入失败");
						importedResult.setMsg("模版中最大允许导入" + opAllowNum + "条,请修改数据重新再导!");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}else if(totalCount == 0){
						importedResult.setIsImported(3);
						importedResult.setCause("导入失败");
						importedResult.setMsg("请录入有效数据再进行导入操作!");
						importList.add(importedResult);
						responseEntity.setData(importList);
						LOGGER.warn("导入结束...");
						return responseEntity;
					}
					
					for (Object card : list) {
						StockCardImport bean = (StockCardImport) card;
						if(!StringUtils.isEmpty(bean.getIccid())){
							bean.setIccid(bean.getIccid().trim());
						}
						if(!StringUtils.isEmpty(bean.getSpCode())){
							bean.setSpCode(bean.getSpCode().trim());
						}
						if(!StringUtils.isEmpty(bean.getPackageCode())){
							bean.setPackageCode(bean.getPackageCode().trim());
						}
						if(!StringUtils.isEmpty(bean.getWhitePkCode())){
							bean.setWhitePkCode(bean.getWhitePkCode().trim());
						}
						if(!StringUtils.isEmpty(bean.getOrderNo())){
							bean.setOrderNo(bean.getOrderNo().trim());
						}
						bean.setOpKey(opKey);
						set.add(bean.getOrderNo());
						cardList.add(bean);
					}

					//不是同批次订单号的卡出库则驳回
					if(set.size() > 1){
						importedResult.setIsImported(3);
						importedResult.setCause("导入失败");
						importedResult.setMsg("请对同订单号批次的卡进行出库操作！");
						importList.add(importedResult);
						responseEntity.setData(importList);
						return responseEntity; 
					}else{
						Iterator it=set.iterator();
						String orderNo = "";
						while( it .hasNext() ){
							orderNo = (String) it.next();
						}
						
						Integer spId = 0;
						Integer packageId = 0;
						
						if(!StringUtils.isEmpty(orderNo)){
							
							//根据订单号获取订单信息
							OutOrder order = outOrderService.getByOrderNo(orderNo);
							if(null == order){
								importedResult.setIsImported(3);
								importedResult.setCause("导入失败");
								importedResult.setMsg("该订单号不存在或已取消！");
								importList.add(importedResult);
								responseEntity.setData(importList);
								return responseEntity; 
							}
							
							//获取此订单号已出库的卡数
							Integer stockCount = outOrderService.getStockCount(order.getOutOrderId());
							Integer totlCount = resultList.size() + stockCount;
							Integer remainCount = order.getTotalCard() - stockCount;
							if(totlCount > order.getTotalCard()){
								importedResult.setIsImported(3);
								importedResult.setCause("导入失败");
								importedResult.setMsg("该订单号共"+order.getTotalCard() + "张卡，已出库" + stockCount + "张，本次可出库" + remainCount + "张卡!");
								importList.add(importedResult);
								responseEntity.setData(importList);
								return responseEntity; 
							}
							
							spId = order.getSpId();
							packageId = order.getPackageId();
						}
						
						Map<String,String> codeMap = new HashMap<String,String>();
				        Map<String,FlowPackage> packageMap = new HashMap<String,FlowPackage>();
				        Map<String,FlowPackage> whitePkMap = new HashMap<String,FlowPackage>();
				        
				        //获取服务商
				        List<Sp> spList = spService.getAll();
				        if(null != spList && spList.size() > 0){
				        	for (Sp opera : spList)
					        {
					        	codeMap.put(String.valueOf(opera.getSpCode()), String.valueOf(opera.getSpId()));
					        }
				        }
				        
				        //获取所有开卡套餐
				        FlowPackage bean = new FlowPackage();
				        bean.setOwned(Contants.OWNER_CMCC);
				        bean.setEmptyPk(Contants.PK_OPEN);
				        List<FlowPackage> packageList = flowPackageService.getPackageListByOwner(bean);
				        if(null != packageList && packageList.size() > 0){
				        	for(FlowPackage flowPackage : packageList){
					        	packageMap.put(String.valueOf(flowPackage.getPackageCode()), flowPackage);
					        }
				        }
				        
				        //获取所有白卡套餐
				        FlowPackage flowPck = new FlowPackage();
				        flowPck.setOwned(Contants.OWNER_CMCC);
				        flowPck.setEmptyPk(Contants.PK_WHITE);
				        List<FlowPackage> whitePkList = flowPackageService.getPackageListByOwner(flowPck);
				        if(null != whitePkList && whitePkList.size() > 0){
				        	for(FlowPackage flowPackage : whitePkList){
				        		whitePkMap.put(String.valueOf(flowPackage.getPackageCode()), flowPackage);
					        }
				        }
				        
				        totalCount = cardList.size();
						int count = 5000;
						int runSize = 0;
						if(totalCount % count == 0){
							runSize = (int)totalCount/count;
						}else{
							runSize = (int) ((totalCount / count)+1);
						}
						ExecutorService executor = Executors.newFixedThreadPool(runSize);
						CountDownLatch downLatch = new CountDownLatch(runSize);
						List<StockCardImport> newList = null ;
						
			            for (int i = 0; i < runSize; i++) {
			                if((i+1)==runSize){
			                    int startIndex = (i*count);;
			                    int endIndex = cardList.size();
			                    newList =cardList.subList(startIndex,endIndex);
			                }else{
			                    int startIndex = i*count;;
			                    int endIndex = (i+1)*count;
			                    newList =cardList.subList(startIndex,endIndex);
			                }
			                ExecupteHp hpRunnable = new ExecupteHp(newList,orderNo,spId,packageId,codeMap
			                		,packageMap,whitePkMap,downLatch,resultList,failList);
			                executor.execute(hpRunnable);
			            }
			            //等待所有子线程执行完
			            downLatch.await();
			            //执行完关闭线程池
			            executor.shutdown();
						
						failCount = failList.size();
			            successCount = resultList.size();
			            
			            importedResult.setTotalCount(totalCount);
			            importedResult.setSuccessCount(successCount);
			            importedResult.setFailCount(failCount);
						
			            // 保存数据
						if (resultList != null && resultList.size() > 0) {
							stockCardService.batchCreate(resultList);
							importedResult.setMsg(opKey);
							if(failCount == 0){
								importedResult.setIsImported(1);
								importedResult.setSuccessCount(successCount);
								LOGGER.warn("导入结束......,总数：" + totalCount + " 成功：" + successCount);
							}
						}

						if (failList != null && failList.size() > 0) {
							LOGGER.warn("反馈错误数据...");
							// 不需要模版导出
							String name =  UUID.randomUUID().toString() + "."
									+ FilenameUtils.getExtension(fileName); 
							String url = fcadminProperty.getDownloadPath() + name; 
							ExcelUtil.getInstance().exportObj2Excel(url, failList, StockCardExport.class);
							String reUrl = fcadminProperty.getDomain() + name;
							importedResult.setUrl(reUrl);
							importedResult.setIsImported(2);
							importedResult.setSuccessCount(successCount);
							importedResult.setFailCount(failCount);
							LOGGER.warn("导入结束......,总数：" + totalCount + " 成功：" + successCount + " 失败：" + failCount);
						}
					}
					
				} else {
					importedResult.setCause("上传文件只支持.xls与.xlsx格式，请另存为兼容格式Excel再上传");
					importedResult.setIsImported(3);
					importedResult.setMsg("上传文件只支持.xls与.xlsx格式，请另存为兼容格式Excel再上传");
					importList.add(importedResult);
					responseEntity.setData(importList);
					LOGGER.warn("导出结束...");
					return responseEntity;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
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
    class ExecupteHp implements Runnable{
    	private List<StockCardImport> cardList;
		private List<StockCardImport> resultList;
		private List<StockCardExport> failList;
		private String orderNos;
		private Integer spId;
		private Integer packageId;
		private Map<String, String> codeMap;
		private Map<String, FlowPackage> packageMap;
		private Map<String, FlowPackage> whitePkMap;
		private CountDownLatch downLatch;

		public ExecupteHp(List<StockCardImport> cardList,String orderNos,Integer spId,
				Integer packageId,Map<String,String> codeMap,
				Map<String,FlowPackage> packageMap,Map<String,FlowPackage> whitePkMap,CountDownLatch downLatch,
				List<StockCardImport> resultList,List<StockCardExport> failList) {
			this.cardList = cardList;
			this.orderNos = orderNos;
			this.spId = spId;
			this.packageId = packageId;
			this.codeMap = codeMap;
			this.packageMap = packageMap;
			this.whitePkMap = whitePkMap;
			this.failList = failList;
			this.resultList = resultList;
			this.downLatch = downLatch;
		}

		@Override
		public void run() {
			if (cardList == null || cardList.size() == 0)
	        {
				downLatch.countDown();
	            return;
	        }
	        
	        int z = 0;
	        List<String> checkIccid = new ArrayList<String>();
	        
	        Map<String,StockCardImport> validateMap = new HashMap<String,StockCardImport>();
	        Map<String,StockCardImport> listMap = new HashMap<String,StockCardImport>();
	        Map<String, FlowCardImport> iccidMap = new HashMap<String, FlowCardImport>();
	        
	        for (StockCardImport flowCard : cardList)
	        {
	            z++;
	            StockCardExport fail = new StockCardExport();
	            
	            String iccid = flowCard.getIccid();
	            String spCode = flowCard.getSpCode();
	            String packageCode = flowCard.getPackageCode();
	            String whitePkCode = flowCard.getWhitePkCode();
	            String orderNo = flowCard.getOrderNo();
	            
	            validateMap.put(iccid, flowCard);
	            
	            fail.setIccid(iccid);
	            fail.setSpCode(spCode);
	            fail.setPackageCode(packageCode);
	            fail.setWhitePkCode(whitePkCode);
	            fail.setOrderNo(orderNo);
	            
	            boolean handler = false;
	            boolean add = true;
	            if (cardList.lastIndexOf(flowCard) == cardList.size() - 1)
	            {
	                handler = true;
	            }
	            
	            if (StringUtils.isEmpty(iccid))
	            {
	                fail.setCause("ICCID必填!");
	                failList.add(fail);
	                add = false;
	            }
	            else if (iccid.length() != 20)
	            {
	                fail.setCause("ICCID长度必须为20位!");
	                failList.add(fail);
	                add = false;
	            }
	            else
	            {
	                boolean chkIccid = checkIccid.contains(iccid);
	                if (chkIccid)
	                {
	                    fail.setCause("导入文件中ICCID重复!"); 
	                    failList.add(fail);
	                    add = false;
	                }
	            }
	            
	            if(StringUtils.isEmpty(spCode)){
	            	fail.setCause("商户编号必填!");
	                failList.add(fail);
	                add = false;
	            }else if(StringUtils.isEmpty(packageCode)){
	            	fail.setCause("开卡套餐编号必填!");
	            	failList.add(fail);
	            	add = false;
	            }
	            
	            if (add)
	            {
	            	String spId = codeMap.get(spCode);
	            	if(!StringUtils.isEmpty(spId)){
	            		flowCard.setSpId(Integer.parseInt(spId));
	            	}
	            	
	            	listMap.put(iccid, flowCard);
	                checkIccid.add(iccid);
	            }
	            if (z == 5000 || handler)
	            {
	            	//ICCID是否存在
	                List<FlowCardImport> list = new ArrayList<FlowCardImport>();
	                if (checkIccid.size() > 0)
	                {
	                	list = cardManageService.getFlowcardListByIccid(checkIccid);
	                    
	                    for (FlowCardImport fc : list)
	                    {
	                        iccidMap.put(fc.getIccid(), fc);
	                    }
	                    
	                    for (String cNo : checkIccid)
	                    {
	                    	FlowCardImport result = iccidMap.get(cNo);
	                    	StockCardImport bean = validateMap.get(cNo);
	                        if (null == result)
	                        {
	                        	fail = new StockCardExport();
	                        	fail.setIccid(cNo);
	        	    			fail.setSpCode(bean.getSpCode());
	        	    			fail.setPackageCode(bean.getPackageCode());
	        	    			fail.setWhitePkCode(bean.getWhitePkCode());
	        	    			fail.setOrderNo(bean.getOrderNo());
	                        	fail.setCause("ICCID不存在!");
	                        	failList.add(fail);
	                        	listMap.remove(cNo);
	                            continue;
	                        }else if(StringUtils.isNotEmpty(result.getOutStockTime())){
	                        	fail = new StockCardExport();
	                        	fail.setIccid(cNo);
	                        	fail.setSpCode(bean.getSpCode());
	        	    			fail.setPackageCode(bean.getPackageCode());
	        	    			fail.setWhitePkCode(bean.getWhitePkCode());
	        	    			fail.setOrderNo(bean.getOrderNo());
	                        	fail.setCause("该卡已出库!");
	                        	failList.add(fail);
	                        	listMap.remove(cNo);
	                            continue;
	                        }
	                    }
	                }
	                
	                //商户编号是否存在、开卡套餐是否存在且商户与开卡套餐是否匹配
	                Iterator iterator = listMap.entrySet().iterator();
	    	    	List<String> removeList = new ArrayList<String>();
	    	    	while(iterator.hasNext()){
	    	    		Map.Entry entry = (Map.Entry)iterator.next();
	    	    		StockCardImport stockCardImport = (StockCardImport) entry.getValue();
	    	    		
	    	    		if (!codeMap.containsKey(stockCardImport.getSpCode()))
	    	    		{
	    	    			fail = new StockCardExport();
	    	    			fail.setIccid(stockCardImport.getIccid());
	    	    			fail.setSpCode(stockCardImport.getSpCode());
	    	    			fail.setPackageCode(stockCardImport.getPackageCode());
	    	    			fail.setOrderNo(stockCardImport.getOrderNo());
	    	    			fail.setCause("商户编号不存在!");
	    	    			failList.add(fail);
	    	    			removeList.add(stockCardImport.getIccid());
	    	    			continue;
	    	    		}else{
	    	    			if (!packageMap.containsKey(stockCardImport.getPackageCode()))
	        	    		{
	        	    			fail = new StockCardExport();
	        	    			fail.setIccid(stockCardImport.getIccid());
	        	    			fail.setSpCode(stockCardImport.getSpCode());
	        	    			fail.setPackageCode(stockCardImport.getPackageCode());
	        	    			fail.setWhitePkCode(stockCardImport.getWhitePkCode());
	        	    			fail.setOrderNo(stockCardImport.getOrderNo());
	        	    			fail.setCause("开卡套餐编号不存在!");
	        	    			failList.add(fail);
	        	    			removeList.add(stockCardImport.getIccid());
	        	    			continue;
	        	    		}else{
	        	    			FlowPackage bean = packageMap.get(stockCardImport.getPackageCode());
	        	    			if(!Contants.SPID_COMMEN.equals(bean.getSpId()) && !bean.getSpId().equals(stockCardImport.getSpId())){
	        	    				fail = new StockCardExport();
	            	    			fail.setIccid(stockCardImport.getIccid());
	            	    			fail.setSpCode(stockCardImport.getSpCode());
	            	    			fail.setPackageCode(stockCardImport.getPackageCode());
	            	    			fail.setWhitePkCode(stockCardImport.getWhitePkCode());
	            	    			fail.setOrderNo(stockCardImport.getOrderNo());
	            	    			fail.setCause("商户编号与开卡套餐编号不匹配!");
	            	    			failList.add(fail);
	            	    			removeList.add(stockCardImport.getIccid());
	        	    			}
	        	    			
	        	    			if(!Contants.OPEN_CARD.equals(packageId)){
	        	    				if(!packageId.equals(bean.getPackageId())){
	            	    				fail = new StockCardExport();
	                	    			fail.setIccid(stockCardImport.getIccid());
	                	    			fail.setSpCode(stockCardImport.getSpCode());
	                	    			fail.setPackageCode(stockCardImport.getPackageCode());
	                	    			fail.setWhitePkCode(stockCardImport.getWhitePkCode());
	                	    			fail.setOrderNo(stockCardImport.getOrderNo());
	                	    			fail.setCause("套餐编号与购卡套餐编号不匹配!");
	                	    			failList.add(fail);
	                	    			removeList.add(stockCardImport.getIccid());
	            	    			}
	        	    			}
	        	    			
	        	    			if(StringUtils.isNotEmpty(orderNos)){
	        	    				if(!(stockCardImport.getSpId().equals(spId) &&stockCardImport.getOrderNo().equals(orderNos))){
	                	    			fail = new StockCardExport();
	                	    			fail.setIccid(stockCardImport.getIccid());
	                	    			fail.setSpCode(stockCardImport.getSpCode());
	                	    			fail.setPackageCode(stockCardImport.getPackageCode());
	                	    			fail.setWhitePkCode(stockCardImport.getWhitePkCode());
	                	    			fail.setOrderNo(stockCardImport.getOrderNo());
	                	    			fail.setCause("商户编号与订单编号不匹配!");
	                	    			failList.add(fail);
	                	    			removeList.add(stockCardImport.getIccid());
	                	    		}
	            	    		}
	        	    			
	        	    			if(StringUtils.isNotEmpty(whitePkCode)){
	        	    				if (!whitePkMap.containsKey(stockCardImport.getWhitePkCode()))
	    	        	    		{
	    	        	    			fail = new StockCardExport();
	    	        	    			fail.setIccid(stockCardImport.getIccid());
	    	        	    			fail.setSpCode(stockCardImport.getSpCode());
	    	        	    			fail.setPackageCode(stockCardImport.getPackageCode());
	    	        	    			fail.setWhitePkCode(stockCardImport.getWhitePkCode());
	    	        	    			fail.setOrderNo(stockCardImport.getOrderNo());
	    	        	    			fail.setCause("白卡套餐编号不存在!");
	    	        	    			failList.add(fail);
	    	        	    			removeList.add(stockCardImport.getIccid());
	    	        	    		}
	        	    			}
	        	    		}
	    	    		}
	    	    	}
	    	    	
	    	    	if(removeList.size() > 0){
	    	    		for (int i = 0; i < removeList.size(); i++) {
	    	    			listMap.remove(removeList.get(i));
						}
	    	    	}
	    	    	
	                z = 0;
	                list.clear();
	                list = null;
	                iccidMap.clear();
	            }
	        }
	        resultList.addAll(new ArrayList<StockCardImport>(listMap.values()));
	        downLatch.countDown();
		}
    }

    /**
     * 卡出库
     * @param listJson
     * @return
     */
    @RequestMapping(value = "/lifecycle/stockCard")
    @ResponseBody
    public Map<String, Boolean> stockCard(@RequestBody String listJson)
    {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String stockKey = "";
		try {
			
			JSONObject json = JSONObject.parseObject(listJson);
    		stockKey = String.valueOf(json.get("stockKey"));
			List<StockCardImport> list = stockCardService.selectStockListByKey(stockKey);
			List<OpenPackage> stockList = new ArrayList<OpenPackage>();
			int str = 0;
			
			if(null != list && list.size() > 0){
				String orderNo = list.get(0).getOrderNo();
				String spCode = list.get(0).getSpCode();
				
				LOGGER.info("出库订单编号：" + orderNo + "， 商户编号：" + spCode);
				
				int z = 0;
				for (StockCardImport card : list) {
					OpenPackage stockCard = new OpenPackage();
					stockCard.setIccid(card.getIccid());
					stockCard.setFlowpkgtype(Contants.CARD_TYPE_OPEN);
					stockCard.setRelation_id(Integer.parseInt(card.getPackageCode()));
					if(StringUtils.isNotEmpty(card.getWhitePkCode())){
						stockCard.setEmpty_id(Integer.parseInt(card.getWhitePkCode()));
					}
					stockList.add(stockCard);
					z++;
					boolean handler = false;
                    if (list.lastIndexOf(card) == list.size() - 1)
                    {
                        handler = true;
                    }
                    if (z == 2000 || handler)
                    {
                    	OpenPkgRequest openRequest = new OpenPkgRequest();
                    	openRequest.setOrderNo(orderNo);
                    	openRequest.setSpCode(spCode);
                    	openRequest.setIccidList(stockList);
                    	openRequest.setConsumer("oms-fcadmin");
                    	openRequest.setVersion("1.0.0");
                    	openRequest.setTime(DateUtils.getCurrentDate(DateFormatConstants.TIMEF_FORMAT));
                    	FlowResponse<List<OrderFailList>> retSrc = opsMgrManager.openPackage(openRequest);
        				if (!"1000".equals(retSrc.getCode())) {
        					str++;
        				}
        				
        				Optlog log = new Optlog();
        	            log.setOptType("批量出库");
        	            log.setOptDesc(StringUtils.join(retSrc.getEntiy(),","));
        	            optlogService.insertLog(log);
                    	 z = 0;
                    	 stockList.clear();
                    }
				}
			}else{
				str = 1;
				LOGGER.info("批量出库未获取到出库列表数据......");
			}
			
			if(str == 0){
				map.put("result", true);
			}else{
				map.put("result", false);
			}
		} catch (Exception e) {
			LOGGER.error("卡出库操作卡异常：", e);
			map.put("result", false);
		}
		
		//删除临时表数据
		stockCardService.deleteStockByKey(stockKey);
		return map;
    }
}
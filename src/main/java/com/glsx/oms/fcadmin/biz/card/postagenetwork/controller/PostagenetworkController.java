package com.glsx.oms.fcadmin.biz.card.postagenetwork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultCode;
import org.oreframework.web.ui.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.NetworkAccess;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.PostageNetworkList;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.Postagenetwork;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.service.PostagenetworkService;

@RestController
@RequestMapping("/postagenetwork")
public class PostagenetworkController {

	private final static Logger LOGGER = LoggerFactory.getLogger(PostagenetworkController.class);
	@Autowired
	private PostagenetworkService postagenetworkService;
	
	/**
	 * 得到资费计划列表
	 * @param pagination
	 * @return
	 */
	@RequestMapping(value="/getpostageNetworkList",method=RequestMethod.GET)
	public ResponseEntity<Postagenetwork> getpostageNetworkList(Pagination pagination){
		ResponseEntity<Postagenetwork> responseEntity=new ResponseEntity<Postagenetwork>();
		PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
		List<Postagenetwork> PostagenetworkList = postagenetworkService.getpostageNetworkList();
		long total=((Page<Postagenetwork>)PostagenetworkList).getTotal();
		responseEntity.setData(PostagenetworkList);
		responseEntity.setRecordsTotal(total);
		responseEntity.setRecordsFiltered(total);
		return responseEntity;
	}
	
	/**
	 * 编辑得到资费计划的详情
	 * @param postageId
	 * @return
	 */
	@RequestMapping(value="/getPostageDetail",method=RequestMethod.GET)
	public Map<String, Postagenetwork> getPostageDetail(Postagenetwork postagenetwork){
		Map<String, Postagenetwork> map=new HashMap<String, Postagenetwork>();
		if(postagenetwork.getPostageId()!=null){
			postagenetwork=postagenetworkService.getPostageDetail(postagenetwork.getPostageId());
			map.put("postagenetwork", postagenetwork);
		}else{
			map.put("postagenetwork", postagenetwork);
		}
		return map;
	}
	
	/**
	 * 新增资费计划
	 * @param postagenetwork
	 * @return
	 */
	@RequestMapping(value="/updatePostage" ,method=RequestMethod.POST)
	public ResultEntity<Postagenetwork> updatePostage(@RequestBody PostageNetworkList postageNetworkList){
		ResultEntity<Postagenetwork> resultEntity=new ResultEntity<Postagenetwork>();
		if(postageNetworkList.getPostagenetwork().getPostageId()==null){			//添加........
			postagenetworkService.savePostage(postageNetworkList);
			LOGGER.info("新增资费计划");
			resultEntity.setReturnCode(ResultCode.SUCCESS);
			resultEntity.setMessage("新增资费计划成功");
		}else{							//编辑........
			postagenetworkService.updatePostage(postageNetworkList);
			LOGGER.info("编辑资费计划");
			resultEntity.setReturnCode(ResultCode.SUCCESS);
			resultEntity.setMessage("编辑资费计划成功");
		}
		return resultEntity;
	}
	
	/**
	 * 得到通讯计划列表
	 * @param pagination
	 * @param postageId
	 * @return
	 */
	@RequestMapping(value="/getNetworkList",method=RequestMethod.GET)
	public ResponseEntity<NetworkAccess> getNetworkList(HttpSession session,Pagination pagination,NetworkAccess networkAccess){
		ResponseEntity<NetworkAccess> responseEntity=new ResponseEntity<NetworkAccess>();
		PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
		List<NetworkAccess> networkAccessList=new ArrayList<NetworkAccess>();
		if(networkAccess.getPostageId()!=null){
			networkAccessList=postagenetworkService.getNetworkList(networkAccess.getPostageId());
			long total=((Page<NetworkAccess>)networkAccessList).getTotal();
			responseEntity.setData(networkAccessList);
			responseEntity.setRecordsFiltered(total);
			responseEntity.setRecordsTotal(total);
		}else{
			if(session.getAttribute("nextPostageId")!=null){
				networkAccess.setPostageId((Integer)session.getAttribute("nextPostageId"));
				networkAccessList=postagenetworkService.getNetworkList(networkAccess.getPostageId());
			}
			responseEntity.setData(networkAccessList);
		}
		return responseEntity;
	}
	
	/**
	 * 判断通信计划的code name是否已经存在
	 * @param networkAccess
	 * @return
	 */
	@RequestMapping(value="/existsByCodeName" ,method=RequestMethod.POST)
	public Map<String, Boolean> existsByCodeName(@RequestBody NetworkAccess networkAccess){
		Map<String, Boolean> map=new HashMap<String, Boolean>();
		try {
			boolean result=postagenetworkService.existsByCodeName(networkAccess);
			map.put("result", !result);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.info("判断通信计划的code name是否已经存在出现异常");
			map.put("result", false);
		}
		return map;
		
	}
	/**
	 * 判断资费计划的name是否已经存在
	 * @param postagenetwork
	 * @return
	 */
	@RequestMapping(value="/existsByPostName" ,method=RequestMethod.POST)
	public Map<String, Boolean> existsByPostName(@RequestBody Postagenetwork postagenetwork){
		Map<String, Boolean> map=new HashMap<String, Boolean>();
		try {
			boolean result=postagenetworkService.existsByPostName(postagenetwork.getPostageName());
			map.put("result", !result);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.info("判断资费计划名称是否已经存在出现异常",e);
			map.put("result", false);
		}
		return map;
	}
	
}

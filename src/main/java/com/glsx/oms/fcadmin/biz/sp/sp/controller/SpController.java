
package com.glsx.oms.fcadmin.biz.sp.sp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import org.eclipse.jetty.client.RequestNotifier;
import org.oreframework.web.ui.Pagination;
import org.oreframework.web.ui.ResponseEntity;
import org.oreframework.web.ui.ResultEntity;
import org.oreframework.web.ui.ResultCode;

import com.glsx.oms.fcadmin.biz.sp.sp.service.SpService;
import com.glsx.oms.fcadmin.framework.Contants;

import freemarker.core.ReturnInstruction.Return;

import com.glsx.biz.common.base.entity.City;
import com.glsx.biz.common.base.entity.Province;
import com.glsx.biz.common.base.service.CityService;
import com.glsx.biz.common.base.service.ProvinceService;
import com.glsx.oms.fcadmin.biz.sp.sp.model.Sp;

/**
 * 流量平台商户信息 Controller
 */
@RestController
@RequestMapping(value = "/sp")
public class SpController{
    
    private final static Logger LOGGER = LoggerFactory.getLogger(SpController.class);

    @Autowired
    private SpService spService;
    
    @Reference(version="2.2.0")
    private CityService cityService;
    
    @Reference(version="2.2.0")
    private ProvinceService provinceService;
    
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;
    
    @RequestMapping(value = "/sp/{id}", method = RequestMethod.GET)
    public ResultEntity<Sp> get(@PathVariable("id") Integer id) {
        ResultEntity<Sp> resultEntity = new ResultEntity<Sp>();
        resultEntity.setData(spService.getById(id));
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("获取成功!");
        return resultEntity;
    }
    
    @RequestMapping(value = "/sp/{id}", method = RequestMethod.DELETE)
    public ResultEntity<Sp> delete(@PathVariable("id") Integer id) {
        ResultEntity<Sp> resultEntity = new ResultEntity<Sp>();
        spService.deleteById(id);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("删除成功!");
        LOGGER.info("delete sp id{}",id);
        return resultEntity;
    }
    
    /**
     * 保存
     * @param sp
     * @return
     */
    @RequestMapping(value = "/sp", method = RequestMethod.POST)
    public ResultEntity<Sp> saveSp(@RequestBody Sp sp) {
        ResultEntity<Sp> resultEntity = new ResultEntity<Sp>();
        spService.saveSp(sp);
        resultEntity.setReturnCode(ResultCode.SUCCESS);
        resultEntity.setMessage("保存成功!");
        return resultEntity;
    }

    @RequestMapping(value = "/sp", method = RequestMethod.GET)
    public ResponseEntity<Sp> getAll(Pagination pagination) {
        PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
        List<Sp> spList = spService.getAll();
        
        ResponseEntity<Sp> responseObject = new ResponseEntity<Sp>();
        long total = ((Page<Sp>)spList).getTotal();
        responseObject.setData(spList);
        responseObject.setRecordsTotal(total);
        responseObject.setRecordsFiltered(total);
        return responseObject;
    }
    
    /**
     * 得到sp列表
     * @param pagination
     * @return
     */
    @RequestMapping(value="/getSpList" ,method=RequestMethod.GET)
    public ResponseEntity<Sp> getSpList(Pagination pagination){
    	ResponseEntity<Sp> responseEntity=new ResponseEntity<Sp>();
    	PageHelper.startPage(pagination.getCurrentPage(), pagination.getPageSize());
    	List<Sp> spList=spService.getSpList();
    	long total=((Page<Sp>)spList).getTotal();
    	responseEntity.setData(spList);
    	responseEntity.setRecordsTotal(total);
    	responseEntity.setRecordsFiltered(total);
    	return responseEntity;
    }
   
    @RequestMapping(value="/deleteSpById" ,method=RequestMethod.DELETE)
    public ResultEntity<Sp> deleteSpById(Integer spId){
    	//判断此商户是不是可删
    	ResultEntity<Sp> resultEntity=new ResultEntity<Sp>();
    	if(spId!=null){
    		List<Integer> spList=spService.getUserdSpcardId(spId);
    		if(spList!=null &&spList.size()>0){
    			//不可删除
    			resultEntity.setReturnCode(ResultCode.ERROR);//-1
    			resultEntity.setMessage("该服务商已被使用,不能删除");
    		}else{
    			//判断是否有子集
    			List<Integer> childSpIdList=spService.getChildSp(spId);
    			if(childSpIdList !=null && childSpIdList.size() > 0){
    				//不可删除
        			resultEntity.setReturnCode(Contants.SP_CHILD);//-2
        			resultEntity.setMessage("该服务商含有子集,不能删除");
    			}else {
    				//删除  (更改状态)
        			spService.deleteSpById(spId);
        			resultEntity.setReturnCode(ResultCode.SUCCESS);
        			resultEntity.setMessage("删除成功");
        			LOGGER.info("删除id为"+spId+"的数据");
				}
    		}
    	}
    	return resultEntity;
    }
    
    /**
     * 编辑时得到详情
     * @param spId
     * @return
     */
    @RequestMapping(value="/getSpdetail" ,method=RequestMethod.GET)
    public Map<String,Sp> getSpdetail(Integer spId){
    	Map<String,Sp> map=new HashMap<String,Sp>();
    	String province="";
    	String city="";
    	String otherAddr="";
    	if(spId!=null){
    		Sp sp=spService.getSpdetail(spId);
    		//切分省，市，详细地址
    		try {
    			province=sp.getCommAddr().split("省")[0];
    			if(province == sp.getCommAddr()){
    				city=sp.getCommAddr().split("市")[0];
    				if(city == sp.getCommAddr()){
    					//自治区
    					province=sp.getCommAddr().substring(0, 2);
    					city=province;
    					otherAddr=sp.getCommAddr().substring(2);
    				}else{
    					//直辖市
    					province=city;
    					otherAddr=sp.getCommAddr().split("市")[1];
    				}
    			}else{
    				city=sp.getCommAddr().split("省")[1].split("市")[0];
            		otherAddr=sp.getCommAddr().split("市")[1];
    			}
        		sp.setProvince(province);
        		sp.setCity(city);
        		sp.setOtherAddr(otherAddr);
			} catch (Exception e) {
				// TODO: handle exception
				LOGGER.info("地址转换出错！");
			}
    		map.put("sp", sp);
    	}
		return map;
    }
    
    @RequestMapping(value="/updateSp" ,method=RequestMethod.POST)
    public ResultEntity<Sp> updateSp(@RequestBody Sp sp){
    	ResultEntity<Sp> resultEntity=new ResultEntity<Sp>();
    	spService.updateSp(sp);
    	LOGGER.info("更新id为"+sp.getSpId()+"商户信息");
    	resultEntity.setReturnCode(ResultCode.SUCCESS);
    	resultEntity.setMessage("修改成功");
    	return resultEntity;
    }
    
    @RequestMapping(value="/existBySpName",method=RequestMethod.POST)
    public ResultEntity<Boolean> existBySpName(@RequestBody Sp sp){
    	ResultEntity<Boolean> resultEntity=new ResultEntity<Boolean>();
    	try {
			boolean result=spService.existBySpName(sp);
			resultEntity.setData(!result);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.info("判断商户名称是否已经存在出现异常",e);
			resultEntity.setData(false);
		}
    	return resultEntity;
    }
    
    /**
     * 根据级别得到商户名
     * @param level
     * @return
     */
    @RequestMapping(value="/getSpNameByLevel" ,method=RequestMethod.GET)
    public ResultEntity<List<Sp>> getSpNameByLevel(Integer parentLevel){
    	ResultEntity<List<Sp>> resultEntity=new ResultEntity<List<Sp>>();
    	if(parentLevel!=null){
    		List<Sp> spNameList=spService.getSpNameByLevel(parentLevel);
    		resultEntity.setData(spNameList);
    		resultEntity.setReturnCode(ResultCode.SUCCESS);
    		resultEntity.setMessage("获取成功!");
    	}
    	return resultEntity;
    }
    
    /**
     * 调dubbo接口得到省
     * @return
     */
    @RequestMapping(value="/getProvinceList",method=RequestMethod.GET)
    public Map<String, List<Province>> getProvinceList(){
    	Map<String, List<Province>> map=new HashMap<String, List<Province>>();
    	List<Province> provinceList= provinceService.getAllList();
    	map.put("provinceList", provinceList);
    	return map;
    }
    
    /**
     * 调dubbo接口得到市
     * @return
     */
    @RequestMapping(value="/getCityList",method=RequestMethod.GET)
    public Map<String, List<City>> getCityList(Integer provinceId){
    	Map<String, List<City>> map=new HashMap<String, List<City>>();
    	List<City> cityList= cityService.getListByProvinceId(provinceId);
    	map.put("cityList", cityList);
    	return map;
    }


}
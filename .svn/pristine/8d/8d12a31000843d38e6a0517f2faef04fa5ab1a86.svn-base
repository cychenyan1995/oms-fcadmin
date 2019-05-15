package com.glsx.oms.fcadmin.biz.card.postagenetwork.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glsx.oms.fcadmin.biz.card.postagenetwork.mapper.PostagenetworkMapper;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.NetworkAccess;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.PostageNetworkList;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.Postagenetwork;

@Service
public class PostagenetworkService {
	
	@Autowired
	private PostagenetworkMapper postagenetworkMapper;

	public List<Postagenetwork> getpostageNetworkList(){
		return postagenetworkMapper.getpostageNetworkList();
	}
	
	public Postagenetwork getPostageDetail(Integer postageId){
		return postagenetworkMapper.getPostageDetail(postageId);
	}
	
	public List<NetworkAccess> getNetworkList(Integer postageId){
		return postagenetworkMapper.getNetworkList(postageId);
	}
	
	public boolean existsByCodeName(NetworkAccess networkAccess){
		List<NetworkAccess> list=postagenetworkMapper.existsByCodeName(networkAccess);
		if(list!=null && list.size()>0)
		{
			return true;
		}
		return false;
		
	}
	
	@Transactional(rollbackFor = {IllegalArgumentException.class})
	public void savePostage(PostageNetworkList postageNetworkList){
		Postagenetwork postagenetwork=postageNetworkList.getPostagenetwork();
		List<NetworkAccess> networkAccessList=postageNetworkList.getNetworkAccessList();
		Integer nextPostage = postagenetworkMapper.getNextPostageId();
		//保存资费计划表
		postagenetwork.setPostageId(nextPostage);
		postagenetworkMapper.savePostage(postagenetwork);
		if(networkAccessList!=null && networkAccessList.size()>0){
			//保存通信计划表(批量)
			postagenetworkMapper.batchInsertNetwork(networkAccessList);
			//保存到关联表中(批量)
			for(NetworkAccess networkAccess:networkAccessList){
				//给list的PostageId赋值插入关联表
				networkAccess.setPostageId(nextPostage);
			}
			postagenetworkMapper.insertPostageNetwork(networkAccessList);
		}
	}
	
	@Transactional(rollbackFor = {IllegalArgumentException.class})
	public void updatePostage(PostageNetworkList postageNetworkList){
		Postagenetwork postagenetwork=postageNetworkList.getPostagenetwork();
		List<NetworkAccess> networkAccessList=postageNetworkList.getNetworkAccessList();
		Integer postageId=postagenetwork.getPostageId();
		//得到原有的通信数据集合
		List<NetworkAccess> hisNetworkAccessList=getNetworkList(postageId);
		//跟新资费计划表
		postagenetworkMapper.updatePostage(postagenetwork);
		
		if(networkAccessList!=null && networkAccessList.size()>0){
			//批量删除  通信  关联表
			if(hisNetworkAccessList!=null && hisNetworkAccessList.size()>0){
				postagenetworkMapper.batchDeleteNetwork(hisNetworkAccessList);
				postagenetworkMapper.deletePostageNetworkByPostageId(postageId);
			}
			//批量添加
			postagenetworkMapper.batchInsertNetwork(networkAccessList);
			postagenetworkMapper.insertPostageNetwork(networkAccessList); 
		}else{
			if(hisNetworkAccessList!=null && hisNetworkAccessList.size()>0){
				postagenetworkMapper.batchDeleteNetwork(hisNetworkAccessList);
				postagenetworkMapper.deletePostageNetworkByPostageId(postageId);
			}
		}
	}
	
	public boolean existsByPostName(String  postageName){
		List<Postagenetwork> list=postagenetworkMapper.existsByPostName(postageName);
		if(list!=null && list.size()>0)
		{
			return true;
		}
		return false;
	}
}

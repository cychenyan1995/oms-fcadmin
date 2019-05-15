package com.glsx.oms.fcadmin.biz.card.postagenetwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.NetworkAccess;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.PostageNetworkList;
import com.glsx.oms.fcadmin.biz.card.postagenetwork.model.Postagenetwork;

@Mapper
public interface PostagenetworkMapper extends OreMapper<Postagenetwork>{

	public List<Postagenetwork> getpostageNetworkList();
	public Postagenetwork getPostageDetail(int postageId);
	public List<NetworkAccess> getNetworkList(int postageId);

	public List<NetworkAccess> existsByCodeName(NetworkAccess networkAccess);
	public List<Postagenetwork> existsByPostName(String  postageName);
	
	public void insertPostageNetwork(List<NetworkAccess> networkAccessList);
	public void savePostage(Postagenetwork postagenetwork);
	public void updatePostage(Postagenetwork postagenetwork);
	public void batchInsertNetwork(List<NetworkAccess> list);
	
	public void batchDeleteNetwork(List<NetworkAccess> list);
	public void deletePostageNetworkByPostageId(Integer accessCode);
	
	//得到表中下一个ID号
	public Integer getNextPostageId();
}

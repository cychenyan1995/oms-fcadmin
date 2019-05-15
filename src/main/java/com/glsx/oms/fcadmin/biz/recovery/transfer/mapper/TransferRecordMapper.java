package com.glsx.oms.fcadmin.biz.recovery.transfer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.oreframework.datasource.mybatis.mapper.OreMapper;

import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferCard;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferRecord;

/**
 * 卡迁移mapper
 * @author Lenovo
 *
 */
@Mapper
public interface TransferRecordMapper extends OreMapper<TransferRecord>{

	public List<TransferRecord> getAll(TransferRecord transferRecord);
	
	public TransferCard existsByTransferCard(TransferRecord transferRecord);
	
	public void transferingOp(TransferRecord transferRecord);
	
	public void addTransferRecord(TransferRecord transferRecord);
	
}

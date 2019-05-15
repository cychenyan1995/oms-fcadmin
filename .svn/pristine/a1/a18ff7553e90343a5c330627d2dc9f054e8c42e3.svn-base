package com.glsx.oms.fcadmin.biz.recovery.transfer.service;

import java.util.List;

import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferCard;
import com.glsx.oms.fcadmin.biz.recovery.transfer.model.TransferRecord;
import com.glsx.oms.fcadmin.biz.recovery.transfer.mapper.TransferRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 流量卡迁移记录 Service
 */
@Service
public class TransferRecordService {

	@Autowired
	private TransferRecordMapper transferRecordMapper;

	public List<TransferRecord> getAll(TransferRecord transferRecord) {
		return transferRecordMapper.getAll(transferRecord);
	}

    public TransferCard existsByTransferCard(TransferRecord transferRecord){
    	return transferRecordMapper.existsByTransferCard(transferRecord); 
    } 
    
	public void transferingOp(TransferRecord transferRecord) {
		transferRecordMapper.transferingOp(transferRecord);
	}

	public void addTransferRecord(TransferRecord transferRecord) {
		transferRecordMapper.addTransferRecord(transferRecord);
	}

}
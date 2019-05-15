(function(angular) {
	function transferCtrl($scope,param,recoveryService, $uibModalInstance) {
		
		//param 为打开页面传递过来的参数对象
		//alert(param.id)
		var obj={};
		var srcTransferCard={};
		var dstTransferCard={};
		obj.transRecordId=param.transRecordId;
		recoveryService.toTransferingOp(obj,function(data){
			$scope.transferQuery=data.data;
			srcTransferCard=data.srcTransferCard;
			dstTransferCard=data.dstTransferCard;
		});
		
		
		// 提交表单
		$scope.TransferOp = function(){
            if(srcTransferCard.cardStatus==6||dstTransferCard.cardStatus==6){
				swal({
					  title: "",
					  text: "新旧卡需为非已销卡状态!",
					  timer: 1500,
					  type: "error",
					  showConfirmButton: false
					});
            }else if(dstTransferCard.packageStatus!=0){
            	swal({
					  title: "",
					  text: "新卡需为库存卡!",
					  timer: 1500,
					  type: "error",
					  showConfirmButton: false
					});
            }else if(srcTransferCard.packageStatus!=1){
            	swal({
					  title: "",
					  text: "旧卡需为已激活卡!",
					  timer: 1500,
					  type: "error",
					  showConfirmButton: false
					});
            }else if(srcTransferCard.opName!=dstTransferCard.opName){
            	swal({
					  title: "",
					  text: "新旧卡运营商类型需相同!",
					  timer: 1500,
					  type: "error",
					  showConfirmButton: false
					});
            }else{
            	//实现逻辑
    			var obj = {};
    			obj.transRecordId=$scope.transferQuery.transRecordId;
    			obj.srcImsi=$scope.transferQuery.srcImsi;
    			obj.dstImsi=$scope.transferQuery.dstImsi;
    			//确定要提交
    			swal({
    				title: "",  
    		        text: "确定要迁移？",  
    		        type: "warning", 
    		        showCancelButton: true, 
    		        closeOnConfirm: false, 
    		        confirmButtonText: "确定", 
    		        cancelButtonText:"取消",  
    		        animation:"slide-from-top"  
    			},function() { 
    				//提交
    				recoveryService.transferingOp(obj, function(data) {
    					if (data.returnCode == 0) {
    						swal({
    						  title: "",
    						  text: "迁移成功!",
    						  timer: 1500,
    						  type: "success",
    						  showConfirmButton: false
    						});
    						
    						//关闭弹框
    						$uibModalInstance.close(data);
    					} else {
    						swal({
    						  title: "",
    						  text: data.message,
    						  timer: 1500,
    						  type: "error",
    						  showConfirmButton: false
    						});
    					}
    				});
    			});
            }
	}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('recovery').controller('transferCtrl', transferCtrl);
})(angular);
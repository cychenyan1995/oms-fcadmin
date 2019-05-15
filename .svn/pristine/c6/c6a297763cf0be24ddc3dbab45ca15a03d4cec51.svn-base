(function(angular) {
	function createTransferCtrl($scope, recoveryService, $uibModalInstance,$q) {
		
		$scope.queryTypeList=[{ number: 1, text: 'ICCID'},
		                      { number: 2, text: 'IMSI'},
		                      { number: 3, text: '网卡号'}];
		
		$scope.queryData = {
				srcQueryType: $scope.queryTypeList[0],
				dstQueryType: $scope.queryTypeList[0],
				srcQueryValue:"",
				dstQueryValue:""
		}
		
		//新旧联动
		$scope.binding = function(item) {
			var queryType=item.number;
			$scope.queryData.srcQueryType=$scope.queryTypeList[queryType-1];
			$scope.queryData.dstQueryType=$scope.queryTypeList[queryType-1];
			
			setTimeout(function(){
				$scope.add_transferRecord_form.srcQueryValue.$validate();
				$scope.add_transferRecord_form.dstQueryValue.$validate();
				
			},100);
		}
			
		// 校验旧卡是否存在
		var srcTransferCard={};
		$scope.srcAsyncCallback = function(value) {
			var obj = {};
			var result= $q.defer();
			var srcType=$scope.queryData.srcQueryType.number;		
			if(srcType==1){
				obj.srcIccid=value;
			}else if(srcType==2){
				obj.srcImsi=value;
			}else if(srcType==3){
				obj.srcCardNo=value;
			}
			return recoveryService.existsByTransferCard(obj,function(data){
				if(data.result==true){
					result.resolve({
						result: true
					});
					srcTransferCard=data.transferCard;
				}else{
					result.resolve({
						result: false
					});
				}
				return result;
			});	
		}
		// 校验新卡是否存在
		var dstTransferCard={};
		$scope.dstAsyncCallback = function(value) {
			var obj = {};
			var result= $q.defer()
			var dstType=$scope.queryData.dstQueryType.number;		
			if(dstType==1){
				obj.dstIccid=value;
			}else if(dstType==2){
				obj.dstImsi=value;
			}else if(dstType==3){
				obj.dstCardNo=value;
			}
			recoveryService.existsByTransferCard(obj,function(data){
				if(data.result==true){
					result.resolve({
						result: true
					});
					dstTransferCard=data.transferCard;
				}else{
					result.resolve({
						result: false
					});
				}
			});
			
			return result;
		}
		
		// 提交表单
		$scope.submitTransfer = function(){
			if ($scope.add_transferRecord_form.$valid) {
	            if(srcTransferCard.cardStatus==6||dstTransferCard.cardStatus==6){
					swal({
						  title: "",
						  text: "新旧卡需为非已销卡状态!",
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
	            	var obj = {};
					//实现逻辑
					//获取旧卡
					obj.srcIccid=srcTransferCard.iccid;
					obj.srcImsi=srcTransferCard.imsi;
					obj.srcCardNo=srcTransferCard.cardNo;
					//获取新卡
					obj.dstIccid=dstTransferCard.iccid;
					obj.dstImsi=dstTransferCard.imsi;
					obj.dstCardNo=dstTransferCard.cardNo;
					
					obj.source="2";//1:开放平台 2:流量管理平台
					
					obj.opName=dstTransferCard.opName;
					obj.spName=dstTransferCard.spName;	
					
					obj.transStatus=1;			
					obj.transReason=$scope.transferRecord.transReason;
					obj.contactorName=$scope.transferRecord.contactorName;
					obj.contactorTel=$scope.transferRecord.contactorTel;
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
						recoveryService.saveTransfer(obj, function(data) {
							if (data.returnCode == 0) {
								swal({
								  title: "",
								  text: "迁移成功!",
								  timer: 1500,
								  type: "success",
								  showConfirmButton: false
								});
							} else {
								swal({
								  title: "",
								  text: data.message,
								  timer: 1500,
								  type: "error",
								  showConfirmButton: false
								});
							}
							//关闭弹框
							$uibModalInstance.close(data);
						});
					});
	            }
			}else{
				$scope.add_transferRecord_form.submitted = true;
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('recovery').controller('createTransferCtrl', createTransferCtrl);
})(angular);
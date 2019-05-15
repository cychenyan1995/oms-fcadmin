(function(angular) {
	function createRecycleCtrl($scope, recoveryService, $uibModalInstance,$q) {
		
		$scope.queryTypeList=[{ number: 1, text: 'ICCID'},
		                      { number: 2, text: 'IMSI'},
		                      { number: 3, text: '网卡号'}];
		
		
		$scope.showTotalFlow=function(type,data){
			if(type!=null){
				return type==0?data:"不限流量";
			}else{
				return null;
			}
		}
		$scope.showRemainTotalflow=function(type,data){
			if(type!=null){
				return type==0?data:"--";
			}else{
				return null;
			}
		}
		
		$scope.queryData = {
				queryType: $scope.queryTypeList[0],
				queryValue:""
		}
		
		$scope.binding = function(item) {	
			setTimeout(function(){
				$scope.add_recycleRecord_form.queryValue.$validate();			
			},100);
		}
		
		$scope.queryRecycleCard = function(){		
			var obj={};
			var type=$scope.queryData.queryType.number;
			if(type==1){
				obj.iccid=queryValue;
			}else if(type==2){
				obj.imsi=queryValue;
			}else if(type==3){
				obj.cardNo=queryValue;
			}
			recoveryService.queryRecycleCard(obj,function (data){
				$scope.isShowCardInfo=true;
				if(data.data!=null){
					$scope.recycleQuery=data.data;
				}else{
					swal({
						  title: "",
						  text: "卡信息不存在!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
					});
					$scope.isShowCardInfo=false;
				}
				
			});
		}
		
		var queryValue;
		// 校验卡是否存在
		$scope.asyncCallback = function(value) {
			queryValue=value;
			var obj = {};
			var result= $q.defer();
			var type=$scope.queryData.queryType.number;
			if(type==1){
				obj.iccid=value;
			}else if(type==2){
				obj.imsi=value;
			}else if(type==3){
				obj.cardNo=value;
			}
			recoveryService.existsByRecycleCard(obj,function(data){
				if(data.result==true){
					result.resolve({
						result: true
					});
					$scope.recycleQuery=data.recycleQuery;
				}else{
					result.resolve({
						result: false
					});
					$scope.isShowCardInfo=false;
				}				
			});
			return result;
			
		}
		
		// 提交表单
		$scope.submitRecycle = function(){
			if ($scope.add_recycleRecord_form.$valid) {
				if($scope.recycleQuery.packageStatus=='库存'){
					swal({
						  title: "",
						  text: "卡套餐状态为库存时不能回收!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
						});
				}else{
					var obj = {};
					obj.iccid=$scope.recycleQuery.iccid;
					obj.imsi=$scope.recycleQuery.imsi;
					obj.cardNo=$scope.recycleQuery.cardNo;
					if($scope.recycleQuery.opName=='移动'){
						obj.opName="1";
					}else if($scope.recycleQuery.opName=='电信'){
						obj.opName="2";
					}else if($scope.recycleQuery.opName=='联通'){
						obj.opName="3";
					}		
					obj.source="2";//1:开放平台 2:流量管理平台
					obj.spName=$scope.recycleQuery.spName;
					obj.recycleStatus=1;			
					obj.recycleReason=$scope.recycleRecord.recycleReason;
					obj.contactorName=$scope.recycleRecord.contactorName;
					obj.contactorTel=$scope.recycleRecord.contactorTel;
					
					//确定要提交
					swal({
						title: "",  
				        text: "确定申请回收?",  
				        type: "warning", 
				        showCancelButton: true, 
				        closeOnConfirm: false, 
				        confirmButtonText: "确定", 
				        cancelButtonText:"取消",  
				        animation:"slide-from-top"  
					},function() { 
						//提交
						recoveryService.saveRecycle(obj, function(data) {
							if (data.returnCode == 0) {
								swal({
								  title: "",
								  text: "申请回收成功!",
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
			}else {
				$scope.add_recycleRecord_form.submitted = true;
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('recovery').controller('createRecycleCtrl', createRecycleCtrl);
})(angular);
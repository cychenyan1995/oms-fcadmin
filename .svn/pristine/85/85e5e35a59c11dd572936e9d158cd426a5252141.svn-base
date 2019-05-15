(function(angular) {
	function createFlowPoolCtrl($scope, cardService, $filter, opService, SweetAlertX, $uibModalInstance, $q) {
		
		// 提交表单
		$scope.flowPool={};
		$scope.submitFlowPool = function(){
			if ($scope.create_from.$valid) {
				var obj = {};
				//实现逻辑
				
				obj.flowpoolName = $scope.flowPool.flowpoolName;
				obj.opId = $scope.flowPool.opId.number;
//				var pn1 = $scope.flowPool.postageId.number;
//				var pn2 = $scope.flowPool.postageId2.number;
				
				obj.postageId = [];
				
				for(var i=0,l=$scope.list.length; i<l; i++) {
					obj.postageId.push($scope.list[i].data.number);
					
				}
				obj.postageId = obj.postageId.join(',');
				obj.remark = $scope.flowPool.remark;
//				var flowPool = angular.extend({},$scope.flowPool);
				
				//确定要提交
				swal({
					title: "",  
			        text: "确定要提交这条数据？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top",
			        showLoaderOnConfirm: true 
				},function() { 
					//提交
					cardService.saveFlowPool(obj, function(data) {
						if (data.returnCode == 0) {
							swal({
							  title: "",
							  text: "已成功提交数据!",
							  timer: 1500,
							  type: "success",
							  showConfirmButton: false
							});
							
							//关闭弹框
							$uibModalInstance.close(data);
						} else {
							swal({
							  title: "",
							  text: "提交数据失败!",
							  timer: 1500,
							  type: "error",
							  showConfirmButton: false
							});
						}
					});
				});
			}else{
				$scope.create_from.submitted = true;
			}
		}
		
		//获取所有运营商名称
		opService.getOpAll(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var serviceList = [];
			serviceList.push({
				number : '',
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].opId,
					text : list[i].opName
				});
				//alert(list[i].text)
			}
			$scope.opList = serviceList;
		});
		
		//获取所有运营商名称
		opService.getPostagePlanAll(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var serviceList = [];
			serviceList.push({
				number : '',
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].postageId,
					text : list[i].postageName
				});
				//alert(list[i].text)
			}
			$scope.postagePlanList = serviceList;
		});
		
		$scope.asyncCallback = function(value) {
			var obj={};
			obj.flowpoolName = value;
			return cardService.existsByName(obj);
		}
		
		$scope.checkPostagePlan = function(value) {
			var obj={};
//			obj.flowpoolName = value;
			//cardService.getPostage({id:1});
			var id = value.number;
//			if(value.postageId){
//				id=$scope.flowPool.postageId.number;
//			}

			var result= $q.defer();
			cardService.getByPostageId({postageId:id}, function(data) {
				if (data.data != null) {
					 result.reject({result: false});
				} else {
					 result.resolve({result: true});
				}
			});	
			
			return result;
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};

		$scope.list = [{data: {}}];
		$scope.listIndex = ['一','二','三'];
		$scope.addInput = function (index) {
			if($scope.list.length < 3){
				$scope.list.splice(index+1,0,{data: {}});
			}else{
				
			}
		}
		$scope.delInput = function (index) {
			$scope.list.splice(index,1);
		}
	}
	angular.module('card').controller('createFlowPoolCtrl', createFlowPoolCtrl);
})(angular);
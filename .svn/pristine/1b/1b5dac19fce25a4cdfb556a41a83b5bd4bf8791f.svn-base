(function(angular) {
	//卡详情
	function operateCardDetailCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,flowcardService) {
		$scope.cardStatus = function(value){
			if (value == 0)
				return "测试期"
			else if (value == 1)
				return "库存期"
			else if (value == 2)
				return '沉默期'
			else if (value == 3)
				return '预约销户'
			else if (value == 4)
				return '正使用'
			else if (value == 5)
				return '停机'
			else if (value == 5)
				return '销户'
			return '--';
		}
		
		$scope.packageStatus = function(value) {
			if (value == 0)
				return "库存"
			else if (value == 1)
				return "已激活"
			else if (value == 2)
				return "已过期"
			return '--';
		}
		
		$scope.opOwned = function(value) {
			if(value == 1){
				return "移动"
			}else if(value == 2){
				return "电信"
			}else if(value == 3){
				return "联通"
			}else{
				return ""
			}
		};
		
		
		$scope.isAuthname=function(value,item){
			if (value == 0 && item == undefined)
				return "未提交"
			else if (value == 0 && item == 0)
				return "待审核"
			else if (value == 0 && item == 3)
				return '重新审核'
			else if (value == 1 && item == 1)
				return '审核通过'
			else if (value == 0 && item == 2)
				return '审核不通过'
			return '--';
		}
		
	
		
		$scope.splevel = function(value) {
			if(value == 1){
				return "一级"
			}else if(value == 2){
				return "二级"
			}else{
				return ""
			}
		};
		
		$scope.flowStatus=function(value){
			if (value == 1) {
				return "开通"
			}else if (value == 2) {
				return "未开通"
			}else {
				return ""
			}
		};
		
		$scope.pkStatus=function(value){
			if (value == 1) {
				return "开通"
			}else if (value == 2) {
				return "未开通"
			}else {
				return ""
			}
		};
		
		flowcardService.getCardDetail({cardId:param.cardId},function(result){
			var data=result.data;
			$scope.flowCard = data;
		});
		
		$scope.cancel = function() {
			$uibModalInstance.close(false);
		};
	}
	
	angular.module(flowcardModel).controller('operateCardDetailCtrl', operateCardDetailCtrl);
})(angular);
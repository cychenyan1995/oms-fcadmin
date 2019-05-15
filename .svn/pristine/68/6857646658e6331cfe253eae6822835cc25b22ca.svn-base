(function(angular) {
	//单卡启用操作
	function operateActiveCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,flowcardService) {
		$scope.flowcardData={iccid:param.iccid};
		$scope.activeCard = function() {
			if ($scope.active_form.$valid) {
				var description = $scope.flowcardData.description;
				flowcardService.openCards({list:param.list,imsi:param.imsi, description:description, opType:'0'}, function(data) {
					if (data.result) {
						swal({
							title: "",
							text: "启用操作成功!",
							timer: 3000,
							type: "success",
							showConfirmButton: false
						});
						$uibModalInstance.close(true);
					} else {
						swal({
							title: "",
							text: "启用操作失败!",
							timer: 3000,
							type: "error",
							showConfirmButton: false
						});
					}
				});
			}else{
				$scope.active_form.submitted = true;
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close(false);
		};
	}
	
	angular.module(flowcardModel).controller('operateActiveCtrl', operateActiveCtrl);
})(angular);
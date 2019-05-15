(function(angular) {
	//单卡停用操作
	function operateStopCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,flowcardService) {
		$scope.flowcardData={iccid:param.iccid};
		$scope.stopCard = function() {
			if ($scope.stop_form.$valid) {
				var description = $scope.flowcardData.description;
				flowcardService.stopCards({list:param.list, imsi:param.imsi, description:description, opType:'1'}, function(data) {
					if (data.result) {
						swal({
							title: "",
							text: "停用操作成功!",
							timer: 3000,
							type: "success",
							showConfirmButton: false
						});
						$uibModalInstance.close(true);
					} else {
						swal({
							title: "",
							text: "停用操作失败!",
							timer: 3000,
							type: "error",
							showConfirmButton: false
						});
					}
				});
			}else{
				$scope.stop_form.submitted = true;
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close(false);
		};
		
	}

	angular.module(flowcardModel).controller('operateStopCtrl', operateStopCtrl);
})(angular);
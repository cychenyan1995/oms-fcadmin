(function(angular) {
	function recycleCtrl($scope, param, recoveryService, $uibModalInstance) {

		//param 为打开页面传递过来的参数对象
		//alert(param.id)
		var obj = {};
		obj.recycleRecordId = param.recycleRecordId;
		recoveryService.toRecyclingOp(obj, function(data) {
			$scope.recycleQuery = data.data;
		});

		// 提交表单
		$scope.RecycleOp = function() {
			if ($scope.recycleQuery.packageStatus != '库存') {
				var obj = {};
				//实现逻辑
				obj.recycleRecordId = $scope.recycleQuery.recycleRecordId;
				obj.imsi = $scope.recycleQuery.imsi;
				obj.recycleReason = $scope.recycleQuery.recycleReason;
				//确定要提交
				swal({
					title : "",
					text : "确定要回收？",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : false,
					confirmButtonText : "确定",
					cancelButtonText : "取消",
					animation : "slide-from-top"
				}, function() {
					//提交
					recoveryService.recyclingOp(obj, function(data) {
						if (data.returnCode == 0) {
							swal({
								title : "",
								text : "回收成功!",
								timer : 1500,
								type : "success",
								showConfirmButton : false
							});
						} else {
							swal({
								title : "",
								text : data.message,
								timer : 1500,
								type : "error",
								showConfirmButton : false
							});
						}
						//关闭弹框
						$uibModalInstance.close(data);
					});
				});

			} else {
				swal({
					title : "错误",
					text : "卡套餐状态为库存时不能回收!",
					timer : 1500,
					type : "error",
					showConfirmButton : false
				});
			}
		}

		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('recovery').controller('recycleCtrl', recycleCtrl);
})(angular);
(function(angular) {
	function createLtOpCtrl($scope, opService, $uibModalInstance) {
			
		
		$scope.asyncCallback = function(value) {
			var obj = {};
			obj.opName=value;
			return opService.existsByName(obj);
		}
		// 提交表单
		$scope.submitOp = function(){
			if ($scope.add_Lt_form.$valid) {
				var obj = {};
				//实现逻辑
				obj=$scope.op;
				obj.owned=3;
				obj.opDesc=$scope.op.opName;
				//确定要提交
				swal({
					title: "",  
			        text: "确定新建联通账号？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top"  
				},function() { 
					//提交
					opService.saveOp(obj, function(data) {
						if (data.returnCode == 0) {
							swal({
							  title: "",
							  text: "新建成功!",
							  timer: 1500,
							  type: "success",
							  showConfirmButton: false
							});
							
							//关闭弹框
							$uibModalInstance.close(data);
						} else {
							swal({
							  title: "",
							  text: "新建失败!",
							  timer: 1500,
							  type: "error",
							  showConfirmButton: false
							});
						}
					});
				});
			}else {
				$scope.add_Lt_form.submitted = true;
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('op').controller('createLtOpCtrl', createLtOpCtrl);
})(angular);
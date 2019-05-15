(function(angular) {
	function createFlowCardCtrl($scope, cardService, $uibModalInstance) {
		
		// 提交表单
		$scope.submitFlowCard = function(){
			if ($scope.frm.$valid) {
				var obj = {};
				//实现逻辑
				
				//确定要提交
				swal({
					title: "",  
			        text: "确定要提交这条数据？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top"  
				},function() { 
					//提交
					cardService.saveFlowCard(obj, function(data) {
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
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('card').controller('createFlowCardCtrl', createFlowCardCtrl);
})(angular);
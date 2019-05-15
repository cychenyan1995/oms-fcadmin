(function(angular) {
	function deliveryCtrl($scope, orderService, outOrderQuery, FileUploader,SweetAlertX,
			$uibModalInstance) {
		$scope.outOrderQuery = outOrderQuery;

		var result;
		$scope.outOrderQuery.expressNo = "";
		$scope.outOrderQuery.expressPic = "";
		$scope.outOrderQuery.failReason = "";
		$scope.outOrderQuery.failReasonDesc = "";
		
		$scope.current_form;
		
		// 提交表单
		$scope.submitOutOrder = function() {
			if ($scope.current_form.$valid) {
				var obj = {};
				// 实现逻辑
	
				// var outOrder = $scope.outOrderQuery;
				// 获取服务名称
				// obj=outOrder;
				
				obj.outOrderId = outOrderQuery.outOrderId;
				if(result == 0){
					obj.expressNo = outOrderQuery.expressNo;// "E0656262"
					obj.expressPic = outOrderQuery.expressPic;// "E0656262"
					obj.status = 3;
				}else{
					obj.status = 4;
					obj.failReason = outOrderQuery.failReason;// outOrder.failReason
					if(outOrderQuery.failReason == 2){
						obj.failReasonDesc = outOrderQuery.failReasonDesc;
					}
				}
	
				// 确定要提交
				swal({
					title : "",
					text : "确定要提交这条数据？",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : false,
					confirmButtonText : "确定",
					cancelButtonText : "取消",
					animation : "slide-from-top",
					showLoaderOnConfirm: true 
				}, function() {
					// 提交
					orderService.addDeliveryResult(obj, function(data) {
	
						if (data.returnCode == 0) {
							swal({
								title : "",
								text : "已成功提交数据!",
								timer : 1500,
								type : "success",
								showConfirmButton : false
							});
	
							// 关闭弹框
							$uibModalInstance.close(data);
						} else {
							swal({
								title : "",
								text : "提交数据失败!",
								timer : 1500,
								type : "error",
								showConfirmButton : false
							});
						}
					});
				});
			}else{
				$scope.current_form.submitted = true;
			}
		}

		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};

		$scope.onDelivery = function(val) {
			result = val;
			if(val ==  0){
				$scope.current_form = $scope.outerForm.delivery_form;
			}else{
				$scope.current_form = $scope.outerForm.fail_form;
			}
		};

		var uploaderPhotos = $scope.uploaderPhotos = new FileUploader({
			url : "order/outorder/addExpressPic?type=1",
			autoUpload : true,// 添加后，自动上传
		});

		uploaderPhotos.filters.push({
            name: 'imageFilter',
            fn: function(item /*{File|FileLikeObject}*/, options) {
                var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
                if('|jpg|png|jpeg|gif|'.indexOf(type) !== -1){
                	return true;
               }else{
            	   	SweetAlertX.alert('','图片格式不正确','warning');
            	 	return false;
               }
            }
        });

		// 自己添加的，用于在移除图片时，重新计算
		$scope.uploaderPhotos.funcRemoveItem = function(fileItem) {

		};

		// 上传控件：回调响应：
		$scope.uploaderPhotos.onBeforeUploadItem = function(fileItem) {
			 var size=fileItem.file.size/1024;
	       	 if(size>500){
	       		 SweetAlertX.alert('','大小超过范围不能上传','warning');
	       		 $scope.uploaderPhotos.cancelItem(item) ; 
	       	 }

		}
		// 上传控件：回调响应：
		$scope.uploaderPhotos.onCompleteItem = function(item, response, status,headers) {
			if (status == "200") {
	           	 if(response!='1'){
	           		 $scope.expressPic = response;
	           		 $scope.outOrderQuery.expressPic = response;
	           	 }else{
	           		 SweetAlertX.alert('',"上传图片的分辨率有问题!", "warning");
	           	 }
            }
		};

		$scope.frChange = function() {
			var val = $("#frid").val();
			if (val == 2) {
				$("#fdescId").show();
			} else {
				$("#fdescId").hide();
			}
		};
	}

	angular.module('order').controller('deliveryCtrl', deliveryCtrl);
})(angular);
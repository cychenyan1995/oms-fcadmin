(function(angular) {
	//导入操作
	function importCardCtrl($scope, $uibModal,$uibModalInstance, $filter, $compile,$http,flowcardService) {
		
		$scope.importIsShow=false;
		$scope.loadShow=false;
		var importFileUrl = "";
		
		$scope.downloadTemplate = function (type) {
			var path = "cardmanage/downloadTemplate?downloadType="+type;
            location.href =path;
        }
		
		$scope.importCard = function(status) {
			var fd = new FormData();
			var file = document.querySelector('input[type=file]').files[0];
			if(file == undefined || file == ""){
				swal({
					title: "",
					text: "请选择导入文件!",
					timer: 2000,
					type: "warning",
					showConfirmButton: false
				});
				return;
			}
			$scope.loadShow=true;
			fd.append('file', file);
			$http({
				method : 'POST',
				url : "cardmanage/importCards",
				data : fd,
				headers : {
					'Content-Type' : undefined
				},
				transformRequest : angular.identity
			}).success(function(response) {
				var result = response.data[0];
				if (result != null) {
					if(result.isImported == 2 || result.isImported == 3){
						$scope.loadShow=false;
						var msg = result.cause;
						swal({
							title : "",
							text : msg,
							timer : 3000,
							type : "error",
							showConfirmButton : false
						});
					}else if(result.isImported == 1){
						$scope.loadShow=false;
						$scope.importIsShow=true;
						$scope.successCount = result.successCount;
						$scope.failCount = result.failCount;
						importFileUrl = result.url;
					}else if(result.isImported == 0){
						$scope.importIsShow=true;
						$scope.loadShow=false;
						$scope.successCount = result.successCount;
						$scope.failCount = result.failCount;
						importFileUrl = result.url;
					}
				}
			});
		};
		
		$scope.downloadFile = function () {
			if(importFileUrl != "" && importFileUrl != null && importFileUrl != "null"){
				location.href = importFileUrl;
			}
        }
		
		$scope.cancel = function() {
			$uibModalInstance.close();
		};
		
	}
	angular.module(flowcardModel).controller('importCardCtrl', importCardCtrl);
})(angular);
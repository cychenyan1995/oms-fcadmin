(function(angular) {
	function rechargeOrderListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, rechargeService, $templateRequest,
			$uibModal) {
		
		//搜索关键字
		$scope.rechargeOrderQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '创建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateRechargeOrderWindow();
			}
		},{
			text : '导出文件',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportRechargeOrderFile();
			}
		}])
		.withFixedColumns({
            leftColumns: 2,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : rechargeService.getRechargeOrderAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 1;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('option').withOption('width',64).withTitle('操作').renderWith(operate),
				DTColumnBuilder.newColumn('createTimeFormat').withOption('width',64).withTitle('创建时间'),
				DTColumnBuilder.newColumn('updateTimeFormat').withOption('width',64).withTitle('更新时间'),
				];
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			//if(node.status == 1){
				operateHtml = '<a href="javascript:;" ng-click="delRechargeOrder(\''+ node.orderId + '\')">删除</a> /';
				operateHtml += '<a href="javascript:;" ng-click="openEditRechargeOrderWindow(\''+ node.orderId + '\');">编辑</a>';
			//}
			return operateHtml;
		}
		
		// 搜索按钮
		$scope.rechargeOrderSearchForm = function() {
			$scope.dtInstance.query($scope.rechargeOrderQuery);
		};
		
		// 高级搜索按钮
		$scope.rechargeOrderHighSearchForm = function() {
			$scope.dtInstance.query($scope.rechargeOrderQuery);
			$scope.advanceExpand = !$scope.advanceExpand;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = !$scope.advanceExpand;
			$scope.rechargeOrderQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var rechargeOrder = $scope.rechargeOrderQuery;
			
		};
		
		// 打开创建窗口
		$scope.openCreateRechargeOrderWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/recharge/rechargeorder/view/create.html',
				controller : 'createRechargeOrderCtrl',
				size : 'lg',
				resolve : {
					param : function() {
						return {};
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		};
		
		
		// 打开编辑窗口
		$scope.openEditRechargeOrderWindow = function(id) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/recharge/rechargeorder/view/edit.html',
				controller : 'editRechargeOrderCtrl',
				size : 'lg',
				resolve : {
					param : function() {
						//把参数id传递给编辑页面edit.html，在editCtrl注入
						return  {
							id:id
						};
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		};
		
		// 导出excel文件
		$scope.exportRechargeOrderFile = function() {
			var obj = {};
			rechargeService.exportRechargeOrderFile(obj, function(data) {
				if (data.returnCode == 0) {
					swal({
	        			title: "导出成功!",
	            	    text: "<div class=\"text-center link-block\"><a href=\"http://下载URL\" style=\"font-size: 18px;\">点击下载</a></div>",
	            	    type: "success",
	            	    html: true,
	            	    showCancelButton: false,
	            	    confirmButtonText: "关闭",
	            	    closeOnConfirm: true,
	            	    animation:"slide-from-top"});
				} else {
					swal({
						  title: "",
						  text: "导出失败!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
					});
				}
			});
		};
		
		// 删除记录
		$scope.delRechargeOrder = function(id){
			swal({
				title: "",  
		        text: "确定要删除这条数据？",  
		        type: "warning", 
		        showCancelButton: true, 
		        closeOnConfirm: false, 
		        confirmButtonText: "确定", 
		        cancelButtonText:"取消",  
		        animation:"slide-from-top"  
			},function() { 
				rechargeService.delRechargeOrder({
					id : id
				}, function(data) {
					if (data.returnCode == 0) {
						swal({
						  title: "",
						  text: "已成功删除数据!",
						  timer: 1500,
						  type: "success",
						  showConfirmButton: false
						});
						
						// 删除之后重新查询列表
						$scope.dtInstance.query({});
					} else {
						swal({
						  title: "",
						  text: "删除操作失败!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
						});
					}
				});
			});
		};
	}

	angular.module('recharge').controller('rechargeOrderListCtrl', rechargeOrderListCtrl);
})(angular);

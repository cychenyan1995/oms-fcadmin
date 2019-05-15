(function(angular) {
	function flowPackageListListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, spService, $templateRequest,
			$uibModal) {
		
		//搜索关键字
		$scope.flowPackageListQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '创建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateFlowPackageListWindow();
			}
		},{
			text : '导出文件',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportFlowPackageListFile();
			}
		}])
		.withFixedColumns({
            leftColumns: 2,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : spService.getFlowPackageListAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 3;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('option').withOption('width',64).withTitle('操作').renderWith(operate),
				DTColumnBuilder.newColumn('createTimeFormat').withOption('width',64).withTitle('创建时间'),
				DTColumnBuilder.newColumn('updateTimeFormat').withOption('width',64).withTitle('更新时间'),
				DTColumnBuilder.newColumn('lastOperatorId').withOption('width',64).withTitle('最后操作人ID'),
				DTColumnBuilder.newColumn('lastOperatorName').withOption('width',64).withTitle('最后操作人名称')
				];
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			//if(node.status == 1){
				operateHtml = '<a href="javascript:;" ng-click="delFlowPackageList(\''+ node.flowlistId + '\')">删除</a> /';
				operateHtml += '<a href="javascript:;" ng-click="openEditFlowPackageListWindow(\''+ node.flowlistId + '\');">编辑</a>';
			//}
			return operateHtml;
		}
		
		// 搜索按钮
		$scope.flowPackageListSearchForm = function() {
			$scope.dtInstance.query($scope.flowPackageListQuery);
		};
		
		// 高级搜索按钮
		$scope.flowPackageListHighSearchForm = function() {
			$scope.dtInstance.query($scope.flowPackageListQuery);
			$scope.advanceExpand = !$scope.advanceExpand;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = !$scope.advanceExpand;
			$scope.flowPackageListQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var flowPackageList = $scope.flowPackageListQuery;
			
		};
		
		// 打开创建窗口
		$scope.openCreateFlowPackageListWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/sp/flowpackagelist/view/create.html',
				controller : 'createFlowPackageListCtrl',
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
		$scope.openEditFlowPackageListWindow = function(id) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/sp/flowpackagelist/view/edit.html',
				controller : 'editFlowPackageListCtrl',
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
		$scope.exportFlowPackageListFile = function() {
			var obj = {};
			spService.exportFlowPackageListFile(obj, function(data) {
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
		$scope.delFlowPackageList = function(id){
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
				spService.delFlowPackageList({
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

	angular.module('sp').controller('flowPackageListListCtrl', flowPackageListListCtrl);
})(angular);

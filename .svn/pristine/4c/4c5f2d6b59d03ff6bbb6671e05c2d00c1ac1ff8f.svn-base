(function(angular) {
	function spListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, spService, $templateRequest,$filter,
			$uibModal) {
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '创建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateSpWindow();
			}
		}]);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : spService.getSpList
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 8;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column   .withOption('ellipsis',true)
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('spCode').withOption('width',64).withTitle('商户号'),
				DTColumnBuilder.newColumn('spName').withOption('width',98).withOption('ellipsis',true).withTitle('商户名称'),
				DTColumnBuilder.newColumn('level').withOption('width',28).withTitle('级别').renderWith(setLevel),
				DTColumnBuilder.newColumn('parentSpCode').withOption('width',64).withTitle('隶属商户号').renderWith(setParentSpCode),
				DTColumnBuilder.newColumn('parentSpName').withOption('width',98).withOption('ellipsis',true).withTitle('隶属商户名称').renderWith(setParentSpName),
				DTColumnBuilder.newColumn('contactperson').withOption('width',64).withOption('ellipsis',true).withTitle('联系人'),
				DTColumnBuilder.newColumn('contactphone').withOption('width',80).withTitle('联系电话'),
				DTColumnBuilder.newColumn('commAddr').withOption('width',128).withOption('ellipsis',true).withTitle('联系地址'),
				DTColumnBuilder.newColumn('registryDate').withOption('width',columnWidth).withTitle('创建时间').renderWith(setRegistryDate),
				DTColumnBuilder.newColumn('option').withOption('width',64).withTitle('操作').renderWith(operate)
				];
		
		function setLevel(e, dt, node, config){
			if(node.level==1){
				return "一级";
			}else if(node.level==2){
				return "二级";
			}else if(node.level==3){
				return "三级";
			}else if(node.level==4){
				return "四级";
			}else{
				return "--";
			}
		}
		
		function setParentSpCode(e, dt, node, config){		//e
			if(node.parentSpCode==0){
				return "--"
			}else{
				return node.parentSpCode;
			}
		}
		
		function setParentSpName(e, dt, node, config){
			if(node.parentSpName==0){
				return "--"
			}else{
				return node.parentSpName;
			}
		}
		
		function setRegistryDate(e, dt, node, config){
			return $filter('date')(node.registryDate,'yyyy-MM-dd HH:mm:ss')
		}
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			operateHtml = '<a href="javascript:;" ng-click="openEditSpWindow(\''+ node.spId + '\');">编辑</a> /';
			operateHtml += '<a href="javascript:;" ng-click="deleteSpById(\''+ node.spId + '\')">删除</a>';
			return operateHtml;
		}
		
		// 打开创建窗口
		$scope.openCreateSpWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/sp/sp/view/create.html',
				controller : 'createSpCtrl',
				//size : 'lg',
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
		$scope.openEditSpWindow = function(id) {
			spService.getSpdetail({spId : id},function(data){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
				var modalInstance = $uibModal.open({
					templateUrl : 'biz/sp/sp/view/edit.html',
					controller : 'editSpCtrl',
					//size : 'mdx',
					resolve : {
						param : function() {
							return data || {}
						}
					}
				});
				// 提交之后重新查询列表
				modalInstance.result.then(function(data) {
					$scope.dtInstance.query({});
				});
			})
		};
		
		// 删除记录
		$scope.deleteSpById = function(id){
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
				spService.deleteSpById({
					spId : id
				}, function(data) {
					if(data.returnCode == -1){
						//不可删除
						swal({
							  title: "",
							  text: "该商户已被使用,不能删除!",
							  timer: 1500,
							  type: "error",
							  showConfirmButton: false
							});
						
						$scope.dtInstance.query({});
					}else if(data.returnCode == -2){
						//不可删除
						swal({
							  title: "",
							  text: "该商户有下级商户,不能删除!",
							  timer: 1500,
							  type: "error",
							  showConfirmButton: false
							});
						
						$scope.dtInstance.query({});
					}else if (data.returnCode == 0) {
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

	angular.module('sp').controller('spListCtrl', spListCtrl);
})(angular);

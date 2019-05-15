(function(angular) {
	function outOrderListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, orderService, spService, pkgService, $templateRequest,
			$uibModal) {
		
		//搜索关键字
		$scope.outOrderQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '导出',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportOutOrderFile();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : orderService.getOutOrderAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		$scope.statusList = [
		                      { number: '', text: '全部'}, 
		                      { number: 1, text: '待发货'},
		                      { number: 2, text: '已取消'}, 
		                      { number: 3, text: '已发货'}, 
		                      { number: 4, text: '发货失败'}];
		
		$scope.cardTypeList = [
		                      { number: '', text: '全部'}, 
		                      { number: 1, text: '工业贴片卡'},
		                      { number: 2, text: '工业大卡'}, 
		                      { number: 3, text: '双切卡'}];
		
		var screenWidth = $(window).width() - 512;
		var percent = 7;
		var columnWidth = screenWidth/percent;

		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('option').withOption('width',64).withTitle('操作').renderWith(operate),
		        DTColumnBuilder.newColumn('outOrderNo').withOption('width',columnWidth + 36).withTitle('订单编号'),
		        DTColumnBuilder.newColumn('packageName').withOption('width',columnWidth + 96).withTitle('套餐名称'),
		        DTColumnBuilder.newColumn('cardType').withOption('width',128).withTitle('卡类型').renderWith(setCartType),
		        DTColumnBuilder.newColumn('totalCard').withOption('width',128).withTitle('数量'),
		        DTColumnBuilder.newColumn('totalPrice').withOption('width',128).withTitle('总价'),
		        DTColumnBuilder.newColumn('spName').withOption('width',columnWidth + 66).withTitle('请求商户').renderWith(setSpName),
		        DTColumnBuilder.newColumn('status').withOption('width',128).withTitle('订单状态').renderWith(setStatus),
		        DTColumnBuilder.newColumn('expressNo').withOption('width',128).withOption('ellipsis',true).withTitle('发货详情').renderWith(expressDetail),
		        DTColumnBuilder.newColumn('recipients').withOption('width',128).withOption('ellipsis',true).withTitle('收货人信息').renderWith(recipients),
		        DTColumnBuilder.newColumn('orderTime').withOption('width',columnWidth + 36).withTitle('订单时间'),
		        DTColumnBuilder.newColumn('postTime').withOption('width',columnWidth + 36).withTitle('发货时间')
				];
		
		function setCartType(e, dt, node, config) {
			if (node.cardType == 0)
				return "通用"
			else if (node.cardType == 1)
				return "工业贴片卡"
			else if (node.cardType == 2)
				return '工业大卡'
			else if (node.cardType == 3)
				return '双切卡'
			return '--';
		}
		
		function setStatus(e, dt, node, config) {
			if (node.status == 1)
				return "待发货"
			else if (node.status == 2)
				return '已取消'
			else if (node.status == 3)
				return '<span style="color:green;">已发货</span>'
			else if (node.status == 4)
				return '<span style="color:red;">发货失败</span>'
			return '--';
		}
		
		function expressDetail(e, dt, node, config) {
			if(node.expressNo != null && node.expressNo != '')
			{
				if(node.status == 3){
					return '<a href="javascript:;" ng-click="expressDetail(item);">'+ node.expressNo +'</a>';
				}else{
					return node.expressNo;
				}
			}else{
				if (node.failReason == 1)
					return "缺货"
				else if (node.failReason == 2)
					return node.failReasonDesc
				return '';
			}
		}
		
		function recipients(e, dt, node, config) {
			return '<a href="javascript:;" ng-click="recipientsDetail(item);">'+ node.recipients +'</a>';
		}
		
		function setSpName(e, dt, node, config) {
			if(node.spCode != null && node.spName != null){
				return node.spCode + "/" + node.spName; 
			}else{
				return "";
			}
		}
		
		//获取所有服务商名称
		spService.getSp(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var serviceList = [];
			serviceList.push({
				number : null,
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].spCode,
					text : list[i].spCode+"/"+list[i].spName
				});
				//alert(list[i].text)
			}
			$scope.serviceList = serviceList;
		});
		
		pkgService.getFlowPackageAll(function(datas) {
			var list= datas.data;
			var pkgServiceList = [];
			pkgServiceList.push({
				packageCode : null,
				text : '全部'
			});
			//$scope.outOrderQuery.packageName = pkgServiceList[0];
			for (var i = 0; i < list.length; i++) {
				pkgServiceList.push({
					packageCode : list[i].packageCode,
					text : list[i].packageCode+"/"+list[i].packageName
				});
			}
			$scope.pkgServiceList = pkgServiceList;
		});
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			if(node.status == 1){
				operateHtml = '<a href="javascript:;" ng-click="openCreateDeliveryWindow(item);">发货</a>';
			}
			return operateHtml;
		}
		
		// 搜索按钮
		$scope.outOrderSearchForm = function() {
			$scope.resetForm();
			
			$scope.dtInstance.query($scope.outOrderQuery);
		};
		
		// 高级搜索按钮
		$scope.outOrderHighSearchForm = function() {
			var outOrderQuery = angular.extend({},$scope.outOrderQuery);
			
			//发货时间
			if (outOrderQuery.orderTime && outOrderQuery.orderTime.startDate
					&& outOrderQuery.orderTime.endDate) {
				var startTime = outOrderQuery.orderTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = outOrderQuery.orderTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				outOrderQuery.orderBegintime = startTime;
				outOrderQuery.orderEndtime = endTime;
			}
			
			$scope.outOrderQuery.spName && (outOrderQuery.spName = $scope.outOrderQuery.spName.number);
			$scope.outOrderQuery.packageName && (outOrderQuery.packageName = $scope.outOrderQuery.packageName.packageCode);
			
			$scope.outOrderQuery.status && (outOrderQuery.status = $scope.outOrderQuery.status.number);
			$scope.outOrderQuery.cardType && (outOrderQuery.cardType = $scope.outOrderQuery.cardType.number);
			
			//outOrderQuery.packageName = $scope.outOrderQuery.packageName.packageCode;
			$scope.dtInstance.query(outOrderQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
			
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.outOrderQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.outOrderQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var outOrder = $scope.outOrderQuery;
			outOrder.orderTime = null;
			outOrder.outOrderNo = null;
			outOrder.status = null;
			outOrder.packageName = null;
			outOrder.cardType = null;
			outOrder.spName = null;
			outOrder.recipients = null;
		};
		
		// 打开发货创建窗口
		$scope.openCreateDeliveryWindow = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/order/outorder/view/delivery.html',
				controller : 'deliveryCtrl',
				//size : 'lg',
				resolve : {
					outOrderQuery : function() {
						//把参数id传递给编辑页面edit.html，在editCtrl注入
						return item;
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		};
		
		// 打开创建窗口
		$scope.openCreateOutOrderWindow = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/order/outorder/view/create.html',
				controller : 'createOutOrderCtrl',
				size : 'lg',
				resolve : {
					param : function() {
						//把参数id传递给编辑页面edit.html，在editCtrl注入
						return item;
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		};
		
		
		// 打开编辑窗口
		$scope.openEditOutOrderWindow = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/order/outorder/view/edit.html',
				controller : 'editOutOrderCtrl',
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
		
		$scope.expressDetail = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/order/outorder/view/expressDetail.html',
				controller : 'orderDetailCtrl',
				resolve : {
					orderDetail : function() {
						//把参数id传递给编辑页面edit.html，在editCtrl注入
						return item;
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
//				$scope.dtInstance.query({});
			});
			
		};
		
		// 打开收货人信息窗口
		$scope.recipientsDetail = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'detail.html',
				controller : 'orderDetailCtrl',
				resolve : {
					orderDetail : function() {
						//把参数id传递给编辑页面edit.html，在editCtrl注入
						return item;
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
//				$scope.dtInstance.query({});
			});
			
		};
		
		// 高级搜索层控制
//		$scope.toggleAdvance = function() {
//			// 关闭高级搜索框
//			$scope.advanceExpand = !$scope.advanceExpand;
//			$scope.outOrderQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
//		};
		
		// 导出excel文件
		$scope.exportOutOrderFile = function() {
			var obj = {};
			
			var outOrderQuery = angular.extend({},$scope.outOrderQuery);
			
			if (outOrderQuery.orderTime && outOrderQuery.orderTime.startDate
					&& outOrderQuery.orderTime.endDate) {
				var startTime = outOrderQuery.orderTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = outOrderQuery.orderTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				outOrderQuery.orderBegintime = startTime;
				outOrderQuery.orderEndtime = endTime;
			}
			outOrderQuery.orderTime = "";
			
			orderService.exportOutOrderFile(outOrderQuery, function(data) {
				if (data.returnCode == 0) {
					swal({
	        			title: "导出成功!",
	            	    text: "",
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
		$scope.delOutOrder = function(id){
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
				orderService.delOutOrder({
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
	
	function orderDetailCtrl ($scope,$uibModalInstance,orderDetail){
		$scope.outOrderQuery = orderDetail;
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}

	angular.module('order')
	.controller('outOrderListCtrl', outOrderListCtrl)
//	.controller('deliveryCtrl', deliveryCtrl)
	.controller('orderDetailCtrl', orderDetailCtrl);
})(angular);

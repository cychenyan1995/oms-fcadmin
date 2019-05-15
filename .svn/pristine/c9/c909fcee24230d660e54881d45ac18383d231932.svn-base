(function(angular) {
	function renewPackageListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,$filter,
			$state, $rootScope, $compile, pkgService,$templateRequest,spService,
			$uibModal) {
		
		//搜索关键字
		$scope.flowPackageQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '创建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateFlowPackageWindow();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",false);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				/*serverData : function(param){
					angular.extend(param, $scope.flowPackageQuery);
	            	return pkgService.getRenewPackageAll(param);
	            }*/
			serverData: pkgService.getRenewPackageAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		pkgService.getRenewPackageAll(function(datas) {
			var list= datas.data;
			var pkgServiceList = [];
			pkgServiceList.push({
				packageCode : null,
				text : '全部'
			});
			//$scope.outOrderQuery.packageName = pkgServiceList[0];
			for (var i = 0; i < list.length; i++) {
				if(list[i].packageType != 1){
					pkgServiceList.push({
						number : list[i].packageId,
						text : list[i].packageCode+"/"+list[i].packageName
					});
				}
			}
			$scope.pkgServiceList = pkgServiceList;
		});
		
		//获取所有服务商名称
		spService.getSp(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var serviceList = [];
			serviceList.push({
				number : null,
				text : '全部'
			});
			serviceList.push({
				number : 1,
				text : '通用'
			});
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].spId,
					text : list[i].spCode +"/"+ list[i].spName
				});
			}
			$scope.serviceList = serviceList;
		});
		
		
		$scope.statusList = [
			                      { number: null, text: '全部'}, 
			                      { number: 1, text: '已上架'}, 
			                      { number: 2, text: '已下架'}];
		$scope.packageTypeList = [
		                      { number: null, text: '全部'}, 
		                      { number: 2, text: '流量套餐'}, 
		                      { number: 3, text: '流量包'}];
		
		$scope.ownedList = [
			                      { number: null, text: '全部'}, 
			                      { number: 1, text: '移动'}, 
			                      { number: 2, text: '电信'}, 
			                      { number: 3, text: '联通'}];
		
		$scope.isSeparateBillList = [
			                      { number: null, text: '全部'}, 
			                      { number: 0, text: '不支持'}, 
			                      { number: 1, text: '支持'}];
		
		var screenWidth = $(window).width() - 512;
		var percent = 6;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('packageCode').withOption('width',columnWidth - 20).withOption('ellipsis',true).withTitle('套餐编号'),
				DTColumnBuilder.newColumn('packageName').withOption('width',columnWidth + 80).withOption('ellipsis',true).withTitle('套餐名称').renderWith(packageName),
				DTColumnBuilder.newColumn('packageAlias').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐别名'),
				DTColumnBuilder.newColumn('spName').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('服务商名称').renderWith(spName),
				
				DTColumnBuilder.newColumn('owned').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('运营商类型').renderWith(opName),
				DTColumnBuilder.newColumn('isSeparateBill').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('支持分离计费').renderWith(isSeparateBill),
				DTColumnBuilder.newColumn('status').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐状态').renderWith(status),
				DTColumnBuilder.newColumn('packageType').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('流量类别').renderWith(packageType),
				DTColumnBuilder.newColumn('flowservType').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐一流量类型').renderWith(flowservType),
				DTColumnBuilder.newColumn('totalFlow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐一流量').renderWith(totalFlow),
				/*DTColumnBuilder.newColumn('status').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐二流量类型'),
				DTColumnBuilder.newColumn('status').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐二流量'),*/
				
				DTColumnBuilder.newColumn('packagePrice').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('价格（元）').renderWith(packagePrice),
				DTColumnBuilder.newColumn('validCycle').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('有效期').renderWith(validCycle),
				/*DTColumnBuilder.newColumn('autoactivePackageDays').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('激活宽限期').renderWith(autoactivePackageDays),*/
				DTColumnBuilder.newColumn('option').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('操作').renderWith(operate),
				
				DTColumnBuilder.newColumn('createTime').withOption('width',columnWidth + 32).withTitle('创建时间').renderWith(
						function(e, dt, node, config) {
							return $filter('date')(node.createTime,
									'yyyy-MM-dd HH:mm:ss')
						}),
				DTColumnBuilder.newColumn('updateTime').withOption('width',columnWidth + 32).withTitle('更新时间').renderWith(
						function(e, dt, node, config) {
							return $filter('date')(node.updateTime,
									'yyyy-MM-dd HH:mm:ss')
						})
				];
		
		function packageName(e, dt, node, config) {
			if(node.packageName != null){
				return operateHtml = '<a href="javascript:;" ng-click="renewPackageDetail(item);">'+ node.packageName +'</a>';
			}else{
				return "";
			}
		}
		
		function packagePrice(e, dt, node, config) {
			if(node.packagePrice != null){
				return node.packagePrice;
			}else{
				return "";
			}
		}
		
		function opName(e, dt, node, config){
			if(node.owned == 1){
				return '移动';
			}else if(node.owned == 2){
				return "电信";
			}else if(node.owned == 3){
				return "联通";
			}else{
				return "";
			}
		}
		
		function packageType(e, dt, node, config){
			if(node.packageType == 2){
				return '流量套餐';
			}else if(node.packageType == 3){
				return "流量包";
			}else{
				return "";
			}
		}
		
		function flowservType(e, dt, node, config){
			if(node.flowservType == 0){
				return '总流量';
			}else if(node.flowservType == 1){
				return "月付流量";
			}else{
				return "其他";
			}
		}
		
		function totalFlow(e, dt, node, config){
			if(node.isUnlimitFlow == 0){
				if(node.flowservType == 1){
					return node.perCycleFlow +node.flowUnit +"/月*"+ node.chargeCycle +"月";
				}
				return node.totalFlow + node.flowUnit;
			}else{
				return "不限流量";
			}
		}
		
		function spName(e, dt, node, config){
			if(node.spName == null){
				return '';
			}else{
				return node.spName;
			}
		}
		
		function isSeparateBill(e, dt, node, config){
			if(node.isSeparateBill == 0){
				return '不支持';
			}else{
				return '支持';
			}
		}
		
		function status(e, dt, node, config){
			if(node.status == 1){
				return '<span style="color:green;">已上架</span>';
			}else if(node.status == 2){
				return '<span style="color:red;">已下架</span>';
			}else{
				return '';
			}
		}
		
		function validCycle(e, dt, node, config) {
			if(node.validCycle == null){
				return "";
			}
			
			var operateHtml = '';
			if(node.validCycleUnit == 0){
				operateHtml = node.validCycle + "天";
			}else{
				operateHtml = node.validCycle + "个月";
			}
			return operateHtml;
		}
		
		function autoactivePackageDays(e, dt, node, config) {
			var operateHtml = '';
			if(node.autoactivePackageDays != null){
				operateHtml = node.autoactivePackageDays + "天";
			}
			return operateHtml;
		}
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			if(node.status == 1){
				//'<a href="javascript:;" ng-click="changePackageStatus(\''+ node.packageId +'\',\''+ node.status + '\')">下架</a>';
				operateHtml = '<a href="javascript:;" ng-click="changePackageStatus(item)">下架</a>';
			}else{
				operateHtml += '<a href="javascript:;" ng-click="changePackageStatus(item)">上架</a>';
			}
			return operateHtml;
		}
		
		// 搜索按钮
		$scope.flowPackageSearchForm = function() {
			$scope.resetForm();
			$scope.dtInstance.query($scope.flowPackageQuery);
		};
		
		// 高级搜索按钮
		$scope.flowPackageHighSearchForm = function() {
			var flowPackageQuery = angular.extend({},$scope.flowPackageQuery);
			
			$scope.flowPackageQuery.packageId && (flowPackageQuery.packageId = $scope.flowPackageQuery.packageId.number);
			$scope.flowPackageQuery.spId && (flowPackageQuery.spId = $scope.flowPackageQuery.spId.number);
			$scope.flowPackageQuery.status && (flowPackageQuery.status = $scope.flowPackageQuery.status.number);
			$scope.flowPackageQuery.owned && (flowPackageQuery.owned = $scope.flowPackageQuery.owned.number);
			$scope.flowPackageQuery.isSeparateBill && (flowPackageQuery.isSeparateBill = $scope.flowPackageQuery.isSeparateBill.number);
			
			$scope.flowPackageQuery.packageType && (flowPackageQuery.packageType = $scope.flowPackageQuery.packageType.number);
			
			$scope.dtInstance.query(flowPackageQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.flowPackageQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.flowPackageQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var flowPackage = $scope.flowPackageQuery;
			flowPackage.packageId = null;
			flowPackage.status = null;
			flowPackage.packageType = null;
			flowPackage.owned = null;
			flowPackage.isSeparateBill = null;
			flowPackage.spId = null;
		};
		
		// 打开创建窗口
		$scope.openCreateFlowPackageWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/pkg/renewpackage/view/create.html',
				controller : 'createRenewPackageCtrl',
				// size : 'lg',
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
		$scope.openEditFlowPackageWindow = function(id) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/pkg/flowpackage/view/edit.html',
				controller : 'editFlowPackageCtrl',
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
		
		$scope.renewPackageDetail = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/pkg/renewpackage/view/detail.html',
				controller : 'renewPackageDetailCtrl',
                //size : 'lg',
				resolve : {
					param : function() {
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
		
		// 导出excel文件
		$scope.exportFlowPackageFile = function() {
			var obj = {};
			pkgService.exportFlowPackageFile(obj, function(data) {
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
		
		// 上下架
		$scope.changePackageStatus = function(item){
			var statusDesc = "下架";
			if(item.status == 2){
				statusDesc = "上架";
			}
			swal({
				title: "",  
		        text: "请确定是否"+statusDesc+"该套餐？",  
		        type: "warning", 
		        showCancelButton: true, 
		        closeOnConfirm: false, 
		        confirmButtonText: "确定", 
		        cancelButtonText:"取消",  
		        animation:"slide-from-top",
		        showLoaderOnConfirm: true 
			},function() { 
				pkgService.changePackageStatus({
					packageId : item.packageId,
                    packageCode : item.packageCode,
					status : item.status
				}, function(data) {
					if (data.returnCode == 0) {
						swal({
						  title: "",
						  text: statusDesc + "成功!",
						  timer: 1500,
						  type: "success",
						  showConfirmButton: false
						});
						
						// 删除之后重新查询列表
						$scope.dtInstance.query({});
					} else {
						swal({
						  title: "",
						  text: statusDesc + "失败!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
						});
					}
				});
			});
		};
		
		$scope.delFlowPackage = function(id){
			swal({
				title: "",  
		        text: "请确定是否删除该套餐？",  
		        type: "warning", 
		        showCancelButton: true, 
		        closeOnConfirm: false, 
		        confirmButtonText: "确定", 
		        cancelButtonText:"取消",  
		        animation:"slide-from-top"  
			},function() { 
				pkgService.delFlowPackage({
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
	
	function renewPackageDetailCtrl($scope,$uibModalInstance,param){
		$scope.flowPackageQuery = param;
		
		if($scope.flowPackageQuery.flowservType == 0){
			$scope.totalFlowHide = false;
			$scope.monthFlowHide = true;
		}else{
			$scope.totalFlowHide = true;
			$scope.monthFlowHide = false;
		}
		
		if($scope.flowPackageQuery.isUnlimitFlow == 0){
			$scope.flowPackageQuery.showFlow = $scope.flowPackageQuery.totalFlow+$scope.flowPackageQuery.flowUnit;
		}else if($scope.flowPackageQuery.isUnlimitFlow == 1){
			$scope.flowPackageQuery.showFlow = "不限流量";
		}
		
		$scope.opOwned = function(value) {
			if(value == 1){
				return "移动"
			}else if(value == 2){
				return "电信"
			}else if(value == 3){
				return "联通"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.isSeparateBill = function(value) {
			if(value == 0){
				return "不支持"
			}else if(value == 1){
				return "支持"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.flowservType = function(value) {
			if(value == 0){
				return "总流量"
			}else if(value == 1){
				return "月付流量"
			}else{
				return "其他"
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.overFlowOp = function(value) {
			if(value == 0){
				return "维持现状"
			}else if(value == 1){
				return "停用"
			}else if(value == 2){
				return "变更通讯计划"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.packageType = function(value) {
			if(value == 2){
				return "流量套餐"
			}else if(value == 3){
				return "流量包"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.validCycleUnit = function(value) {
			if(value == 0){
				return "天"
			}else if(value == 1){
				return "个月"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.isMonthClean = function(value) {
			if(value == 0){
				return "不清零"
			}else if(value == 1){
				return "清零"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		$scope.isNowApply = function(value) {
			if(value == 0){
				return "下期生效"
			}else if(value == 1){
				return "立即生效"
			}else{
				return ""
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}

	angular.module('pkg')
		.controller('renewPackageListCtrl', renewPackageListCtrl)
		.controller('renewPackageDetailCtrl',renewPackageDetailCtrl);
})(angular);

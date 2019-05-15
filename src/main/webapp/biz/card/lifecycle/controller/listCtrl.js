(function(angular) {
	function lifeCycleListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, cardService, $templateRequest,
			$uibModal,$filter,opService,FileUploader) {
		
		//搜索关键字
		$scope.lifeCycleQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '出库',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openStockCard();
			}
		},{
			text : '导出',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportLifeCycleFile();
			}
		}]);
		
		//卡状态列表
		$scope.statusList = [
            { number: null, text: '全部'}, 
            { number: 0, text: '可测试'}, 
            { number: 1, text: '库存'}, 
            { number: 3, text: '可激活'}, 
            { number: 4, text: '已激活'}, 
            { number: 5, text: '已停用'},
            { number: 6, text: '已销卡'}];
		
		//卡类型列表
		$scope.cardTypeList = [
            { number: null, text: '全部'}, 
            { number: 1, text: '工业贴片卡'}, 
            { number: 2, text: '工业大卡'}, 
            { number: 3, text: '双切卡'}];
		
		//获取所有服务商名称
		opService.getOp(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var opList = [];
			opList.push({
				number : null,
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				opList.push({
					number : list[i].opId,
					text : list[i].opName
				});
			}
			$scope.opList = opList;
		});
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : cardService.getLifeCycleAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('iccid').withOption('width',80).withTitle('ICCID'),
				DTColumnBuilder.newColumn('imsi').withOption('width',64).withTitle('IMSI'),
				DTColumnBuilder.newColumn('cardNo').withOption('width',64).withTitle('网卡号'),
				DTColumnBuilder.newColumn('status').withOption('width',50).withTitle('卡类型').renderWith(cardType),
				DTColumnBuilder.newColumn('cardType').withOption('width',50).withTitle('卡状态').renderWith(cardStatus),
				DTColumnBuilder.newColumn('opName').withOption('width',64).withTitle('运营商名称'),
				DTColumnBuilder.newColumn('deliveryTime').withOption('width',64).withTitle('运营商发货时间')];
		
		//卡类型
		function cardType(e, dt, node, config) {
			if (node.cardType == 1)
				return "工业贴片卡"
			else if (node.cardType == 2)
				return "工业大卡"
			else if (node.cardType == 3)
				return "双切卡"
			return '--';
		}
		
		//卡状态
		function cardStatus(e, dt, node, config) {
			if (node.status == 0)
				return '<span style="color:orange;">可测试</span>'
			else if (node.status == 1)
				return "库存"
			else if (node.status == 3)
				return '<span style="color:orange;">可激活</span>'
			else if (node.status == 4)
				return '<span style="color:green;">已激活</span>'
			else if (node.status == 5)
				return '<span style="color:red;">已停用</span>'
			else if (node.status == 6)
				return '<span style="color:red;">已销卡</span>'
			return '--';
		}

		// 搜索按钮
		$scope.lifeCycleSearchForm = function() {
			$scope.dtInstance.query($scope.lifeCycleQuery);
		};
		
		// 高级搜索按钮
		$scope.lifeCycleHighSearchForm = function() {
			
			var lifeCycleQuery = angular.extend({},$scope.lifeCycleQuery);
			
			if(null != $scope.lifeCycleQuery.cardType){
				lifeCycleQuery.cardType = $scope.lifeCycleQuery.cardType.number;
			}
			
			if(null != $scope.lifeCycleQuery.status){
				lifeCycleQuery.status = $scope.lifeCycleQuery.status.number;
			}
			
			if(null != $scope.lifeCycleQuery.opId){
				lifeCycleQuery.opId = $scope.lifeCycleQuery.opId.number;
			}
			
			//运营商发货时间
			if (lifeCycleQuery.deliveryTime && lifeCycleQuery.deliveryTime.startDate
					&& lifeCycleQuery.deliveryTime.endDate) {
				var startTime = lifeCycleQuery.deliveryTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = lifeCycleQuery.deliveryTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				lifeCycleQuery.deliveryStarttime = startTime;
				lifeCycleQuery.deliveryEndtime = endTime;
			}
			lifeCycleQuery.deliveryTime = "";
			
			$scope.dtInstance.query(lifeCycleQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.lifeCycleQuery.queryText = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.lifeCycleQuery.queryText = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var lifeCycleQuery = $scope.lifeCycleQuery;
			//清空高级搜索查询条件
			lifeCycleQuery.iccid = null;
			lifeCycleQuery.imsi = null;
			lifeCycleQuery.cardNo = null;
			lifeCycleQuery.cardType = null;
			lifeCycleQuery.status = null;
			lifeCycleQuery.opId = null;
			lifeCycleQuery.deliveryTime = null;
		};
		
		// 打开卡出库窗口
		$scope.openStockCard = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/card/lifecycle/view/create.html',
				controller : 'createLifeCycleCtrl',
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
		
		// 导出excel文件
		$scope.exportLifeCycleFile = function() {
			
			var lifeCycleQuery = angular.extend({},$scope.lifeCycleQuery);
			
			if(null != $scope.lifeCycleQuery.cardType){
				lifeCycleQuery.cardType = $scope.lifeCycleQuery.cardType.number;
			}
			
			if(null != $scope.lifeCycleQuery.status){
				lifeCycleQuery.status = $scope.lifeCycleQuery.status.number;
			}
			
			if(null != $scope.lifeCycleQuery.opId){
				lifeCycleQuery.opId = $scope.lifeCycleQuery.opId.number;
			}
			
			//运营商发货时间
			if (lifeCycleQuery.deliveryTime && lifeCycleQuery.deliveryTime.startDate
					&& lifeCycleQuery.deliveryTime.endDate) {
				var startTime = lifeCycleQuery.deliveryTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = lifeCycleQuery.deliveryTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				lifeCycleQuery.deliveryStarttime = startTime;
				lifeCycleQuery.deliveryEndtime = endTime;
			}
			lifeCycleQuery.deliveryTime = "";
			
			cardService.exportLifeCycleFile(lifeCycleQuery, function(data) {
				if (data.returnCode == 0) {
					swal({
						title: "操作成功!",
	            	    text: "稍后请在附加功能下载列表中下载",
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
	}
	
	//卡出库操作
	function createLifeCycleCtrl($scope,$uibModalInstance,cardService,FileUploader) {
		$scope.errorShow = false;
		$scope.importSuccShow = false;
		$scope.importIsShow = false;
		var importFileUrl = "";
		var returnKey = "";
		
		$scope.downloadTemplate = function (type) {
			var path = "card/downloadTemplate?downloadType="+type;
            location.href =path;
        }

		var uploaderStockcards = $scope.uploaderStockcards = new FileUploader({
			url : "card/lifecycle/importStockcard",
			autoUpload : true,// 添加后，自动上传
		});
		
		$scope.uploaderStockcards.onBeforeUploadItem = function (fileItem) {
			$scope.loadShow=true;
			$scope.errorShow = false;
			$scope.importSuccShow = false;
			$scope.importIsShow = false;
		};
		
		// 上传控件：回调响应：
		$scope.uploaderStockcards.onCompleteItem = function(item, response,
				status, headers) {
			$scope.loadShow=false;
			var result = response.data[0];
			if (result != null) {
				if(result.isImported == 3){
					$scope.errorShow = true;
					$scope.msgShow = result.msg;
					$scope.$apply();
				}else if(result.isImported == 1){
					$scope.importSuccShow = true;
					$scope.successCount = result.successCount;
					returnKey = result.msg;
					$scope.$apply();
				}else if(result.isImported == 2){
					$scope.importIsShow = true;
					$scope.successCount = result.successCount;
					$scope.failCount = result.failCount;
					importFileUrl = result.url;
					returnKey = result.msg;
					$scope.$apply();
				}
			}
		};
		
		$scope.downloadFile = function () {
			if(importFileUrl != "" && importFileUrl != null && importFileUrl != "null"){
				location.href = importFileUrl;
			}
        }
		
		$scope.stockCard = function(status) {
			if(returnKey == ""){
				$scope.errorShow = true;
				$scope.msgShow = "请导入有效数据！";
				$scope.$apply();
			}else{
				cardService.stockCard({stockKey:returnKey},function(data) {
					if (data.result) {
						swal({
							title: "",
							text: "批量出库操作成功!",
							timer: 3000,
							type: "success",
							showConfirmButton: false
						});
					} else {
						swal({
							title: "",
							text: "批量出库操作失败,请联系管理员!",
							timer: 3000,
							type: "error",
							showConfirmButton: false
						});
					}
				});
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close();
		};
	}

	angular.module('card')
		.controller('lifeCycleListCtrl', lifeCycleListCtrl)
		.controller('createLifeCycleCtrl', createLifeCycleCtrl);
})(angular);

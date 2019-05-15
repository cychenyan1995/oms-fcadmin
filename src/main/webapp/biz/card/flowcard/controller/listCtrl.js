(function(angular) {
	function flowCardListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile,$templateRequest,$filter,
			$uibModal,SweetAlert,FileUploader,cardService,spService,
			poolService) {
		
		//搜索关键字
		$scope.flowCardQuery = {
			keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '导入卡',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.openImportFlowCard();
			}
		},{
			text : '启用',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCards();
			}
		},{
			text : '停用',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.stopCards();
			}
		},{
			text : '续费',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.renewCards();
			}
		},{
			text : '批量操作',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.batchImport();
			}
		},{
			text : '导出',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportFlowCardFile();
			}
		}])
		.withOption('id','cardId')
		.withOption('ordering',true)
		.withFixedColumns({
            leftColumns: 2,
            rightColumns: 0
        })
        .withOption('select', {
        	type: 'single'
        });
		
		// 定义DataTables选项
		$scope.dtInstance = {
			serverData : cardService.getFlowCardAll
		};
		
		//获取所有流量池名称
		poolService.getPoolList(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var poolList = [];
			poolList.push({
				number : null,
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				poolList.push({
					number : list[i].flowpoolId,
					text : list[i].flowpoolName
				});
			}
			$scope.poolList = poolList;
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
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].spId,
					text : list[i].spName
				});
			}
			$scope.serviceList = serviceList;
		});
		
		//实名认证列表
		$scope.authNameList = [
		                      { number: null, text: '全部'}, 
		                      { number: 4, text: '未提交'}, 
		                      { number: 0, text: '待审核'}, 
		                      { number: 3, text: '重新审核'}, 
		                      { number: 1, text: '审核通过'}, 
		                      { number: 2, text: '审核不通过'}];
		
		//卡异常原因列表
		$scope.reasonList = [
		                    { number: 0, text: '全部'}, 
		                    { number: 1, text: '运营商停机'}, 
		                    { number: 2, text: '流量用完，套餐已过期'}, 
		                    { number: 3, text: '有效期到期，套餐已过期'}, 
		                    { number: 4, text: '其他原因'}];
		
		//卡状态列表
		$scope.statusList = [
			                { number: null, text: '全部'}, 
			                { number: 0, text: '可测试'}, 
			                { number: 1, text: '库存'}, 
			                { number: 3, text: '可激活'}, 
			                { number: 4, text: '已激活'}, 
			                { number: 5, text: '已停用'},
			                { number: 6, text: '已销卡'}];
		
		//套餐状态列表
		$scope.packageStatusList = [
			                { number: null, text: '全部'}, 
			                { number: 0, text: '库存'}, 
			                { number: 1, text: '已激活'}, 
			                { number: 2, text: '已过期'}];
		
		var screenWidth = $(window).width() - 512;
		var percent = 7;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
			DTColumnBuilder.newColumn('iccid').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('ICCID').renderWith(showDetail),
			DTColumnBuilder.newColumn('imei').withOption('width',100).withTitle('IMEI'),
			DTColumnBuilder.newColumn('status').withOption('width',45).withTitle('卡状态').renderWith(cardStatus),
			DTColumnBuilder.newColumn('packageStatus').withOption('width',56).withTitle('套餐状态').renderWith(packageStatus),
			DTColumnBuilder.newColumn('isAuthname').withOption('width',56).withTitle('实名认证').renderWith(isAuth),
			DTColumnBuilder.newColumn('totalFlow').withOption('width',125).withTitle('套餐—总流量(MB)').renderWith(getTotalFlow),
			DTColumnBuilder.newColumn('remainTotalflow').withOption('width',125).withTitle('套餐—总剩余(MB)').renderWith(getRemainFlow),
			DTColumnBuilder.newColumn('usedTotalflow').withOption('width',125).withTitle('套餐—总消耗(MB)'),
			DTColumnBuilder.newColumn('consumeMonthflow').withOption('width',100).withTitle('当月消耗(MB)'),
			DTColumnBuilder.newColumn('packageBegintime').withOption('width',120).withTitle('套餐开通时间'),
			DTColumnBuilder.newColumn('packageEndtime').withOption('width',120).withTitle('套餐结束时间'),
			DTColumnBuilder.newColumn('activeTime').withOption('width',120).withTitle('卡激活时间'),
			DTColumnBuilder.newColumn('spName').withOption('width',120).withTitle('服务商名称'),
			DTColumnBuilder.newColumn('outStockTime').withOption('width',120).withTitle('出库时间'),
			DTColumnBuilder.newColumn('deliveryTime').withOption('width',120).withTitle('运营商发货时间'),
			DTColumnBuilder.newColumn('statusChangeReason').withOption('width',160).withTitle('卡状态异常原因')
		];
		
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
		function packageStatus(e, dt, node, config) {
			if (node.packageStatus == 0)
				return "库存"
			else if (node.packageStatus == 1 && node.emptyStatus != 1)
				return "已激活"
			else if (node.packageStatus == 1 && node.emptyStatus == 1)
				return "--"
			else if (node.packageStatus == 2)
				return "已过期"
			return '';
		}
		function isAuth(e, dt, node, config) {
			if (node.isAuthname == 0 && node.authStatus == undefined)
				return "未提交"
			else if (node.isAuthname == 0 && node.authStatus == 0)
				return "待审核"
			else if (node.isAuthname == 0 && node.authStatus == 3)
				return '<span style="color:orange;">重新审核</span>'
			else if (node.isAuthname == 1 && node.authStatus == 1)
				return '<span style="color:green;">审核通过</span>'
			else if (node.isAuthname == 0 && node.authStatus == 2)
				return '<span style="color:red;">审核不通过</span>'
			
			return '--';
		}
		
		function getTotalFlow(e, dt, node, config) {
			if (node.isUnlimitFlow == 1)
				return "不限流量"
			return node.totalFlow;
		}
		
		function getRemainFlow(e, dt, node, config) {
			if (node.isUnlimitFlow == 1)
				return "--"
			return node.remainTotalflow;
		}
		
		function showDetail(e, dt, node, config) {
			return '<a href="javascript:;" ng-click="cardDetail(item);">'+ node.iccid +'</a>';
		}
		
		// 搜索按钮
		$scope.flowCardSearchForm = function() {
			$scope.dtInstance.query($scope.flowCardQuery);
		};
		
		// 高级搜索按钮
		$scope.flowCardHighSearchForm = function() {
			
			var flowCardQuery = angular.extend({},$scope.flowCardQuery);
			
			if(null != $scope.flowCardQuery.isAuthname){
				flowCardQuery.isAuthname = $scope.flowCardQuery.isAuthname.number;
			}
			
			if(null != $scope.flowCardQuery.statusChangeReason){
				flowCardQuery.statusChangeReason = $scope.flowCardQuery.statusChangeReason.number;
			}
			
			if(null != $scope.flowCardQuery.poolId){
				flowCardQuery.poolId = $scope.flowCardQuery.poolId.number;
			}
			
			if(null != $scope.flowCardQuery.spId){
				flowCardQuery.spId = $scope.flowCardQuery.spId.number;
			}
			
			if(null != $scope.flowCardQuery.status){
				flowCardQuery.status = $scope.flowCardQuery.status.number;
			}
			
			if(null != $scope.flowCardQuery.packageStatus){
				flowCardQuery.packageStatus = $scope.flowCardQuery.packageStatus.number;
			}
			
			//激活时间
			if (flowCardQuery.activeTime && flowCardQuery.activeTime.startDate
					&& flowCardQuery.activeTime.endDate) {
				var startTime = flowCardQuery.activeTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.activeTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.activeBegintime = startTime;
				flowCardQuery.activeEndtime = endTime;
			}
			//运营商发货时间
			if (flowCardQuery.deliveryTime && flowCardQuery.deliveryTime.startDate
					&& flowCardQuery.deliveryTime.endDate) {
				var startTime = flowCardQuery.deliveryTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.deliveryTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.deliveryStarttime = startTime;
				flowCardQuery.deliveryEndtime = endTime;
			}
			//套餐开始时间
			if (flowCardQuery.packageBegintime && flowCardQuery.packageBegintime.startDate
					&& flowCardQuery.packageBegintime.endDate) {
				var startTime = flowCardQuery.packageBegintime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.packageBegintime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.startTime = startTime;
				flowCardQuery.endTime = endTime;
			}
			//套餐到期时间
			if (flowCardQuery.packageEndtime && flowCardQuery.packageEndtime.startDate
					&& flowCardQuery.packageEndtime.endDate) {
				var startTime = flowCardQuery.packageEndtime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.packageEndtime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.startDate = startTime;
				flowCardQuery.endDate = endTime;
			}
			//导入时间
			if (flowCardQuery.inStockTime && flowCardQuery.inStockTime.startDate
					&& flowCardQuery.inStockTime.endDate) {
				var startTime = flowCardQuery.inStockTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.inStockTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.inStockBegintime = startTime;
				flowCardQuery.inStrockEndtime = endTime;
			}
			
			//出库时间
			if (flowCardQuery.outStockTime && flowCardQuery.outStockTime.startDate
					&& flowCardQuery.outStockTime.endDate) {
				var startTime = flowCardQuery.outStockTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.outStockTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.outStrockBegintime = startTime;
				flowCardQuery.outStrockEndtime = endTime;
			}
			
			$scope.dtInstance.query(flowCardQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.flowCardQuery.queryText = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.flowCardQuery.queryText = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state){
			// 清空高级搜索查询条件
			var flowCard = $scope.flowCardQuery;
			//清空高级搜索查询条件
			flowCard.iccid = null;
			flowCard.imsi = null;
			flowCard.cardNo = null;
			flowCard.imei = null;
			flowCard.isAuthname = null;
			flowCard.statusChangeReason = null;
			flowCard.poolId = null;
			flowCard.spId = null;
			flowCard.activeTime = null;
			flowCard.deliveryTime = null;
			flowCard.packageBegintime = null;
			flowCard.packageEndtime = null;
			flowCard.inStockTime = null;
			flowCard.outStockTime = null;
			flowCard.status = null;
			flowCard.packageStatus = null;
			flowCard.curUsedSmall = null;
			flowCard.curUsedBig = null;
			flowCard.totalSmall = null;
			flowCard.totalBig = null;
			flowCard.usedSmall = null;
			flowCard.usedBig = null;
			flowCard.remainSmall = null;
			flowCard.remainBig = null;
		};
		
		//获取卡详情
		$scope.cardDetail = function(item) {
			var cardId = item.cardId;
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/card/flowcard/view/detail.html',
				controller : 'operateCardCtrl',
				size : 'lg',
				resolve : {
					param : function() {
						return {
							cardId:cardId
						};
					}
				}
			});
		}
		
		//单卡启用
		$scope.openCards = function() {
			var items = $scope.dtInstance.getSelectItems();
			var list=[];
			if (items.length > 0) {
				var iccid;
				var status;
				angular.forEach(items, function(i) {
					var obj = {};
					iccid = i.iccid;
					status=i.status;
					obj.iccid = i.iccid;
					obj.op = 0;
					list.push(obj);
				});
				var modalInstance = $uibModal.open({
					templateUrl : 'biz/card/flowcard/view/operateActive.html',
					controller : 'operateActiveCtrl',
					resolve : {
						param : function() {
							return {
								iccid:iccid,
								list: list
							};
						}
					}
				});
				
				modalInstance.result.then(function(data){
					if(data){
						$scope.dtInstance.query({});
					}
				});
			}else{
				SweetAlert.swal({
        			title: "",
            	    text: "请选择需要启用的流量卡！",
            	    type: "warning",
            	    showCancelButton: false,
            	    confirmButtonColor: "#DD6B55",
            	    confirmButtonText: "确定",
            	    closeOnConfirm: true });
			}
		}
		
		//单卡停用
		$scope.stopCards = function() {
			var items = $scope.dtInstance.getSelectItems();
			var list=[];
			if (items.length > 0) {
				var iccid;
				var status;
				angular.forEach(items, function(i) {
					var obj = {};
					iccid = i.iccid;
					status=i.status;
					obj.iccid = i.iccid;
					obj.op = 1;
					list.push(obj);
				});
				var modalInstance = $uibModal.open({
					templateUrl : 'biz/card/flowcard/view/operateStop.html',
					controller : 'operateStopCtrl',
					resolve : {
						param : function() {
							return {
								iccid:iccid,
								list: list
							};
						}
					}
				});
				
				modalInstance.result.then(function(data){
					if(data){
						$scope.dtInstance.query({});
					}
				});
			}else{	
				SweetAlert.swal({
	        			title: "",
	            	    text: "请选择需要停用的流量卡！",
	            	    type: "warning",
	            	    showCancelButton: false,
	            	    confirmButtonColor: "#DD6B55",
	            	    confirmButtonText: "确定",
	            	    closeOnConfirm: true });
			}
		}
		
		//单卡续费
		$scope.renewCards = function() {
			var items = $scope.dtInstance.getSelectItems();
			if (items.length > 0) {
				var iccid;
				var status;
				var imsi;
				angular.forEach(items, function(i) {
					iccid = i.iccid;
					imsi = i.imsi;
					status=i.status;
				});
				if(status == 0 || status == 1 || status == 3 || status == 6){
					var str = "";
					if(status == 0){
						str = "可测试";
					}else if(status == 1){
						str = "库存";
					}else if(status == 3){
						str = "可激活";
					}else if(status == 6){
						str = "已销卡";
					}
					SweetAlert.swal({
	        			title: "",
	            	    text: "卡状态为["+str+"],不支持续费",
	            	    type: "warning",
	            	    showCancelButton: false,
	            	    confirmButtonColor: "#DD6B55",
	            	    confirmButtonText: "确定",
	            	    closeOnConfirm: true });
				}else{
					var modalInstance = $uibModal.open({
						templateUrl : 'biz/card/flowcard/view/operateRenew.html',
						controller : 'operateRenewCtrl',
						resolve : {
							param : function() {
								return {
									iccid:iccid,
									imsi:imsi
								};
							}
						}
					});
					
					modalInstance.result.then(function(data){
						if(data){
							$scope.dtInstance.query({});
						}
					});
				}
			}else{	
				SweetAlert.swal({
	        			title: "",
	            	    text: "请选择需要续费的流量卡！",
	            	    type: "warning",
	            	    showCancelButton: false,
	            	    confirmButtonColor: "#DD6B55",
	            	    confirmButtonText: "确定",
	            	    closeOnConfirm: true });
			}
		}
		
		// 打开导入卡窗口
		$scope.openImportFlowCard = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/card/flowcard/view/create.html',
				controller : 'importFlowCardCtrl',
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
		
		
		// 打开批量导入操作窗口
		$scope.batchImport = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/card/flowcard/view/batchImport.html',
				controller : 'batchImportCardCtrl',
				resolve : {
					param : function() {
						return  {};
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		};
		
		// 导出excel文件
		$scope.exportFlowCardFile = function() {
			var obj = {};
			var flowCardQuery = angular.extend({},$scope.flowCardQuery);
			
			if(null != flowCardQuery.isAuthname){
				flowCardQuery.isAuthname = flowCardQuery.isAuthname.number;
			}
			
			if(null != flowCardQuery.statusChangeReason){
				flowCardQuery.statusChangeReason = flowCardQuery.statusChangeReason.number;
			}
			
			if(null != flowCardQuery.poolId){
				flowCardQuery.poolId = flowCardQuery.poolId.number;
			}
			
			if(null != flowCardQuery.spId){
				flowCardQuery.spId = flowCardQuery.spId.number;
			}
			
			if(null != flowCardQuery.status){
				flowCardQuery.status = flowCardQuery.status.number;
			}
			
			if(null != flowCardQuery.packageStatus){
				flowCardQuery.packageStatus = flowCardQuery.packageStatus.number;
			}

			//激活时间
			if (flowCardQuery.activeTime && flowCardQuery.activeTime.startDate
					&& flowCardQuery.activeTime.endDate) {
				var startTime = flowCardQuery.activeTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.activeTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.activeBegintime = startTime;
				flowCardQuery.activeEndtime = endTime;
			}
			flowCardQuery.activeTime = "";

			//运营商发货时间
			if (flowCardQuery.deliveryTime && flowCardQuery.deliveryTime.startDate
					&& flowCardQuery.deliveryTime.endDate) {
				var startTime = flowCardQuery.deliveryTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.deliveryTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.deliveryStarttime = startTime;
				flowCardQuery.deliveryEndtime = endTime;
			}
			flowCardQuery.deliveryTime = "";
			
			//套餐开始时间
			if (flowCardQuery.packageBegintime && flowCardQuery.packageBegintime.startDate
					&& flowCardQuery.packageBegintime.endDate) {
				var startTime = flowCardQuery.packageBegintime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.packageBegintime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.startTime = startTime;
				flowCardQuery.endTime = endTime;
			}
			flowCardQuery.packageBegintime = "";
			
			//套餐到期时间
			if (flowCardQuery.packageEndtime && flowCardQuery.packageEndtime.startDate
					&& flowCardQuery.packageEndtime.endDate) {
				var startTime = flowCardQuery.packageEndtime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.packageEndtime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.startDate = startTime;
				flowCardQuery.endDate = endTime;
			}
			flowCardQuery.packageEndtime = "";
			
			//导入时间
			if (flowCardQuery.inStockTime && flowCardQuery.inStockTime.startDate
					&& flowCardQuery.inStockTime.endDate) {
				var startTime = flowCardQuery.inStockTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.inStockTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.inStockBegintime = startTime;
				flowCardQuery.inStrockEndtime = endTime;
			}
			flowCardQuery.inStockTime = "";
			
			//出库时间
			if (flowCardQuery.outStockTime && flowCardQuery.outStockTime.startDate
					&& flowCardQuery.outStockTime.endDate) {
				var startTime = flowCardQuery.outStockTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.outStockTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.outStrockBegintime = startTime;
				flowCardQuery.outStrockEndtime = endTime;
			}
			flowCardQuery.outStockTime = "";
			
			cardService.exportFlowCardFile(flowCardQuery, function(data) {
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
	
	//获取卡详情操作
	function operateCardCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,cardService) {
		$scope.cardStatus = function(value){
			if (value == 0)
				return "可测试"
			else if (value == 1)
				return "库存"
			else if (value == 3)
				return '可激活'
			else if (value == 4)
				return '已激活'
			else if (value == 5)
				return '已停用'
			else if (value == 6)
				return '已销卡'
			return '--';
		}
		
		$scope.packageStatus = function(value1,value2) {
			if (value1 == 0)
				return "库存"
			else if (value1 == 1 && value2 != 1)
				return "已激活"
			else if (value1 == 1 && value2 == 1)
				return "--"
			else if (value1 == 2)
				return "已过期"
			return '';
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
		};
		
		$scope.cardType = function(value) {
			if(value == 1){
				return "工业贴片卡"
			}else if(value == 2){
				return "工业大卡"
			}else if(value == 3){
				return "双切卡"
			}else{
				return ""
			}
		};
		
		$scope.level = function(value) {
			if(value == 1){
				return "一级"
			}else if(value == 2){
				return "二级"
			}else{
				return ""
			}
		};
		
		cardService.getCardDetail({cardId:param.cardId}, function(result) {
			var allData=result.data[0];
			$scope.flowCard = allData.flowcard;
			$scope.planList = allData.planList;
			$scope.hisList = allData.hisList;
			$scope.curList = allData.curList;
		});
		
		$scope.type = function(value) {
			if(value == 1){
				return "开通套餐"
			}else if(value == 2 || value == 3){
				return "续费套餐"
			}else{
				return ""
			}
		}
		
		$scope.category = function(value) {
			if(value == 1 || value == 2){
				return "流量套餐"
			}else if(value == 3){
				return "流量包"
			}else{
				return ""
			}
		}
		
		$scope.validity = function(value) {
			if(value == 0){
				return "天"
			}else if(value == 1){
				return "个月"
			}else{
				return ""
			}
		}
		
		$scope.flowType = function(value) {
			if(value.isUnlimitFlow == 0){
				return value.totalFlow;
			}else if(value.isUnlimitFlow == 1){
				return "不限流量"
			}else{
				return ""
			}
		}
		
		$scope.cancel = function() {
			$uibModalInstance.close();
		};
	}
	
	//单卡启用操作
	function operateActiveCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,cardService) {
		
		$scope.flowcardData={iccid:param.iccid};
		
		$scope.activeCard = function(status) {
			if ($scope.active_form.$valid) {
				var description = $scope.flowcardData.description;
				cardService.openCards({list:param.list, description:description}, function(data) {
					if (data.result) {
						swal({
							title: "",
							text: "启用操作成功!",
							timer: 3000,
							type: "success",
							showConfirmButton: false
						});
						$uibModalInstance.close(true);
					} else {
						swal({
							title: "",
							text: "启用操作失败!",
							timer: 3000,
							type: "error",
							showConfirmButton: false
						});
					}
				});
			}else{
				$scope.active_form.submitted = true;
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close(false);
		};
	}
	
	//单卡停用操作
	function operateStopCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,cardService) {
		
		$scope.flowcardData={iccid:param.iccid};
		
		$scope.stopCard = function(status) {
			if ($scope.stop_form.$valid) {
				var description = $scope.flowcardData.description;
				cardService.stopCards({list:param.list, description:description}, function(data) {
					if (data.result) {
						swal({
							title: "",
							text: "停用操作成功!",
							timer: 3000,
							type: "success",
							showConfirmButton: false
						});
						$uibModalInstance.close(true);
					} else {
						swal({
							title: "",
							text: "停用操作失败!",
							timer: 3000,
							type: "error",
							showConfirmButton: false
						});
					}
				});
			}else{
				$scope.stop_form.submitted = true;
			}
			
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close(false);
		};
		
	}
	
	//单卡续费操作
	function operateRenewCtrl($scope, $uibModal,$uibModalInstance, param, $filter, $compile,cardService) {
		
		cardService.getCurPackage({iccid:param.iccid},function(datas){
			var card = datas.data;
			$scope.flowcardData={iccid:card.iccid,
								 imsi:card.imsi,
								 curPackage:card.packageCode+"/"+card.packageName};
		});
		
		//获取可续费套餐
		$scope.getPackage = function () {  
			$scope.flowCardRenew.packageName = "";
			var packageList = [];
			packageList.push({
				number : '',
				text : '请选择'
			});
			var type = $scope.flowCardRenew.packageType;
			if(type != ""){
				cardService.getValidFlowPkg({iccid:param.iccid,flowpkgType:type},function(datas){
					// 展示条件查询中的服务商选项
					var list= datas.data;
					for (var i = 0; i < list.length; i++) {
						packageList.push({
							number : list[i].relation_id,
							text : list[i].flowpkgname
						});
					}
					$scope.packageList = packageList;
				});
			}
	    }  
		
		//显示当前续费套餐
		$scope.showPackage = function () {  
			var packageId = $scope.flowCardRenew.packageName.number;
			var packageName = $scope.flowCardRenew.packageName.text;
			$scope.flowcardData.renewPackage = packageId + "/" + packageName;
	    }  
		
		//续费
		$scope.renewCard = function(status) {
			if ($scope.renew_form.$valid) {
				var packageType = $scope.flowCardRenew.packageType;
				var relationId = $scope.flowCardRenew.packageName.number;
				cardService.renewCards({iccid:param.iccid,packageType:packageType,relationId:relationId}, function(data) {
					if (data.result) {
						swal({
							title: "",
							text: "续费操作成功!",
							timer: 1500,
							type: "success",
							showConfirmButton: false
						});
						$uibModalInstance.close(true);
					} else {
						swal({
							title: "",
							text: "续费操作失败!",
							timer: 1500,
							type: "error",
							showConfirmButton: false
						});
					}
				});
			}else{
				$scope.renew_form.submitted = true;
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close(false);
		};
		
	}
	
	//导入操作
	function importFlowCardCtrl($scope, $uibModal,$uibModalInstance, $filter, $compile,$http,cardService) {
		
		$scope.importIsShow=false;
		$scope.loadShow=false;
		var importFileUrl = "";
		
		$scope.downloadTemplate = function (type) {
			var path = "card/downloadTemplate?downloadType="+type;
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
				url : "card/importCards",
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
	
	// 批量导入卡操作
	function batchImportCardCtrl($scope, $uibModal,$uibModalInstance, param, $filter, 
			$compile,$http,FileUploader,cardService,flowPackageService) {
		
		$scope.openIsShow=false;
		$scope.stopIsShow=false;
		$scope.renewIsShow=false;
		$scope.openLoadShow=false;
		$scope.stopLoadShow=false;
		$scope.renewLoadShow=false;
		
		var batchOpenIccid = "";
		var batchStopIccid = "";
		var renewFlag = "";
		var openFileUrl = "";
		var stopFileUrl = "";
		var renewFileUrl = "";
		
		
		$scope.downloadTemplate = function (type) {
			var path = "card/downloadTemplate?downloadType="+type;
            location.href =path;
        }

		var uploaderOpencards = $scope.uploaderOpencards = new FileUploader({
			url : "card/batchImport?type=1",
			autoUpload : true,// 添加后，自动上传
		});
		
		$scope.uploaderOpencards.onBeforeUploadItem = function (fileItem) {
			$scope.openLoadShow=true;
		};
		
		// 上传控件：回调响应：
		$scope.uploaderOpencards.onCompleteItem = function(item, response,
				status, headers) {
			$scope.openLoadShow=false;
			var result = response.data[0];
			if (result != null) {
				if(result.isImported == 2){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 3000,
						type : "error",
						showConfirmButton : false
					});
				}else if(result.isImported == 1){
					$scope.openIsShow=true;
					$scope.openSuccessCount = result.successCount;
					$scope.openFailCount = result.failCount;
					batchOpenIccid = result.msg;
					openFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 0){
					$scope.openIsShow=true;
					$scope.openSuccessCount = result.successCount;
					$scope.openFailCount = result.failCount;
					batchOpenIccid = result.msg;
					openFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 3 || result.isImported == 4){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 3000,
						type : "error",
						showConfirmButton : false
					});
				}
			}
		};
		
		$scope.flowcardData= {};
		
		$scope.batchOpenCard = function(status) {
			if ($scope.outerForm.openCard_form.$valid) {
				if(batchOpenIccid=="" || batchOpenIccid == null || batchOpenIccid == "null"){
					swal({
						title: "",
						text: "请导入有效数据!",
						timer: 3000,
						type: "error",
						showConfirmButton: false
					});
				}else{
					var description = $scope.flowcardData.openReason;
					cardService.batchOpCards({list:batchOpenIccid, description:description, type:1}, function(data) {
						if (data.result) {
							swal({
								title: "",
								text: "批量启用操作成功!",
								timer: 3000,
								type: "success",
								showConfirmButton: false
							});
						} else {
							swal({
								title: "",
								text: "批量启用操作失败!",
								timer: 3000,
								type: "error",
								showConfirmButton: false
							});
						}
					});
				}
			}else{
				$scope.outerForm.openCard_form.submitted = true;
			}
		};
		
		var uploaderStopcards = $scope.uploaderStopcards = new FileUploader({
			url : "card/batchImport?type=2",
			autoUpload : true,// 添加后，自动上传
		});
		
		$scope.uploaderStopcards.onBeforeUploadItem = function (fileItem) {
			$scope.stopLoadShow=true;
		};
		
		// 上传控件：回调响应：
		$scope.uploaderStopcards.onCompleteItem = function(item, response,
				status, headers) {
			$scope.stopLoadShow=false;
			var result = response.data[0];
			if (result != null) {
				if(result.isImported == 2){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 3000,
						type : "error",
						showConfirmButton : false
					});
				}else if(result.isImported == 1){
					$scope.stopIsShow=true;
					batchStopIccid = result.msg;
					$scope.stopSuccessCount = result.successCount;
					$scope.stopFailCount = result.failCount;
					stopFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 0){
					$scope.stopIsShow=true;
					batchStopIccid = result.msg;
					$scope.stopSuccessCount = result.successCount;
					$scope.stopFailCount = result.failCount;
					stopFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 3 || result.isImported == 4){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 3000,
						type : "error",
						showConfirmButton : false
					});
				}
			}
		};
		

		$scope.batchStopCard = function(status) {
			if ($scope.outerForm.stopCard_form.$valid) {
				if(batchStopIccid=="" || batchStopIccid == null || batchStopIccid == "null"){
					swal({
						title: "",
						text: "请导入有效数据!",
						timer: 1000,
						type: "error",
						showConfirmButton: false
					});
				}else{
					var description = $scope.flowcardData.stopReason;
					cardService.batchOpCards({list : batchStopIccid,description : description,type : 2}, function(data) {
						if (data.result) {
							swal({
								title : "",
								text : "批量停用操作成功!",
								timer : 3000,
								type : "success",
								showConfirmButton : false
							});
						} else {
							swal({
								title : "",
								text : "批量停用操作失败!",
								timer : 3000,
								type : "error",
								showConfirmButton : false
							});
						}
					});
				}
			} else {
				$scope.outerForm.stopCard_form.submitted = true;
			}
		};
		
		$scope.downloadFile = function (type) {
			if(type == "1"){
				if(openFileUrl != "" && openFileUrl != null && openFileUrl != "null"){
					location.href = openFileUrl;
				}
			}else if(type == "2"){
				if(stopFileUrl != "" && stopFileUrl != null && stopFileUrl != "null"){
					location.href = stopFileUrl;
				}
			}else if(type == "3"){
				if(renewFileUrl != "" && renewFileUrl != null && renewFileUrl != "null"){
					location.href = renewFileUrl;
				}
			}
        }
		
		var packageType = "";
		var relationId = "";
		//获取可续费套餐
		$scope.getPackage = function () {  
			var packageList = [];
			packageList.push({
				number : '',
				text : '请选择'
			});
			packageType = $scope.flowcardData.packageType;
		
			if(packageType != ""){
				flowPackageService.getFlowPkg({packageType:packageType},function(datas){
					// 展示条件查询中的服务商选项
					var list= datas.data;
					for (var i = 0; i < list.length; i++) {
						packageList.push({
							number : list[i].packageCode,
							text : list[i].packageName
						});
					}
					$scope.packageList = packageList;
				});
			}
	    } 
		
		//获取续费套餐名称
		$scope.getPackageName = function () {  
			relationId = $scope.flowcardData.packageName.number;
			uploaderRenewcards.url = "card/batchRenewImport?packageType="+packageType+"&relationId="+relationId;
	    } 
		
		var uploaderRenewcards = $scope.uploaderRenewcards = new FileUploader({
			url : "",
			autoUpload : true,// 添加后，自动上传
		});
		
		$scope.uploaderRenewcards.onBeforeUploadItem = function (fileItem) {
	       	 if(packageType == "" || packageType == null || packageType == "null" || packageType == "undefined"){
	       		swal({
					title: "",
					text: "请选择续费套餐!",
					timer: 3000,
					type: "error",
					showConfirmButton: false
				});
	       		 $scope.uploaderRenewcards.cancelItem(fileItem) ; 
	       	 }
	       	 $scope.renewLoadShow=true;
		};
		
		// 上传控件：回调响应：
		$scope.uploaderRenewcards.onCompleteItem = function(item, response,
				status, headers) {
			$scope.renewLoadShow=false;
			var result = response.data[0];
			if (result != null) {
				if(result.isImported == 2){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 3000,
						type : "error",
						showConfirmButton : false
					});
				}else if(result.isImported == 1){
					$scope.renewIsShow=true;
					renewFlag = result.msg;
					$scope.renewMsg = result.cause;
					renewFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 0){
					$scope.renewIsShow=true;
					renewFlag = result.msg;
					$scope.renewMsg = result.cause;
					renewFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 3 || result.isImported == 4){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 3000,
						type : "error",
						showConfirmButton : false
					});
				}
			}
		};
		
		
		$scope.batchRenewCard = function(status) {
			if ($scope.outerForm.renewCard_form.$valid) {
				if(renewFlag=="" || renewFlag == null || renewFlag == "null"){
					swal({
						title: "",
						text: "请导入有效数据!",
						timer: 3000,
						type: "error",
						showConfirmButton: false
					});
				}else{
					cardService.batchOpRenewCards({orderNo:renewFlag},function(data) {
						if (data.result) {
							swal({
								title : "",
								text : "批量续费操作成功!",
								timer : 3000,
								type : "success",
								showConfirmButton : false
							});
						} else {
							swal({
								title : "",
								text : "批量续费操作失败!",
								timer : 3000,
								type : "error",
								showConfirmButton : false
							});
						}
					});
				}
			} else {
				$scope.outerForm.renewCard_form.submitted = true;
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close();
		};

		$scope.tabActive = function(index){
			$scope.curTabIndex = index;
		}
		$scope.tabActive(0);
		
	}

	angular.module('card')
	.controller('flowCardListCtrl', flowCardListCtrl)
	.controller('operateActiveCtrl',operateActiveCtrl)
	.controller('operateStopCtrl',operateStopCtrl)
	.controller('operateRenewCtrl',operateRenewCtrl)
	.controller('importFlowCardCtrl',importFlowCardCtrl)
	.controller('batchImportCardCtrl',batchImportCardCtrl)
	.controller('operateCardCtrl',operateCardCtrl);
})(angular);

(function(angular) {
	function recycleListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, recoveryService,spService,$templateRequest,
			$uibModal) {
		
		//搜索关键字
		$scope.recycleQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '新	建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateRecycleWindow();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : recoveryService.getRecycleAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 6;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('option').withOption('width',64).withTitle('操作').renderWith(operate),
				DTColumnBuilder.newColumn('iccid').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('ICCID'),
				DTColumnBuilder.newColumn('imsi').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('IMSI'),
				DTColumnBuilder.newColumn('cardNo').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('网卡号'),
				DTColumnBuilder.newColumn('opName').withOption('width',70).withTitle('运营商类型'),
				DTColumnBuilder.newColumn('source').withOption('width',columnWidth).withTitle('来源'),
				DTColumnBuilder.newColumn('spName').withOption('width',columnWidth).withTitle('服务商名称'),
				DTColumnBuilder.newColumn('recycleReason').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('回收原因'),
				DTColumnBuilder.newColumn('requestTime').withOption('width',columnWidth).withTitle('请求时间'),
				DTColumnBuilder.newColumn('recycleStatus').withOption('width',64).withTitle('回收状态').renderWith(recycleStatusOp),
				DTColumnBuilder.newColumn('failReason').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('失败原因'),
				DTColumnBuilder.newColumn('recycleTime').withOption('width',columnWidth).withTitle('回收时间'),
				DTColumnBuilder.newColumn('contactorName').withOption('width',100).withTitle('联系人').withOption('ellipsis',true),
				DTColumnBuilder.newColumn('contactorTel').withOption('width',100).withTitle('联系电话')
				];
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			if(node.recycleStatus=='1'){
				operateHtml = '<a href="javascript:;" ng-click="recycle(\''+ node.recycleRecordId + '\')">回收</a>';
			}	 
			return operateHtml;
		}
		
		function recycleStatusOp(e, dt, node, config) {		
			if(node.recycleStatus=='1'){
				return '<span style="color:green;">申请回收</span>';
			}else if(node.recycleStatus=='2'){
				return '<span style="color:green;">回收成功</span>';
			}else if(node.recycleStatus=='3'){
				return '<span style="color:red;">回收失败</span>';
			}else{
				return '--';
			}
		}
		
		
		$scope.sourceList=[{ number: null, text: '全部'}, 
		                   { number: 1, text: '开放平台'}, 
		                   { number: 2, text: '流量管理平台'}];
		$scope.opNameList=[{ number: null, text: '全部'}, 
		                   { number: 1, text: '移动'}, 
		                   { number: 2, text: '电信'},
		                   { number: 3, text: '联通'}];
		
		$scope.recycleStatusList=[{ number: null, text: '全部'}, 
		                   { number: 1, text: '申请回收'}, 
		                   { number: 2, text: '回收成功'},
		                   { number: 3, text: '回收失败'}];
		
		//获取所有服务商名称
		spService.getSp(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var spNameList = [];
			spNameList.push({
				number : null,
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				spNameList.push({
					number : list[i].spCode,
					text : list[i].spCode+"/"+list[i].spName
				});
			}
			$scope.spNameList = spNameList;
		});
		
		// 搜索按钮
		$scope.recycleSearchForm = function() {
			$scope.dtInstance.query($scope.recycleQuery);
		};
		
		// 高级搜索按钮
		$scope.recycleHighSearchForm = function() {
			var recycleQuery = {};
			recycleQuery.iccid=$scope.recycleQuery.iccid;
			recycleQuery.imsi=$scope.recycleQuery.imsi;
			recycleQuery.cardNo=$scope.recycleQuery.cardNo;
			if($scope.recycleQuery.requestTime && $scope.recycleQuery.requestTime.startDate && $scope.recycleQuery.requestTime.endDate){
				recycleQuery.requestStartTime=$scope.recycleQuery.requestTime.startDate.format('YYYY-MM-DD 00:00:00');
				recycleQuery.requestEndTime=$scope.recycleQuery.requestTime.endDate.format('YYYY-MM-DD 23:59:59');
			}
			if($scope.recycleQuery.recycleTime && $scope.recycleQuery.recycleTime.startDate && $scope.recycleQuery.recycleTime.endDate){
				recycleQuery.recycleStartTime=$scope.recycleQuery.recycleTime.startDate.format('YYYY-MM-DD 00:00:00');
				recycleQuery.recycleEndTime=$scope.recycleQuery.recycleTime.endDate.format('YYYY-MM-DD 23:59:59');
			}
			if($scope.recycleQuery.source!=null){
				recycleQuery.source=$scope.recycleQuery.source.number;
			}
			if($scope.recycleQuery.spName!=null&&$scope.recycleQuery.spName.number!=null){
				recycleQuery.spName=$scope.recycleQuery.spName.text;
			}
			if($scope.recycleQuery.opName!=null){
				recycleQuery.opName=$scope.recycleQuery.opName.number;
			}
			if($scope.recycleQuery.recycleStatus!=null){
				recycleQuery.recycleStatus=$scope.recycleQuery.recycleStatus.number;
			}
			$scope.dtInstance.query(recycleQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.recycleQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.recycleQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var recycle = $scope.recycleQuery;
			recycle.iccid=null;
			recycle.requestTime=null;
			recycle.cardNo=null;
			recycle.recycleTime=null;
			recycle.imsi=null;
			recycle.source=null;
			recycle.spName=null;
			recycle.opName=null;
			recycle.recycleStatus=null;
		};
		
		// 打开创建窗口
		$scope.openCreateRecycleWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/recovery/recycle/view/create.html',
				controller : 'createRecycleCtrl',
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
		
		
		// 打开回收窗口
		$scope.recycle = function(data) {
			var obj={};
			obj.recycleRecordId=data;
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/recovery/recycle/view/recycle.html',
				controller : 'recycleCtrl',
				size : 'lg',
				resolve : {
					param : function() {	
						return obj || {};
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		};
		
	}

	angular.module('recovery').controller('recycleListCtrl', recycleListCtrl);
})(angular);

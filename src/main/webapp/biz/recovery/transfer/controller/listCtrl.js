(function(angular) {
	function transferListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, recoveryService,spService,$templateRequest,
			$uibModal) {
		
		//搜索关键字
		$scope.transferQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '创建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateTransferWindow();
			}
		}
		])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : recoveryService.getTransferAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 5;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
		    				DTColumnBuilder.newColumn('option').withOption('width',50).withTitle('操作').renderWith(operate),
		    				DTColumnBuilder.newColumn('').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('ICCID').renderWith(showIccid),
		    				DTColumnBuilder.newColumn('').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('IMSI').renderWith(showImsi),
		    				DTColumnBuilder.newColumn('').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('网卡号').renderWith(showCardNo),
		    				DTColumnBuilder.newColumn('opName').withOption('width',100).withTitle('运营商类型'),
		    				DTColumnBuilder.newColumn('source').withOption('width',100).withTitle('来源'),
		    				DTColumnBuilder.newColumn('spName').withOption('width',columnWidth).withTitle('服务商名称'),
		    				DTColumnBuilder.newColumn('transReason').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('迁移原因'),
		    				DTColumnBuilder.newColumn('requestTime').withOption('width',130).withTitle('请求时间'),
		    				DTColumnBuilder.newColumn('transStatus').withOption('width',64).withTitle('迁移状态').renderWith(transStatusOp),
		    				DTColumnBuilder.newColumn('failReason').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('失败原因'),
		    				DTColumnBuilder.newColumn('transTime').withOption('width',columnWidth).withTitle('迁移时间'),
		    				DTColumnBuilder.newColumn('contactorName').withOption('width',columnWidth).withTitle('联系人'),
		    				DTColumnBuilder.newColumn('contactorTel').withOption('width',100).withTitle('联系电话')
		];
		
		function showIccid(e, dt, node, config) {
			return '旧:'+node.srcIccid+"<br/>新:"+node.dstIccid;
		}
		function showImsi(e, dt, node, config) {
			return '旧:'+node.srcImsi+"<br/>新:"+node.dstImsi;
		}
		function showCardNo(e, dt, node, config) {
			return '旧:'+node.srcCardNo+"<br/>新:"+node.dstCardNo;
		}
			
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			if(node.transStatus=='1'){
				operateHtml = '<a href="javascript:;" ng-click="transfer(\''+ node.transRecordId + '\')">迁移</a>';
			}				
			return operateHtml;
		}
		function transStatusOp(e, dt, node, config) {		
			if(node.transStatus=='1'){
				return '<span style="color:green;">申请迁移</span>';
			}else if(node.transStatus=='2'){
				return '<span style="color:green;">迁移成功</span>';
			}else if(node.transStatus=='3'){
				return '<span style="color:red;">迁移失败</span>';
			}else{
				return '--';
			}
		}
		//高级搜索框初始化新旧下拉框
		$scope.typeList=[{ number: 1, text: '新'}, 
		                 { number: 2, text: '旧'}];
		
		$scope.transferQuery.iccidType=$scope.typeList[0];
		$scope.transferQuery.imsiType=$scope.typeList[0];
		$scope.transferQuery.cardNoType=$scope.typeList[0];
		
		$scope.sourceList=[{ number: null, text: '全部'}, 
		                   { number: 1, text: '开放平台'}, 
		                   { number: 2, text: '流量管理平台'}];
		$scope.opNameList=[{ number: null, text: '全部'}, 
		                   { number: 1, text: '移动'}, 
		                   { number: 2, text: '电信'},
		                   { number: 3, text: '联通'}];
		
		$scope.transStatusList=[{ number: null, text: '全部'}, 
		                   { number: 1, text: '申请迁移'}, 
		                   { number: 2, text: '迁移成功'},
		                   { number: 3, text: '迁移失败'}];
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
		$scope.transferSearchForm = function() {
			$scope.dtInstance.query($scope.transferQuery);
		};
		
		// 高级搜索按钮
		$scope.transferHighSearchForm = function() {
			var transferQuery = {};
			if($scope.transferQuery.iccidValue!=null&&$scope.transferQuery.iccidValue!=''){
				if($scope.transferQuery.iccidType.number==1){
					transferQuery.dstIccid=$scope.transferQuery.iccidValue;
				}else{
					transferQuery.srcIccid=$scope.transferQuery.iccidValue;
				}
			}
			if($scope.transferQuery.imsiValue!=null&&$scope.transferQuery.imsiValue!=''){
				if($scope.transferQuery.imsiType.number==1){
					transferQuery.dstImsi=$scope.transferQuery.imsiValue;
				}else{
					transferQuery.srcImsi=$scope.transferQuery.imsiValue;
				}
			}
			if($scope.transferQuery.cardNoValue!=null&&$scope.transferQuery.cardNoValue!=''){
				if($scope.transferQuery.cardNoType.number==1){
					transferQuery.dstCardNo=$scope.transferQuery.cardNoValue;
				}else{
					transferQuery.srcCardNo=$scope.transferQuery.cardNoValue;
				}
			}					
			if($scope.transferQuery.requestTime && $scope.transferQuery.requestTime.startDate && $scope.transferQuery.requestTime.endDate){
				transferQuery.requestStartTime=$scope.transferQuery.requestTime.startDate.format('YYYY-MM-DD 00:00:00');
				transferQuery.requestEndTime=$scope.transferQuery.requestTime.endDate.format('YYYY-MM-DD 23:59:59');
			}
			if($scope.transferQuery.transTime && $scope.transferQuery.transTime.startDate && $scope.transferQuery.transTime.endDate){
				transferQuery.transStartTime=$scope.transferQuery.transTime.startDate.format('YYYY-MM-DD 00:00:00');
				transferQuery.transEndTime=$scope.transferQuery.transTime.endDate.format('YYYY-MM-DD 23:59:59');
			}
			if($scope.transferQuery.source!=null){
				transferQuery.source=$scope.transferQuery.source.number;
			}
			if($scope.transferQuery.spName!=null&&$scope.transferQuery.spName.number!=null){
				transferQuery.spName=$scope.transferQuery.spName.text;
			}
			if($scope.transferQuery.opName!=null){
				transferQuery.opName=$scope.transferQuery.opName.number;
			}
			if($scope.transferQuery.transStatus!=null){
				transferQuery.transStatus=$scope.transferQuery.transStatus.number;
			}
	
			$scope.dtInstance.query(transferQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		};
		
		
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.transferQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.transferQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var transferQuery = $scope.transferQuery;
			transferQuery.iccidType=$scope.typeList[0];
			transferQuery.imsiType=$scope.typeList[0];
			transferQuery.cardNoType=$scope.typeList[0];
			transferQuery.iccidValue=null;
			transferQuery.requestTime=null;
			transferQuery.cardNoValue=null;
			transferQuery.transTime=null;
			transferQuery.imsiValue=null;
			transferQuery.source=null;
			transferQuery.spName=null;
			transferQuery.opName=null;
			transferQuery.transStatus=null;
		};
		
		// 打开创建窗口
		$scope.openCreateTransferWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/recovery/transfer/view/create.html',
				controller : 'createTransferCtrl',
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
		
		// 打开迁移窗口
		$scope.transfer = function(data) {
			var obj={};
			obj.transRecordId=data;
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/recovery/transfer/view/transfer.html',
				controller : 'transferCtrl',
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

	angular.module('recovery').controller('transferListCtrl', transferListCtrl);
})(angular);

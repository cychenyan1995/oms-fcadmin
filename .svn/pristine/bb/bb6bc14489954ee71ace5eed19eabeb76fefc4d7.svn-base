(function(angular) {
	function nameauthListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, authService,opService, $templateRequest,
			$uibModal) {
		
		//搜索关键字
		$scope.nameauthQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([]);
		
		//审核状态列表
		$scope.statusList = [
            { number: null, text: '全部'}, 
            { number: 0, text: '待审核'}, 
            { number: 1, text: '审核通过'}, 
            { number: 2, text: '审核不通过'}, 
            { number: 3, text: '重新审核'}];
		
		//运营商类型列表
		$scope.ownedList = [
            { number: null, text: '全部'}, 
            { number: 1, text: '移动'}, 
            { number: 2, text: '电信'}, 
            { number: 3, text: '联通'}];
		
		//运营商名称列表
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
				serverData : authService.getNameauthAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 10;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('iccid').withOption('width',columnWidth).withTitle('ICCID'),
				DTColumnBuilder.newColumn('imsi').withOption('width',80).withTitle('IMSI'),
				DTColumnBuilder.newColumn('cardNo').withOption('width',80).withTitle('网卡号'),
				DTColumnBuilder.newColumn('owned').withOption('width',45).withTitle('运营商类型').renderWith(getOpType),
				DTColumnBuilder.newColumn('opName').withOption('width',50).withTitle('运营商名称'),
				DTColumnBuilder.newColumn('status').withOption('width',45).withTitle('审核状态').renderWith(getStatus),
				DTColumnBuilder.newColumn('failReason').withOption('width',120).withOption('ellipsis',true).withTitle('不通过原因').renderWith(getFailReason),
				DTColumnBuilder.newColumn('option').withOption('width',40).withTitle('操作').renderWith(operate),
				];
		
		function getOpType(e, dt, node, config) {
			if (node.owned == 1)
				return "移动"
			else if (node.owned == 2)
				return "电信"
			else if (node.owned == 3)
				return "联通"
			return '--';
		}
		
		function getStatus(e, dt, node, config) {
			if (node.status == 0)
				return "待审核"
			else if (node.status == 1)
				return '<span style="color:green;">审核通过</span>'
			else if (node.status == 2)
				return '<span style="color:red;">审核不通过</span>'
			else if (node.status == 3)
				return '<span style="color:orange;">重新审核</span>'
			return '--';
		}
		
		function getFailReason(e, dt, node, config) {
			if(node.failReason == "" || node.failReason == null || node.failReason == "null"){
				return ' ';
			}else{
				return node.failReason;
			}
		}
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
				operateHtml = '<a href="javascript:;" ng-click="nameauthDetail(item);">审核详情</a>';
			return operateHtml;
		}
		
		// 搜索按钮
		$scope.nameauthSearchForm = function() {
			$scope.dtInstance.query($scope.nameauthQuery);
		};
		
		// 高级搜索按钮
		$scope.nameauthHighSearchForm = function() {

			var nameauthQuery = angular.extend({},$scope.nameauthQuery);
			
			if(null != $scope.nameauthQuery.status){
				nameauthQuery.status = $scope.nameauthQuery.status.number;
			}
			
			if(null != $scope.nameauthQuery.owned){
				nameauthQuery.owned = $scope.nameauthQuery.owned.number;
			}
			
			if(null != $scope.nameauthQuery.opName){
				nameauthQuery.opName = $scope.nameauthQuery.opName.number;
			}
			
			$scope.dtInstance.query(nameauthQuery);
			$scope.advanceExpand = true;
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		};
		
		// 高级搜索层控制
		$scope.toggleAdvance = function() {
			// 关闭高级搜索框
			$scope.advanceExpand = true;
			$scope.advanceExpands = true;
			$scope.advanceExpandShow = true;
			$scope.nameauthQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
		};
		
		$scope.toggleClose = function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.nameauthQuery.keyWork = $scope.advanceExpand ? '已启用高级搜索' : '';
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		// 高级搜索重置按钮
		$scope.resetForm = function(id, state) {
			// 清空高级搜索查询条件
			var nameauth = $scope.nameauthQuery;
			//清空高级搜索查询条件
			nameauth.iccid = null;
			nameauth.imsi = null;
			nameauth.cardNo = null;
			nameauth.status = null;
			nameauth.owned = null;
			nameauth.opName = null;
		};
		
		//获取实名认证审核详情
		$scope.nameauthDetail = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/auth/nameauth/view/detail.html',
				controller : 'operateAuthCtrl',
				size : 'mdx',
				resolve : {
					param : function() {
						return item;
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query();
			});
		}
	}
	
	//获取实名认证详情操作
	function operateAuthCtrl($scope, $uibModal, $uibModalInstance, param, $sce, authService) {
		$scope.nameAuth=param;
		
		$scope.status = function(value){
			if (value == 0)
				return "待审核"
			else if (value == 1)
				return  $sce.trustAsHtml('<span style="color: green">审核通过</span>');
			else if (value == 2)
				return  $sce.trustAsHtml('<span style="color: red">审核不通过</span>');
			else if (value == 3)
				return  $sce.trustAsHtml('<span style="color: orange">重新审核</span>');
			return '--';
		}
		
		$scope.cancel = function() {
			$uibModalInstance.close();
		};

		// 打开审核不通过确认窗口
		$scope.unPassApprove = function(item) {
			var modalInstance = $uibModal.open({
				templateUrl : 'unPass.html',
				controller : 'operateUnpassCtrl',
				size: 'md',
				resolve : {
					param : function() {
						return param;
					}
				}
			});
		
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$uibModalInstance.close();
			});
		
		};
		
		$scope.approveAuth = function() {
			swal({
				title: "",  
		        text: "请确认审核是否通过",  
		        type: "warning", 
		        showCancelButton: true, 
		        closeOnConfirm: false, 
		        confirmButtonText: "确定", 
		        cancelButtonText:"取消",  
		        animation:"slide-from-top",
		        showLoaderOnConfirm: true 
			},function() { 
				authService.approveAuth({id:param.nameauthId,iccid:param.iccid,imsi:param.imsi,
					cardNo:param.cardNo,openId:param.openId,type:1}, function(data) {
					if (data.result) {
						swal({
							title : "",
							text : "审核成功!",
							timer : 3000,
							type : "success",
							showConfirmButton : false
						});
						$uibModalInstance.close();
					} else {
						swal({
							title : "",
							text : "审核失败!",
							timer : 3000,
							type : "error",
							showConfirmButton : false
						});
					}
				});
			});
		};
	}
	
	//获取实名认证详情操作
	function operateUnpassCtrl($scope, $uibModalInstance, param, authService) {
		
		$scope.unPassAuth = function() {
			var failReason = "";
			if ($scope.active_form.$valid) {
				failReason = $scope.description;
				authService.approveAuth({id:param.nameauthId,iccid:param.iccid,imsi:param.imsi,
					cardNo:param.cardNo,openId:param.openId,type:2,failReason:failReason}, function(data) {
					if (data.result) {
						swal({
							title : "",
							text : "审核成功!",
							timer : 3000,
							type : "success",
							showConfirmButton : false
						});
						$uibModalInstance.close();
					} else {
						swal({
							title : "",
							text : "审核失败!",
							timer : 3000,
							type : "error",
							showConfirmButton : false
						});
					}
				});
			} else {
				$scope.active_form.submitted = true;
			}
		};
		
		$scope.cancel = function() {
			$uibModalInstance.close();
		};
	}

	angular.module('auth')
		.controller('nameauthListCtrl', nameauthListCtrl)
		.controller('operateAuthCtrl',operateAuthCtrl)
		.controller('operateUnpassCtrl',operateUnpassCtrl);
})(angular);

(function(angular) {
	function opListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, opService, $templateRequest,
			$uibModal, $filter) {
		
	
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '新建联通帐号',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateLtOpWindow();
			}
		},{
			text : '新建移动帐号',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openCreateYdOpWindow();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : opService.getOpAll
		};
			
		var screenWidth = $(window).width() - 512;
		var percent = 8;
		var columnWidth = screenWidth/percent;
		
		// 定义DataTables选项
		$scope.dtOptions2 = DTOptionsBuilder.newOptions()
		.withButtons([])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance2 = {
				serverData : opService.getMOpAll
		};
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('opCode').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('运营商号'),
				DTColumnBuilder.newColumn('opName').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('运营商名称'),
				DTColumnBuilder.newColumn('svrUsers').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('用户名'),
				DTColumnBuilder.newColumn('svrPassword').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('密码').renderWith(
						function(e, dt, node, config) {
							return "******";
						}),
				DTColumnBuilder.newColumn('commKey').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('license key'),
				DTColumnBuilder.newColumn('contactPerson').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('联系人'),
				DTColumnBuilder.newColumn('contactMobile').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('联系电话'),
				DTColumnBuilder.newColumn('createTime').withOption('width',150).withOption('ellipsis',true).withTitle('创建时间').renderWith(
						function(e, dt, node, config) {
							return $filter('date')(node.createTime,
									'yyyy-MM-dd HH:mm:ss')
						})
				];

		
		
		// 定义表头Column
		$scope.dtColumns2 = [
				DTColumnBuilder.newColumn('opCode').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('运营商号'),
				DTColumnBuilder.newColumn('opName').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('运营商名称'),
				DTColumnBuilder.newColumn('url').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('URL').renderWith(
						function(e, dt, node, config) {
							if(node.url == null){
								return " ";
							}else{
								return node.url;
							}
						}),
				DTColumnBuilder.newColumn('svrUsers').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('用户名'),
				DTColumnBuilder.newColumn('appkey').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('appkey').renderWith(
						function(e, dt, node, config) {
							if(node.appkey == null){
								return " ";
							}else{
								return node.appkey;
							}
						}),
				DTColumnBuilder.newColumn('contactPerson').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('联系人'),
				DTColumnBuilder.newColumn('contactMobile').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('联系电话'),
				DTColumnBuilder.newColumn('createTime').withOption('width',150).withOption('ellipsis',true).withTitle('创建时间').renderWith(
						function(e, dt, node, config) {
							return $filter('date')(node.createTime,
									'yyyy-MM-dd HH:mm:ss')
						})
				];

		
		
		// 打开创建窗口
		$scope.openCreateYdOpWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/op/op/view/createYd.html',
				controller : 'createYdOpCtrl',
				resolve : {
					param : function() {
						return {};
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance2.query({});
			});
		};
		
		
		// 打开创建窗口
		$scope.openCreateLtOpWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/op/op/view/createLt.html',
				controller : 'createLtOpCtrl',
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
	}

	angular.module('op').controller('opListCtrl', opListCtrl);
})(angular);

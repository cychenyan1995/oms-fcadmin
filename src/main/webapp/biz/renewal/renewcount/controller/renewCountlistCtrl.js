(function(angular) {
	function renewCountListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, renewCountService , $templateRequest,
			$uibModal) {
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([]);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : renewCountService.getRenewInfo
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 7;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
		    				DTColumnBuilder.newColumn('orderPaytime').withOption('width',128).withTitle('月份'),
		    		        DTColumnBuilder.newColumn('spIdName').withOption('width',columnWidth + 36).withTitle('服务商名称'),
		    		        DTColumnBuilder.newColumn('allTotalNum').withOption('width',128).withTitle('续费总次数'),
		    		        DTColumnBuilder.newColumn('allTotalMoney').withOption('width',128).withTitle('续费总金额'),
		    		        DTColumnBuilder.newColumn('wechatTotalNum').withOption('width',128).withTitle('微信续费次数'),
		    		        DTColumnBuilder.newColumn('wechatTotalMoney').withOption('width',128).withTitle('微信续费金额'),
		    		        DTColumnBuilder.newColumn('openTotalNum').withOption('width',128).withTitle('开放平台续费次数'),
		    		        DTColumnBuilder.newColumn('openTotalMoney').withOption('width',128).withTitle('开放平台续费金额')		    	
		    				];
	}
angular.module('renewal')
	.controller('renewCountListCtrl', renewCountListCtrl)
})(angular);

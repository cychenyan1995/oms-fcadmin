(function(angular) {
	function flowPoolListCtrl($scope, DTOptionsBuilder, DTColumnBuilder,cardService,$uibModal, $filter) {
		
		//搜索关键字
		$scope.flowPoolQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '创建',
			action : function(e, dt, node, config) {
				$scope.openCreateFlowPoolWindow();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : cardService.getFlowPoolAll
		};
		
		// 定义DataTables选项
		$scope.dtOptions2 = DTOptionsBuilder.newOptions()
		.withButtons([])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance2 = {
				serverData : cardService.getFlowPoolMonthDetail
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 7;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('flowpoolName').withOption('width',columnWidth + 36).withOption('ellipsis',true).withTitle('流量池名称'),
				DTColumnBuilder.newColumn('opName').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('运营商名称'),
				DTColumnBuilder.newColumn('postageName').withOption('width',columnWidth + 150).withTitle('资费计划名称').renderWith(setPostageName),
				DTColumnBuilder.newColumn('currmonthTotalflow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('本月流量池（MB）'),
				DTColumnBuilder.newColumn('currmonthUsedflow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('本月累计消耗（MB）'),
				DTColumnBuilder.newColumn('currmonthRemainflow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('本月剩余流量（MB）'),
				DTColumnBuilder.newColumn('cardTotal').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('卡总数').renderWith(setCardTotal),
				DTColumnBuilder.newColumn('notopenCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('未开卡总数').renderWith(setNotopenCard),
				DTColumnBuilder.newColumn('openCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('开卡总数').renderWith(setOpenCard),
				DTColumnBuilder.newColumn('cancelCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('销卡总数').renderWith(setCancelCard),
				DTColumnBuilder.newColumn('createTime').withOption('width',columnWidth + 36).withTitle('创建时间').renderWith(
						function(e, dt, node, config) {
							return $filter('date')(node.createTime,
									'yyyy-MM-dd HH:mm:ss')
						})
				];
		
		function setPostageName(e, dt, node, config){
			if(node.postageName == null || node.postageName == "" || node.postageName == undefined){
				return "";
			}else{
				return node.postageName;
			}
		}
		function setCardTotal(e, dt, node, config){
			if(node.cardTotal == null || node.cardTotal == "" || node.cardTotal == undefined){
				return "";
			}else{
				return node.cardTotal;
			}
		}
		function setNotopenCard(e, dt, node, config){
			if(node.notopenCard == null || node.notopenCard == "" || node.notopenCard == undefined){
				return "";
			}else{
				return node.notopenCard;
			}
		}
		function setOpenCard(e, dt, node, config){
			if(node.openCard == null || node.openCard == "" || node.openCard == undefined){
				return "";
			}else{
				return node.openCard;
			}
		}
		function setCancelCard(e, dt, node, config){
			if(node.cancelCard == null || node.cancelCard == "" || node.cancelCard == undefined){
				return "";
			}else{
				return node.cancelCard;
			}
		}
		
		// 定义表头Column
		$scope.dtColumns2 = [
		        DTColumnBuilder.newColumn('consumeMonth').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('月份'),
				DTColumnBuilder.newColumn('flowpoolName').withOption('width',columnWidth + 36).withOption('ellipsis',true).withTitle('流量池名称'),
				DTColumnBuilder.newColumn('spName').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('服务商名称').renderWith(setSpName),
				DTColumnBuilder.newColumn('currmonthTotalflow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('本月流量池（MB）'),
				DTColumnBuilder.newColumn('currmonthUsedflow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('本月累计消耗（MB）'),
				DTColumnBuilder.newColumn('currmonthRemainflow').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('本月剩余流量（MB）').renderWith(setCurrmonthRemainflow),
				DTColumnBuilder.newColumn('cardTotal').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('卡总数'),
				DTColumnBuilder.newColumn('addCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('新增购卡总数'),
				DTColumnBuilder.newColumn('stockCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐库存总数'),
				DTColumnBuilder.newColumn('openCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐已激活总数'),
				DTColumnBuilder.newColumn('cancelCard').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('套餐已过期总数')
				];
		
		function setSpName(e, dt, node, config){
			if(node.spName == null || node.spName == undefined){
				return "流量管理平台";
			}else{
				return node.spName;
			}
		}
		
		function setCurrmonthRemainflow(e, dt, node, config){
			var currmonthRemainflow=(node.currmonthTotalflow-node.currmonthUsedflow).toFixed(2);
			return currmonthRemainflow;
		}
	
		
		// 打开创建窗口
		$scope.openCreateFlowPoolWindow = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/card/flowpool/view/create.html',
				controller : 'createFlowPoolCtrl',
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
		
	}

	angular.module('card').controller('flowPoolListCtrl', flowPoolListCtrl);
})(angular);

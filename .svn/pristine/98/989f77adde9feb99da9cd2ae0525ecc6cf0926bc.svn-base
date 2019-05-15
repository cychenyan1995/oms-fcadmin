(function(angular) {
	function flowcardListCtrl($scope, DTOptionsBuilder, DTColumnBuilder,$filter,
			$state,$templateRequest,$compile,SweetAlert,FileUploader,$uibModal,flowcardService,spService) {
		
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
				$scope.operateCard(0);
			}
		},{
			text : '停用',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.operateCard(1);
			}
		},{
			text : '导出',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportCard();
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
		
		var screenWidth = $(window).width() - 512;
		var percent = 6;
		var columnWidth = screenWidth/percent;
		
		
		
		$scope.dtInstance = {
				//获取列表信息
				serverData : flowcardService.getAll
			};
		
		//移动卡状态高级搜索下拉框列表
		$scope.statusList = [
			                { number: null, text: '全部'}, 
			                { number: 0, text: '测试期'}, 
			                { number: 1, text: '库存期'}, 
			                { number: 2, text: '沉默期'}, 
			                { number: 3, text: '预约销户'}, 
			                { number: 4, text: '正使用'},
			                { number: 5, text: '停机'},
			                { number: 6, text: '销户'}];
		
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
		
		//套餐状态列表
		$scope.packageStatusList = [
			                { number: null, text: '全部'}, 
			                { number: 0, text: '库存'}, 
			                { number: 1, text: '已激活'}, 
			                { number: 2, text: '已过期'}];
		
		
		// 定义表头Column
		$scope.dtColumns = [
			DTColumnBuilder.newColumn('iccid').withOption('width',columnWidth).withTitle('ICCID').renderWith(showDetail),
			DTColumnBuilder.newColumn('imei').withOption('width',100).withTitle('IMEI'),
			DTColumnBuilder.newColumn('cardStatus').withOption('width',45).withTitle('卡状态').renderWith(cardStatus),
			DTColumnBuilder.newColumn('packageStatus').withOption('width',56).withTitle('套餐状态').renderWith(packageStatus),
			DTColumnBuilder.newColumn('isAuthname').withOption('width',56).withTitle('实名认证').renderWith(isAuthnameStatus),
			DTColumnBuilder.newColumn('totalFlow').withOption('width',130).withTitle('套餐—总流量(MB)').renderWith(getTotalFlow),
			DTColumnBuilder.newColumn('remainTotalflow').withOption('width',130).withTitle('套餐—剩余流量(MB)').renderWith(getRemainFlow),
			DTColumnBuilder.newColumn('usedTotalflow').withOption('width',130).withTitle('套餐—消耗流量(MB)'),
			DTColumnBuilder.newColumn('consumeMonthflow').withOption('width',100).withTitle('本月消耗(MB)'),
			DTColumnBuilder.newColumn('packageBegintime').withOption('width',120).withTitle('套餐开通时间'),
			DTColumnBuilder.newColumn('packageEndtime').withOption('width',120).withTitle('套餐结束时间'),
			DTColumnBuilder.newColumn('outStockTime').withOption('width',120).withTitle('出库时间'),
			DTColumnBuilder.newColumn('activeTime').withOption('width',120).withTitle('卡激活时间'),
			DTColumnBuilder.newColumn('openAccountTime').withOption('width',120).withTitle('开户时间'),
			DTColumnBuilder.newColumn('statusChangeReason').withOption('width',160).withTitle('卡异常原因')
		];
		
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
			
			if(null != $scope.flowCardQuery.spId){
				flowCardQuery.spId = $scope.flowCardQuery.spId.number;
			}
			
			if(null != $scope.flowCardQuery.cardStatus){
				flowCardQuery.cardStatus = $scope.flowCardQuery.cardStatus.number;
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
			
			//开户时间.......
		/*	if (flowCardQuery.openAccountTime && flowCardQuery.openAccountTime.startDate
					&& flowCardQuery.openAccountTime.endDate) {
				var openAccountBegintime = flowCardQuery.openAccountTime.startDate
						.format('YYYY-MM-DD');
				var openAccountEndtime = flowCardQuery.openAccountTime.endDate
				.format('YYYY-MM-DD');
				flowCardQuery.openAccountBegintime = openAccountBegintime;
				flowCardQuery.openAccountEndtime = openAccountEndtime;
			}*/
			if (flowCardQuery.openAccountTime && flowCardQuery.openAccountTime.startDate
					&& flowCardQuery.openAccountTime.endDate) {
				var openAccountBegintime = flowCardQuery.openAccountTime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var openAccountEndtime = flowCardQuery.openAccountTime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.openAccountBegintime = openAccountBegintime;
				flowCardQuery.openAccountEndtime = openAccountEndtime;
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
			//套餐结束时间
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
		
		  // 单选日期配置
       /* $scope.singleDateSettings = {
            singleDatePicker: true,
            locale: {
                format: 'YYYY-MM-DD',
                applyLabel: '确定',
                cancelLabel: '取消',
                fromLabel: '开始',
                toLabel: '结束',
                customRangeLabel: '自定义',
                monthNames: '一月_二月_三月_四月_五月_六月_七月_八月_九月_十月_十一月_十二月'.split('_'),
                daysOfWeek: '一_二_三_四_五_六_日'.split('_')
            },
            timePicker: false,
            autoUpdateInput: true
        };*/
		
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
			flowCard.spId = null;
			flowCard.packageBegintime = null;
			flowCard.packageEndtime = null;
			flowCard.inStockTime = null;
			flowCard.outStockTime = null;
			flowCard.activeTime = null;
			flowCard.cardStatus = null;
			flowCard.packageStatus = null;
			flowCard.curUsedSmall = null;
			flowCard.curUsedBig = null;
			flowCard.totalSmall = null;
			flowCard.totalBig = null;
			flowCard.usedSmall = null;
			flowCard.usedBig = null;
			flowCard.remainSmall = null;
			flowCard.remainBig = null;			flowCard.openAccountTime = null;
		};
		
		function cardStatus(e, dt, node, config) {
			if (node.cardStatus == 0)
				return '<span style="color:orange;">测试期</span>'
			else if (node.cardStatus == 1)
				return '<span style="color:orange;">库存期</span>'
			else if (node.cardStatus == 2)
				return '<span style="color:orange;">沉默期</span>'
			else if (node.cardStatus == 3)
				return '<span style="color:red;">预约销户</span>'
			else if (node.cardStatus == 4)
				return '<span style="color:green;">正使用</span>'
			else if (node.cardStatus ==5)
				return '<span style="color:red;">停机</span>'
			else if (node.cardStatus ==6)
				return '<span style="color:red;">销户</span>'
			return '--';
		}
		
		//packageStatus
		function packageStatus(e,dt,node,config){
			if (node.packageStatus == 0) {
				return "库存"
			}
			else if (node.packageStatus == 1 && node.emptyStatus == 0){
				return "已激活"
			}
			else if (node.packageStatus == 1 && node.emptyStatus == 1){
				return "--"
			}
			else if (node.packageStatus == 2) {
				return "已过期"
			}
			return '';
		}
		
		//isAuthnameStatus
		function isAuthnameStatus(e,dt,node,config){
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
		
		//showDetail
		function showDetail(e, dt, node, config) {
			return '<a href="javascript:;" ng-click="cardDetail(item);">'+ node.iccid +'</a>';
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
		
		// 打开导入卡窗口
		$scope.openImportFlowCard = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/mobileCard/cardManage/view/importCard.html',
				controller : 'importCardCtrl',
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
		
		//获取卡详情
		$scope.cardDetail = function(item) {
			var cardId = item.cardId;
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/mobileCard/cardManage/view/detail.html',
				controller : 'operateCardDetailCtrl',
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
		//导出卡
		$scope.exportCard=function(){
			var obj={};
			var flowCardQuery = angular.extend({},$scope.flowCardQuery);
			
			if(null != flowCardQuery.isAuthname){
				flowCardQuery.isAuthname = flowCardQuery.isAuthname.number;
			}
			
			if(null != flowCardQuery.statusChangeReason){
				flowCardQuery.statusChangeReason = flowCardQuery.statusChangeReason.number;
			}
			
			if(null != flowCardQuery.spId){
				flowCardQuery.spId = flowCardQuery.spId.number;
			}
			
			if(null != $scope.flowCardQuery.cardStatus){
				flowCardQuery.cardStatus = $scope.flowCardQuery.cardStatus.number;
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
			flowCardQuery.activeTime="";
			
			//开户时间.......
			if (flowCardQuery.openAccountTime && flowCardQuery.openAccountTime.startDate
					&& flowCardQuery.openAccountTime.endDate) {
				var openAccountBegintime = flowCardQuery.openAccountTime.startDate
						.format('YYYY-MM-DD');
				var openAccountEndtime = flowCardQuery.openAccountTime.endDate
				.format('YYYY-MM-DD');
				flowCardQuery.openAccountBegintime = openAccountBegintime;
				flowCardQuery.openAccountEndtime = openAccountEndtime;
			}
			flowCardQuery.openAccountTime="";
			
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
			flowCardQuery.packageBegintime="";
			
			//套餐结束时间
			if (flowCardQuery.packageEndtime && flowCardQuery.packageEndtime.startDate
					&& flowCardQuery.packageEndtime.endDate) {
				var startTime = flowCardQuery.packageEndtime.startDate
						.format('YYYY-MM-DD 00:00:00');
				var endTime = flowCardQuery.packageEndtime.endDate
						.format('YYYY-MM-DD 23:59:59');
				flowCardQuery.startDate = startTime;
				flowCardQuery.endDate = endTime;
			}
			flowCardQuery.packageEndtime="";
			
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
			flowCardQuery.inStockTime="";
			
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
			flowCardQuery.outStockTime="";
			
			flowcardService.exportFlowCardFile(flowCardQuery, function(data) {
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
		}
		
		//单卡启用、停用
		$scope.operateCard = function(value) {
			var items = $scope.dtInstance.getSelectItems();
			var list=[];
			if (items.length > 0) {
				var iccid;
				var status;
				var imsi;
				angular.forEach(items, function(i) {
					var obj = {};
					imsi = i.imsi;
					iccid = i.iccid;
					status=i.cardStatus;
					obj.iccid = i.iccid;
					obj.op = value;
					list.push(obj);
				});
				if(value == 0){//启用卡
				/*	if(status == 6){ 
						var str = "";
						if(status == 6){
							str = "销户";
						}
						SweetAlert.swal({
		        			title: "",
		            	    text: "当前卡状态为["+str+"],不支持启用",
		            	    type: "warning",
		            	    showCancelButton: false,
		            	    confirmButtonColor: "#DD6B55",
		            	    confirmButtonText: "确定",
		            	    closeOnConfirm: true });
					}*/  //else{ 暂时不做限制
						var modalInstance = $uibModal.open({
							templateUrl : 'biz/mobileCard/cardManage/view/operateActive.html',
							controller : 'operateActiveCtrl',
							resolve : {
								param : function() {
									return {
										imsi : imsi,
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
					//}
				}else if(value == 1){//停用卡
					/*if(status == 0 || status == 1 || status == 2 || status == 5|| status == 6){ 
						var str = "";
						if(status == 0){
							str = "测试期";
						}else if(status == 2){
							str = "沉默期";
						}else if(status == 1){
							str = "库存期";
						}else if(status == 5){
							str="停机"
						}else if(status == 6){
							str = "销户";
						}
						SweetAlert.swal({
		        			title: "",
		            	    text: "当前卡状态为["+str+"],不支持停用",
		            	    type: "warning",
		            	    showCancelButton: false,
		            	    confirmButtonColor: "#DD6B55",
		            	    confirmButtonText: "确定",
		            	    closeOnConfirm: true });
					}*/ //else{  暂时不做判断
						var modalInstance = $uibModal.open({
							templateUrl : 'biz/mobileCard/cardManage/view/operateStop.html',
							controller : 'operateStopCtrl',
							resolve : {
								param : function() {
									return {
										imsi:imsi,
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
					//}
				}
				
			}else{
				var msg = "";
				if(value == 0){
					msg = "请选择需要启用的流量卡！";
				}else if(value == 1){
					msg = "请选择需要停用的流量卡！";
				}
				SweetAlert.swal({
        			title: "",
            	    text: msg,
            	    type: "warning",
            	    showCancelButton: false,
            	    confirmButtonColor: "#DD6B55",
            	    confirmButtonText: "确定",
            	    closeOnConfirm: true });
			}
		}
	}
	
	angular.module(flowcardModel).controller('flowcardListCtrl', flowcardListCtrl);
})(angular);

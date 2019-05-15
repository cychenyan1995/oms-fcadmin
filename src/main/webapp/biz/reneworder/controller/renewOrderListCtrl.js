(function(angular) {
	function renewOrderListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope,SweetAlert, $compile, FileUploader,
			renewOrderService,spService,flowPackageService,cardService, $templateRequest,
			$uibModal) {
		//搜索关键字
		$scope.renewOrderQuery={
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([/*{
			text : '续费',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.renewCards();
			}
		},{
			text : '批量续费',
			className: 'btn btn-primary',
			action : function(e, dt, node, config) {
				$scope.batchRenewCards();
			}
		},*/{
			text : '导出',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportRenewOrderFile();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        });
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : renewOrderService.findList
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		$scope.sourceList=[
		                   {number: '', text: '全部'},
		                   {number: 0, text: '微信商城'},
		                   {number: 1, text: '流量管理平台'},
		                   {number: 2, text: '开放平台'}];
		
		$scope.payStatusList=[
		                   {number: '', text: '全部'},
		                   {number: 0, text: '待付款'},
		                   {number: 1, text: '已支付'},
		                   {number: 2, text: '线下支付'}
		                   ];
		
		
		$scope.openStatusList=[
			                   {number: '', text: '全部'},
			                   {number: 0, text: '未开通'},
			                   {number: 1, text: '待开通'},
			                   {number: 2, text: '开通成功'},
			                   {number: 3, text: '开通失败'}];
		
		var screenWidth = $(window).width() - 512;
		var percent = 7;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('orderNo').withOption('width',columnWidth + 36).withTitle('订单编号'),
		        DTColumnBuilder.newColumn('iccid').withOption('width',columnWidth + 36).withTitle('ICCID'),
		        DTColumnBuilder.newColumn('imsi').withOption('width',columnWidth + 36).withTitle('IMSI'),
		        DTColumnBuilder.newColumn('cardNo').withOption('width',columnWidth + 36).withTitle('网卡号'),
		        DTColumnBuilder.newColumn('source').withOption('width',128).withTitle('来源').renderWith(setSource),
		        DTColumnBuilder.newColumn('merchantName').withOption('width',columnWidth + 66).withTitle('服务商名称').renderWith(setMerchantName),
		        DTColumnBuilder.newColumn('packageName').withOption('width',columnWidth + 66).withTitle('套餐名称'),
		        DTColumnBuilder.newColumn('orderPrice').withOption('width',64).withTitle('价格'),
		        DTColumnBuilder.newColumn('payStatus').withOption('width',128).withTitle('付款状态').renderWith(setPayStatus),
		        DTColumnBuilder.newColumn('openStatus').withOption('width',128).withTitle('开通状态').renderWith(setOpenStatus),
		        DTColumnBuilder.newColumn('payNo').withOption('width',columnWidth + 96).withTitle('交易流水号'),
		        DTColumnBuilder.newColumn('payTime').withOption('width',columnWidth + 36).withTitle('交易时间')
				];
		
		function setSource(e, dt, node, config) {
			if(node.source==0)
				return '微信商城';
			else if(node.source==1)
				return '流量管理平台';
			else if(node.source==2)
				return '开放平台';
			return '--';
		}
		
		function setPayStatus(e, dt, node, config) {
			if(node.payStatus==0)
				return '<span style="color:red";>待付款</span>';
			else if((node.payStatus==1 || node.payStatus==2) && node.source == 0)
				return '<span style="color:green";>已支付</span>';
			else if((node.source==1 || node.source == 2) && (node.payStatus==1 || node.payStatus==2))
				return '<span style="color:green";>线下支付</span>';
			return '--';
		}
		
		function setOpenStatus(e, dt, node, config) {
			if(node.openStatus==0)
				return '<span>未开通</span>';
			else if(node.openStatus==1)
				return '<span style="color:orange";>待开通</span>';
			else if(node.openStatus==2)
				return '<span style="color:green";>开通成功</span>';
			else if(node.openStatus==3)
				return '<span style="color:red";>开通失败</span>';
			return '--';
		}
		
		function setMerchantName(e, dt, node, config){
			if(node.merchantName!=null)
				return node.merchantName;
			else
				return "";
		}
		
		function setPackageName(e, dt, node, config){
			if(node.packageName!=null)
				return node.packageName;
			else
				return "";
		}
		
		
		//获取所有服务商名称   在高级查询中使用
		spService.getSp(function(datas) {
			var list=datas.data;
			var merchantNameList=[];
			merchantNameList.push({
				number : null,
				text : '全部'
			});
			for(var i=0;i<list.length;i++){
				merchantNameList.push({
					number : list[i].spCode,
					text : list[i].spCode+'/'+list[i].spName
				})
			}
			$scope.merchantNameList=merchantNameList;
		})
		
		//获取续费套餐名称  packageType:2
		flowPackageService.getFlowPkg({packageType:2},function(datas) {
			var list= datas.data;
			var packageNameList = [];
			packageNameList.push({
				number : null,
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				packageNameList.push({
					number : list[i].packageCode,
					text : list[i].packageName
				});
			}
			//获取流量包名称 packageType:3
			flowPackageService.getFlowPkg({packageType:3},function(datas) {
				var list= datas.data;
				for (var i = 0; i < list.length; i++) {
					packageNameList.push({
						number : list[i].packageCode,
						text : list[i].packageName
					});
				}
			});
			$scope.packageNameList = packageNameList;
		});
		
		// 搜索按钮
		$scope.renewOrderSearchForm = function() {
			$scope.resetForm();
			
			$scope.dtInstance.query($scope.renewOrderQuery);
		};
		
		//高级搜索
		$scope.renewOrderHighSearchForm=function(){
			//赋值 条件查询
			var renewOrderQuery=angular.extend({},$scope.renewOrderQuery);
			if($scope.renewOrderQuery.merchantName){
				if($scope.renewOrderQuery.merchantName.text=='全部')
					renewOrderQuery.merchantName=null;
				else{
					renewOrderQuery.merchantName = $scope.renewOrderQuery.merchantName.text
				}
			}
			
			if($scope.renewOrderQuery.packageName){
				if($scope.renewOrderQuery.packageName.text=='全部')
					renewOrderQuery.packageName=null;
				else{
					renewOrderQuery.packageName = $scope.renewOrderQuery.packageName.text
				}
			}
			
			//$scope.renewOrderQuery.merchantName && (renewOrderQuery.merchantName = $scope.renewOrderQuery.merchantName.text);
			//$scope.renewOrderQuery.packageName && (renewOrderQuery.packageName = $scope.renewOrderQuery.packageName.text);
			
			//交易时间处理
			if(renewOrderQuery.payTime && renewOrderQuery.payTime.startDate && renewOrderQuery.payTime.endDate){
				var startTime=renewOrderQuery.payTime.startDate
								.format('YYYY-MM-DD 00:00:00');
				var endTime=renewOrderQuery.payTime.endDate
								.format('YYYY-MM-DD 23:59:59');
				renewOrderQuery.startTime=startTime;
				renewOrderQuery.endTime=endTime;
			}
			$scope.renewOrderQuery.source && (renewOrderQuery.source=$scope.renewOrderQuery.source.number);
			$scope.renewOrderQuery.payStatus && (renewOrderQuery.payStatus=$scope.renewOrderQuery.payStatus.number);
			$scope.renewOrderQuery.openStatus && (renewOrderQuery.openStatus=$scope.renewOrderQuery.openStatus.number);
			
			//查询
			$scope.dtInstance.query(renewOrderQuery);
			$scope.advanceExpand=true;
			//关闭高级搜索框
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		}
		
		// 高级搜索层控制
		$scope.toggleClose=function(){
			//关闭高级搜索框
			$scope.advanceExpand=false;
			$scope.advanceExpands=false;
			$scope.advanceExpandShow=false;
			$scope.renewOrderQuery.keyWork=$scope.advanceExpand ? '已启用高级搜索' : '';
			//清空  并查询
			$scope.resetForm();
			$scope.dtInstance.query();
		}
		
		$scope.toggleAdvance=function(){
			$scope.advanceExpand=true;
			$scope.advanceExpands=true;
			$scope.advanceExpandShow=true;
			$scope.renewOrderQuery.keyWork=$scope.advanceExpand ? '已启用高级搜索' : '';
		}
		
		
		//将高级搜索的内容重置
		$scope.resetForm=function(){
			// 清空高级搜索查询条件
			var renewOrder=$scope.renewOrderQuery;
			renewOrder.orderNo=null;
			renewOrder.payNo=null;
			renewOrder.payTime={};
			renewOrder.source=null;
			renewOrder.iccid=null;
			renewOrder.imsi=null;
			renewOrder.cardNo=null;
			renewOrder.packageName=null;
			renewOrder.merchantName=null;
			renewOrder.payStatus=null;
			renewOrder.openStatus=null;
		}
		
		//导出
		$scope.exportRenewOrderFile=function(){
			var renewOrderQuery=angular.extend({},$scope.renewOrderQuery);
			
			$scope.renewOrderQuery.merchantName && (renewOrderQuery.merchantName = $scope.renewOrderQuery.merchantName.text);
			$scope.renewOrderQuery.packageName && (renewOrderQuery.packageName = $scope.renewOrderQuery.packageName.text);
			$scope.renewOrderQuery.source && (renewOrderQuery.source=$scope.renewOrderQuery.source.number);
			$scope.renewOrderQuery.payStatus && (renewOrderQuery.payStatus=$scope.renewOrderQuery.payStatus.number);
			$scope.renewOrderQuery.openStatus && (renewOrderQuery.openStatus=$scope.renewOrderQuery.openStatus.number);
			//时间
			if(renewOrderQuery.payTime && renewOrderQuery.payTime.startDate && renewOrderQuery.payTime.endDate){
				var startTime=renewOrderQuery.payTime.startDate
								.format('YYYY-MM-DD 00:00:00');
				var endTime=renewOrderQuery.payTime.endDate
								.format('YYYY-MM-DD 23:59:59');
				renewOrderQuery.startTime=startTime;
				renewOrderQuery.endTime=endTime;
			}
			renewOrderQuery.payTime="";
			
			renewOrderService.exportRenewOrderFile(renewOrderQuery, function(data){
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
			})
		};
		
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
					status=i.cardStatus;
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
						templateUrl : 'biz/reneworder/view/operateRenew.html',
						controller : 'operateRenewCtrl',
						size : 'md',
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
		
		//批量续费
		// 打开批量导入操作窗口
		$scope.batchRenewCards = function() {
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/reneworder/view/batchRenewCards.html',
				controller : 'batchRenewCardsCardCtrl',
				size : 'md',
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
	}
	
	//批量续费操作
	function batchRenewCardsCardCtrl($scope, $uibModal,$uibModalInstance, param, $filter, 
			$compile,$http,FileUploader,cardService,flowPackageService) {
		$scope.renewIsShow=false;
		$scope.renewLoadShow=false;
		
		var renewFlag = "";
		var renewFileUrl = "";
		
		//下载模板
		$scope.downloadTemplate=function(type){
			var path = "card/downloadTemplate?downloadType="+type;
			location.href=path;
		}
		
		//导出失败列表
		$scope.downloadFile = function (type) {
				if(renewFileUrl != "" && renewFileUrl != null && renewFileUrl != "null"){
					location.href = renewFileUrl;
				}
        }
		
		var packageType = "";
		var relationId = "";
		//获得可续费套餐
		$scope.getPackage=function(){
			var packageList=[];
			packageList.push({
				number:"",
				text:'全部'
			});
			packageType=$scope.flowcardData.packageType;
			
			if(packageType != ""){
				flowPackageService.getFlowPkg({packageType:packageType},function(datas){
					// 展示条件查询中的服务商选项
					var list=datas.data;
					for(var i=0;i<list.length;i++){
						packageList.push({
							number:list[i].packageCode,
				            text:list[i].packageName
						})
					}
					$scope.packageList=packageList;
				});
			}
		}
		
		//选择套餐名  触发change事件
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
						timer : 1000,
						type : "error",
						showConfirmButton : false
					});
				}else if(result.isImported == 1){
					$scope.renewIsShow=true;
					renewFlag = result.msg;
					$scope.renewSuccessCount = result.successCount;
					$scope.renewFailCount = result.failCount;
					renewFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 0){
					$scope.renewIsShow=true;
					renewFlag = result.msg;
					$scope.renewSuccessCount = result.successCount;
					$scope.renewFailCount = result.failCount;
					renewFileUrl = result.url;
					$scope.$apply();
				}else if(result.isImported == 3){
					var msg = result.cause;
					swal({
						title : "",
						text : msg,
						timer : 1000,
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
					cardService.batchOpRenewCards(function(data) {
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
		
		//确认续费
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
	

angular.module('reneworder')
	.controller('renewOrderListCtrl', renewOrderListCtrl)
	.controller('operateRenewCtrl',operateRenewCtrl)
	.controller('batchRenewCardsCardCtrl',batchRenewCardsCardCtrl);
})(angular);
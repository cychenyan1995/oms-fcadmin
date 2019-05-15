(function(angular) {
	function postageNetworkCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, postageNetworkService, $templateRequest,
			$uibModal) {
		
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '新建',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.openEditPostageNetworkWindow();
			}
		}])
		.withFixedColumns({
            leftColumns: 2,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : postageNetworkService.getpostageNetworkList
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 6;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column  .withOption('ellipsis',true)
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('postageName').withOption('width',columnWidth + 100).withOption('ellipsis',true).withTitle('资费计划名称'),
				DTColumnBuilder.newColumn('opName').withOption('width',70).withTitle('运营商名称'),
				DTColumnBuilder.newColumn('payMode').withOption('width',columnWidth).withTitle('计划类型').renderWith(setPayMode),
				DTColumnBuilder.newColumn('isSeparateBill').withOption('width',64).withTitle('分离计费').renderWith(setSeparateBill),
				DTColumnBuilder.newColumn('validDays').withOption('width',64).withTitle('期限时长').renderWith(setValidDays),
				DTColumnBuilder.newColumn('planFlow').withOption('width',64).withTitle('每月流量').renderWith(setPlanFlow),
				DTColumnBuilder.newColumn('networkAccess').withOption('width',64).withTitle('通信计划').renderWith(networkAccess),
				DTColumnBuilder.newColumn('option').withOption('width',56).withTitle('操作').renderWith(operate),
				DTColumnBuilder.newColumn('createTime').withOption('width',columnWidth).withTitle('新建时间'),
				DTColumnBuilder.newColumn('updateTime').withOption('width',columnWidth).withTitle('更新时间'),
				];
		
		function setPayMode(e, dt, node, config){
			if(node.payMode==0){
				return "预付-灵活共享池";
			}else if(node.payMode==1){
				return "后付－灵活共享";
			}else{
				return "--";
			}
		};
		
		function setSeparateBill(e, dt, node, config){
			if(node.isSeparateBill==0){
				return "不支持";
			}else if(node.isSeparateBill==1){
				return "支持";
			}else{
				return "--";
			}
		}
		
		function setValidDays(e, dt, node, config){
			return node.validDays+"天";
		}
		
		function setPlanFlow(e, dt, node, config){
			return node.planFlow+""+node.flowUnit+" /月";
		}
		
		//通信计划
		function networkAccess(e, dt, node, config){
			
			return '<a href="javascript:;" ng-click="openNetworkAccessDetailWindow(\''+ node.postageId + '\');">详情</a>';
		}
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
				operateHtml	= '<a href="javascript:;" ng-click="openEditPostageNetworkWindow(\''+ node.postageId + '\');">编辑</a>';
			return operateHtml;
		}
		
		//打开详情窗口
		$scope.openNetworkAccessDetailWindow=function(postageId){		 
			var modalInstance=$uibModal.open({
				templateUrl : 'biz/card/postagenetwork/view/detail.html',
				controller : 'NetworkDetailCtrl',
				size : 'lg',
				resolve : {
					param : function(){
						return  {
							postageId:postageId
						};
					}
				}
			});
			
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				$scope.dtInstance.query({});
			});
		}
		
		// 打开编辑窗口
		$scope.openEditPostageNetworkWindow = function(id) {
			
			postageNetworkService.getPostageDetail({postageId : id},function(data){
				var modalInstance = $uibModal.open({
					templateUrl : 'biz/card/postagenetwork/view/edit.html',
					controller : 'editPostageNetworkCtrl',
					size : 'lg',
					resolve : {
						param : function() {
							return data || {}
						}
					}
				});
				
				// 提交之后重新查询列表
				modalInstance.result.then(function(data) {
					if (data) {
						$scope.dtInstance.query({});
					}
				});
			})
			
		
		};
	
	}
	
	function NetworkDetailCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,$uibModalInstance,
			 $rootScope,  postageNetworkService,param,
			$uibModal){
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withOption('paging', false) // 禁用翻页
		.withOption('lengthChange', false) // 禁用动态显示行数
		.withOption('ordering', false) // 禁用排序 
		.withOption('info',false)
		.withButtons([]);
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : function(value){
					angular.extend(value,{postageId :param.postageId});
					return postageNetworkService.getNetworkList(value);
				}
		};
		

		// 定义表头Column  .withOption('ellipsis',true)
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('accessCode').withOption('width',70).withTitle('通信计划ID'),
				DTColumnBuilder.newColumn('enName').withOption('width',120).withOption('ellipsis',true).withTitle('通信计划名称'),
				DTColumnBuilder.newColumn('itemData').withOption('width',28).withTitle('数据').renderWith(setItemData),
				DTColumnBuilder.newColumn('itemVoiceCalled').withOption('width',56).withTitle('语音被叫').renderWith(setItemVoiceCalled),
				DTColumnBuilder.newColumn('itemMsg').withOption('width',28).withTitle('短信').renderWith(setItemMsg),
				DTColumnBuilder.newColumn('itemFourG').withOption('width',28).withTitle('4G').renderWith(setItemFourG),
				DTColumnBuilder.newColumn('itemBlack').withOption('width',51).withTitle('黑名单').renderWith(setItemBlack),
				DTColumnBuilder.newColumn('itemWhite').withOption('width',51).withTitle('白名单').renderWith(setItemWhite),
				DTColumnBuilder.newColumn('itemApn').withOption('width',90).withOption('ellipsis',true).withTitle('APN'),
				];
		//Y   N
		function setItemData(e, dt, node, config){
			 if(node.itemData==1){
				return "Y";
			 }else if(node.itemData=2){
				 return "N";
			 }else{
				 return "--";
			 }
		}

		function setItemVoiceCalled(e, dt, node, config){
			 if(node.itemVoiceCalled==1){
				return "Y";
			 }else if(node.itemVoiceCalled=2){
				 return "N";
			 }else{
				 return "--";
			 }
		}

		function setItemMsg(e, dt, node, config){
			 if(node.itemMsg==1){
				return "Y";
			 }else if(node.itemMsg=2){
				 return "N";
			 }else{
				 return "--";
			 }
		}

		function setItemFourG(e, dt, node, config){
			 if(node.itemFourG==1){
				return "Y";
			 }else if(node.itemFourG=2){
				 return "N";
			 }else{
				 return "--";
			 }
		}

		function setItemBlack(e, dt, node, config){
			 if(node.itemBlack==1){
				return "Y";
			 }else if(node.itemBlack=2){
				 return "N";
			 }else{
				 return "--";
			 }
		}
		
		function setItemWhite(e, dt, node, config){
			 if(node.itemWhite==1){
				return "Y";
			 }else if(node.itemWhite=2){
				 return "N";
			 }else{
				 return "--";
			 }
		}

		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}

	angular.module('card')
	.controller('postageNetworkCtrl', postageNetworkCtrl)
	.controller('NetworkDetailCtrl', NetworkDetailCtrl);
	
})(angular);

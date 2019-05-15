(function(angular) {
	function editPostageNetworkCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,$uibModalInstance,
			 $rootScope,  postageNetworkService,param,
				$uibModal) {

		//得到postageId 来查询通讯计划ID
		var postageId=param.postagenetwork.postageId;
		$scope.postageNetwork=param.postagenetwork;
		var postageName=param.postagenetwork.postageName;
		
		$scope.payModelist=[{
			number : 0,
			text : "预付－灵活共享"
		},{
			number : 1,
			text : "后付－灵活共享"
		}];
		
		$scope.isSeparateBilllist=[{
			number : 0,
			text : "不支持"
		},{
			number : 1,
			text : "支持"
		}];
		
		//判断是编辑还是新增
		$scope.isEdit= postageId!=null;
		
		//判断资费名称是否存在
		$scope.asyncCallback=function(value){
			var obj = {};
			//编辑时与原数据不一样才会判断
			if(param.postagenetwork && postageName!=value){
				obj.postageName=value;
				result=postageNetworkService.existsByPostName(obj);
			}else{
				result = {result: true};
			}
			return result;
		}
		
		
		//编辑时给下拉框赋值
		if($scope.postageNetwork){
			//计划类型
			var payMode=$scope.postageNetwork.payMode;
			$scope.postageNetwork.payMode=$scope.payModelist[payMode];
			
			//支持分离计划
			var isSeparateBill=$scope.postageNetwork.isSeparateBill;
			$scope.postageNetwork.isSeparateBill=$scope.isSeparateBilllist[isSeparateBill];
		}
		
		//通讯计划列表
		//设置表格
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withOption('paging', false) // 禁用翻页
		.withOption('lengthChange', false) // 禁用动态显示行数
		.withOption('ordering', false) // 禁用排序 
		.withOption('info',false)
		.withButtons([]);
		
		//保存操作后的通信计划集合...................................
		var networkList;
		
		// 定义DataTables选项
		$scope.dtInstance = {
			serverData : function(value){
				angular.extend(value,{postageId :postageId});
				
				return postageNetworkService.getNetworkList(value).$promise.then(function(response) {
					//第一次将后台数据传给networkList 之后将networkList传给response.data
        			networkList = networkList || response.data;
        			response.data = networkList;
        			
                    return response;
                });
			}
		};
		/*$scope.dtInstance = {
				serverData : function(value){
					angular.extend(value,{postageId :postageId});
					return postageNetworkService.getNetworkList(value);
				}
		};*/
		
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
				DTColumnBuilder.newColumn('option').withOption('width',28).withTitle('操作').renderWith(delNetwork),
				];
			function delNetwork(e, dt, node, config){
			return '<a href="javascript:;" ng-click="delNetwork(item)">删除</a>';
		};
	
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
		
		
		 //删除通讯计划
		 $scope.delNetwork=function(item){
			 swal({
				 title: "",  
			        text: "确定要删除这条数据？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top"  
			 },function(){
				 swal({
					  title: "",
					  text: "已成功删除数据!",
					  timer: 1500,
					  type: "success",
					  showConfirmButton: false
					});
				//删除后从集合中移除该条数据。。。。。。。。。。。。
				 //var index=networkList.indexOf(item);
				 for(var i=0;i<networkList.length;i++){
					 if(item.accessId==networkList[i].accessId){
						 networkList.splice(i, 1);
					 }
				 }
				 //更新
				 $scope.dtInstance.query();
				 
			 });
		 };
		
		//打开添加通讯计划窗口
		$scope.openAddNetworkWindow=function(item){
			
			var postageId=param.postagenetwork.postageId;
			var modalInstance = $uibModal.open({
				templateUrl : 'biz/card/postagenetwork/view/addNetwork.html',
				controller : 'addNetworkCtrl',
				//size : 'mdx',
				resolve : {
					param : function() {
						return  {
							postageId : postageId,
							networkList :networkList
						};
					}
				}
			});
			// 提交之后重新查询列表
			modalInstance.result.then(function(data) {
				//新增一条数据后存入集合中。。。。。。。。。。。。。。。。
				networkList.push(data);
				$scope.dtInstance.query();
			});
		}
		
		// 提交整个表单
		$scope.submitPostagenetwork = function(){
			if ($scope.postageFrm.$valid) {
				//实现逻辑
				var postageNetwork=angular.extend({},$scope.postageNetwork);
				
				if($scope.postageNetwork.payMode)
					postageNetwork.payMode=$scope.postageNetwork.payMode.number;
				else
					postageNetwork.payMode=0;
				if($scope.postageNetwork.isSeparateBill)
					postageNetwork.isSeparateBill=$scope.postageNetwork.isSeparateBill.number;
				else
					postageNetwork.isSeparateBill=0;
				
				postageNetwork.flowUnit='M';
				//传多个值到后台
				var postageNetworkList={
						postagenetwork:postageNetwork,
						networkAccessList:networkList
				}
				//确定要提交
				swal({
					title: "",  
			        text: "确定要提交这条数据？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top"  
				},function() { 
					//提交
					postageNetworkService.updatePostage(postageNetworkList, function(data) {
						if (data.returnCode == 0) {
							swal({
							  title: "",
							  text: "已成功提交数据!",
							  timer: 1500,
							  type: "success",
							  showConfirmButton: false
							}); 
							
							//关闭弹框
							$uibModalInstance.close(data);
						} else {
							swal({
							  title: "",
							  text: "提交数据失败!",
							  timer: 1500,
							  type: "error",
							  showConfirmButton: false
							});
						}
					});
				}); 
				
			}else{
				$scope.postageFrm.submitted=true;
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	
	function addNetworkCtrl($scope,param,postageNetworkService,$uibModalInstance){
		//资费计划id
		var postageId=param.postageId;
		var networkList=param.networkList;
		
		//给下拉框设值
		$scope.YNlist=[{
			number : 1,
			text : "Y"
		},{
			number : 2,
			text : "N"
		}];
		
		//判断通信id是否存在
		$scope.asyncCallback=function(value){
			var obj={};
			//在networkList列表中是否已存在
			if(networkList!=null && networkList.length>0){
				for(var i=0;i<networkList.length;i++){
					if(networkList[i].accessCode==value)
						return true;
				}
			}
			obj.accessCode=value;
			return postageNetworkService.existsByCodeName(obj);
		}
		  
		$scope.asyncEnName=function(value){
			var obj={};
			//判断是不是跟已在列表中的重名
			if(networkList!=null && networkList.length>0){
				for(var i=0;i<networkList.length;i++){
					if(networkList[i].enName==value)
						return true;
				}
			}
			obj.enName=value;
			return postageNetworkService.existsByCodeName(obj);
		}
		
		//添加
		$scope.submitAddnetwork=function(){
			if ($scope.frm.$valid){
				
				var obj={
						postageId:postageId,
				}
				$scope.addNetwork.accessCode && (obj.accessCode=$scope.addNetwork.accessCode);
				$scope.addNetwork.enName && (obj.enName=$scope.addNetwork.enName);
				$scope.addNetwork.itemApn && (obj.itemApn=$scope.addNetwork.itemApn);
				
				if($scope.addNetwork.itemData)
					obj.itemData=$scope.addNetwork.itemData.number;
				else
					obj.itemData=1;
				
				if($scope.addNetwork.itemVoiceCalled)
					obj.itemVoiceCalled=$scope.addNetwork.itemVoiceCalled.number;
				else
					obj.itemVoiceCalled=1;
				
				if($scope.addNetwork.itemMsg)
					obj.itemMsg=$scope.addNetwork.itemMsg.number;
				else
					obj.itemMsg=1;
				
				if($scope.addNetwork.itemFourG)
					obj.itemFourG=$scope.addNetwork.itemFourG.number;
				else
					obj.itemFourG=1;
				
				if($scope.addNetwork.itemBlack)
					obj.itemBlack=$scope.addNetwork.itemBlack.number;
				else
					obj.itemBlack=1;
				
				if($scope.addNetwork.itemWhite)
					obj.itemWhite=$scope.addNetwork.itemWhite.number;
				else
					obj.itemWhite=1;
				
				//确定要提交
				swal({
					title: "",  
			        text: "确定要提交这条数据？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top"  
				},function() { 
					//提交
					swal({
						  title: "",
						  text: "已成功提交数据!",
						  timer: 1500,
						  type: "success",
						  showConfirmButton: false
						});
					//关闭弹框
					$uibModalInstance.close(obj);
				});
			}else{
				//验证
				$scope.frm.submitted = true;
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	
	angular.module('card')
	.controller('editPostageNetworkCtrl', editPostageNetworkCtrl)
	.controller('addNetworkCtrl', addNetworkCtrl);
})(angular);
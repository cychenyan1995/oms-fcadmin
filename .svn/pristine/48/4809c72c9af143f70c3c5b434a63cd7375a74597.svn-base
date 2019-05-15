(function(angular) {
	function createSpCtrl($scope, spService, $uibModalInstance) {
		$scope.sp={};
		
		$scope.levelList=[
		                  {number:1,text:"一级"},
		                  {number:2,text:"二级"},
		                  {number:3,text:"三级"},
		                  {number:4,text:"四级"}]
		//初始化
		$scope.sp.level={number:1,text:"一级"};
		
		$scope.changeSpName=function(){
			$scope.spNameExisted=false;
		}
		
		//级别更改时
		$scope.changeLevel=function(){
			$scope.spNameExisted=false;
			//$scope.message=false;
			//附初值   改变级别时  将上次选择的置为空
			$scope.sp.parentSpCode="";
			var level=$scope.sp.level.number;
			var serviceList = [];
			
			var spName=$scope.sp.spName;
			//二级   显示一级父目录
			if(level==1){
				//为一级是  隶属目录下拉框不能用
				$scope.spNameByLevel=false;
			}else if(level==2 || level==3 || level==4){
				var parentLevel=level-1;
				$scope.spNameByLevel=true;
				spService.getSpNameByLevel({parentLevel : parentLevel},function(data){
					if(data.returnCode==0){
						var spNameList=data.data;
						if(spNameList!=null && spNameList.length>0){
							for(var i=0;i<spNameList.length;i++){
								serviceList.push({
									number : spNameList[i].spId,
									text : spNameList[i].spCode+"/"+spNameList[i].spName
								})
							}
						}
						$scope.serviceList=serviceList;
					}
				});
			}
		}
		
		//给省 的下拉框赋值
		spService.getProvinceList(function(data){
			var list=data.provinceList;
			var provinceList=[];
			for(var i=0;i<list.length;i++){
				if(list[i].province != "未知区域"){
					provinceList.push({
						number : list[i].pid,
						text : list[i].province
					})
				}
			}
			$scope.provinceList=provinceList;
		})
		
		//选择省  得到相应的市
		$scope.changeProvince=function(){
			$scope.sp.city="";
			if($scope.sp.province){
				var provinceId=$scope.sp.province.number;
				spService.getCityList({provinceId:provinceId},function(data){
					var cityList=[];
					var cList=data.cityList;
					for(var i=0;i<cList.length;i++){
						cityList.push({
							number : cList[i].cid,
							text : cList[i].city
						})
					}
					$scope.cityList=cityList;
				})
			}
			
		}
	
		// 提交表单
		$scope.submitSp = function(){
			//判断商户名是否已经存在
			if($scope.sp.level!=null){
				var sp={};
				sp.spName=$scope.sp.spName;
				sp.level=$scope.sp.level.number;
				spService.existBySpName(sp,function(data){
					var result = data.data;
					if(!result)
						$scope.spNameExisted=true;      //商户名已经存在
					else{
						if ($scope.spFrm.$valid) {		//提交表单
							var obj={
									parentId : ""
							}
							obj = angular.extend({},$scope.sp);
							$scope.sp.level && (obj.level=$scope.sp.level.number);
							
							if($scope.sp.province && $scope.sp.city && $scope.sp.otherAddr){	//直辖市不要省份
								if($scope.sp.province.text == '北京' || $scope.sp.province.text == '天津' || $scope.sp.province.text == '上海' || $scope.sp.province.text == '重庆'){
									obj.commAddr=$scope.sp.city.text+"市"+$scope.sp.otherAddr;
								}else if($scope.sp.province.text== '香港' || $scope.sp.province.text == '澳门' || $scope.sp.province.text == '台湾'){	//自治区
									obj.commAddr=$scope.sp.city.text+$scope.sp.otherAddr;
								}
								else{
									obj.commAddr=$scope.sp.province.text+"省"+$scope.sp.city.text+"市"+$scope.sp.otherAddr;
								}
							}
							obj.city="";
							obj.province="";
							
							if($scope.sp.parentSpCode){
								obj.parentId=$scope.sp.parentSpCode.number;
							}
							obj.parentSpCode="";
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
								spService.saveSp(obj, function(data) {
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
							$scope.spFrm.submitted=true;
						}
					}
				});
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('sp').controller('createSpCtrl', createSpCtrl);
})(angular);
(function(angular) {
	function editSpCtrl($scope,param,spService, $uibModalInstance) {
		
		//param 为打开页面传递过来的参数对象
		$scope.sp=param.sp;
		var contactperson=param.sp.contactperson;
		var contactphone=param.sp.contactphone;
		var otherAddr=param.sp.otherAddr;
		var contactphonePattern="^1[3|4|5|8][0-9]\\d{8}$";
		
		//级别
		if($scope.sp.level==1){
			$scope.sp.level="一级";
		}else if($scope.sp.level==2){
			$scope.sp.level="二级";
		}else if($scope.sp.level==3){
			$scope.sp.level="三级";
		}else if($scope.sp.level==4){
			$scope.sp.level="四级";
		}else{
			$scope.sp.level="--";
		}
		
		//给省 的下拉框赋值
		spService.getProvinceList(function(data){
			var list=data.provinceList;
			var provinceList=[];
			if(list!=null && list.length>0){
				for(var i=0;i<list.length;i++){
					provinceList.push({
						number : list[i].pid,
						text : list[i].province
					});
					//给编辑的省下拉框赋值
					if($scope.sp.province==list[i].province){
						$scope.sp.province=provinceList[i];
						//给编辑的市下拉框赋值
						spService.getCityList({provinceId:$scope.sp.province.number},function(data){
							var cityList=[];
							var cList=data.cityList;
							for(var i=0;i<cList.length;i++){
								cityList.push({
									number : cList[i].cid,
									text : cList[i].city
								});
								if($scope.sp.city==cList[i].city){
									$scope.sp.city=cityList[i];
								}
							}
							$scope.cityList=cityList;
						})
					}
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
						});
					}
					$scope.cityList=cityList;
				})
			}
			
		}
		
		$scope.clickContactperson=function(){
			if($scope.sp.contactperson==contactperson){
				$scope.sp.contactperson="";
			}
		}
		$scope.clickContactphone=function(){
			if($scope.sp.contactphone==contactphone){
				$scope.sp.contactphone="";
			}
		}
		$scope.changeOtherAddr=function(){
			if($scope.sp.otherAddr==otherAddr){
				$scope.sp.otherAddr="";
			}
		}
		
		//失去焦点
		$scope.blurContactperson=function(){
			if($scope.sp.contactperson=='' || $scope.sp.contactperson==undefined){
				$scope.sp.contactperson=contactperson;
			}
		}
		$scope.blurContactphone=function(){
			//先不检验电话号码
			$scope.contactphonePattern='';
			if($scope.sp.contactphone=='' || $scope.sp.contactphone==undefined){
				$scope.sp.contactphone=contactphone;
			}else{
				//检验电话号码
				$scope.contactphonePattern=contactphonePattern;
			}
		}
		
		$scope.blurOtherAddr=function(){
			if($scope.sp.otherAddr=='' || $scope.sp.otherAddr==undefined){
				$scope.sp.otherAddr=otherAddr;
			}
		}
		// 提交表单
		$scope.submitSp = function(){
			if ($scope.spFrm.$valid) {
				//实现逻辑
				var obj=angular.extend({},$scope.sp);
				if($scope.sp.province && $scope.sp.city && $scope.sp.otherAddr){	//直辖市不要省份
					if($scope.sp.province.text == '北京' || $scope.sp.province.text == '天津' || $scope.sp.province.text == '上海' || $scope.sp.province.text == '重庆'){
						obj.commAddr=$scope.sp.city.text+"市"+$scope.sp.otherAddr;
					}else if($scope.sp.province.text== '香港' || $scope.sp.province.text == '澳门' || $scope.sp.province.text == '台湾'){	//自治区
						obj.commAddr=$scope.sp.city.text+$scope.sp.otherAddr;
					}else{
						obj.commAddr=$scope.sp.province.text+"省"+$scope.sp.city.text+"市"+$scope.sp.otherAddr;
					}
				}
				obj.level="";
				obj.city="";
				obj.province="";
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
					spService.updateSp(obj, function(data) {
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
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('sp').controller('editSpCtrl', editSpCtrl);
})(angular);
(function(angular) {
	function createFlowPackageCtrl($scope, pkgService, spService, opService, $uibModalInstance) {
		
		$scope.flowPackage = {};
		
		$scope.monthFlowHide = true;
		$scope.overFlowAccessIdHide = true;
		
		$scope.totalFlowRequired = true;
		$scope.perCycleFlowRequired = false;
		$scope.chargeCycleRequired = false;
		$scope.flowservPayDateRequired = false;
		$scope.overFlowAccessIdRequired = false;
		
		$scope.flowPackage.isSeparateBill = 0;
		$scope.flowPackage.flowservType = 0;
		$scope.flowPackage.isUnlimitFlow = 0;
		$scope.flowPackage.isMonthClean = 0;
		$scope.flowPackage.isNowApply = 1;
		
		$scope.showMonthFlow = true;
		
		// 提交表单
		$scope.submitFlowPackage = function(){
			
			if ($scope.create_from.$valid) {
				var obj = {};
				//实现逻辑
				
				var fPackage = angular.extend({},$scope.flowPackage);
				
				$scope.flowPackage.spId && (fPackage.spId = $scope.flowPackage.spId.number);
				$scope.flowPackage.owned && (fPackage.owned = $scope.flowPackage.owned.number);
				$scope.flowPackage.emptyPk && (fPackage.emptyPk = $scope.flowPackage.emptyPk.number);
				$scope.flowPackage.overFlowOp && (fPackage.overFlowOp = $scope.flowPackage.overFlowOp.number);
				
				if(fPackage.flowservType == 0){
					$scope.flowPackage.flowUnit && (fPackage.flowUnit = $scope.flowPackage.flowUnit.number);
				}else{
					$scope.flowPackage.monthFlowUnit && (fPackage.flowUnit = $scope.flowPackage.monthFlowUnit.number);
				}
				
				if(fPackage.flowUnit == 1){
					fPackage.flowUnit = "M";
				}else{
					fPackage.flowUnit = "G";
				}
				
				if(fPackage.emptyPk == 1){
					fPackage.overFlowOp = 1;
				}
				
				$scope.flowPackage.validCycleUnit && (fPackage.validCycleUnit = $scope.flowPackage.validCycleUnit.number);
				$scope.flowPackage.overFlowAccessId && (fPackage.overFlowAccessId = $scope.flowPackage.overFlowAccessId.number);
				
				//确定要提交
				swal({
					title: "",  
			        text: "确定要提交这条数据？",  
			        type: "warning", 
			        showCancelButton: true, 
			        closeOnConfirm: false, 
			        confirmButtonText: "确定", 
			        cancelButtonText:"取消",  
			        animation:"slide-from-top",  
			        showLoaderOnConfirm: true 
				},function() { 
					//提交
					pkgService.saveFlowPackage(fPackage, function(data) {
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
				$scope.create_from.submitted = true;
			}
		}
		
		spService.getSp(function(datas) {
			// 展示条件查询中的服务商选项
			var list= datas.data;
			var serviceList = [];
			/*serviceList.push({
				number : 1,
				text : '通用'
			});*/
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].spId,
					text : list[i].spCode +"/"+ list[i].spName
				});
			}
			$scope.serviceList = serviceList;
		});
		$scope.flowPackage.spId={number:1,text:"通用"};
		
		opService.getNetworkAccess(function(datas) {
			var list= datas.data;
			var serviceList = [];
			/*serviceList.push({
				number : null,
				text : '请选择通信计划'
			});*/
			for (var i = 0; i < list.length; i++) {
				serviceList.push({
					number : list[i].accessId,
					text : list[i].accessCode +"/"+ list[i].enName
				});
			}
			$scope.overFlowAccessIdList = serviceList;
		});
		/*$scope.flowPackage.overFlowAccessId={number:0,text:"请选择通信计划"};*/
		
		$scope.ownedList = [
		                      { number: 3, text: '联通'}, 
		                      { number: 1, text: '移动'}, 
		                      { number: 2, text: '电信'}];
		$scope.flowPackage.owned={number:3,text:"联通"};
		
		$scope.packageTypeList = [
			                      { number: 0, text: '开卡套餐'}, 
			                      { number: 1, text: '白卡套餐'}];
		
		$scope.overFlowOpList = [
			                  { number: 1, text: '停用'}, 
		                      { number: 0, text: '维持现状'}, 
		                      { number: 2, text: '变更通讯计划'}];
		$scope.flowPackage.overFlowOp={number:1,text:"停用"};
		
		$scope.flowUnitList = [
		                      { number: 1, text: 'M'}, 
		                      { number: 2, text: 'G'}];
		$scope.flowPackage.flowUnit={number:1,text:"M"};
		
		/*$scope.flowUnitList = [
			                      { number: 1, text: 'M'}, 
			                      { number: 2, text: 'G'}];
		$scope.flowPackage.flowUnit={number:1,text:"M"};1*/
		
		$scope.monthFlowUnitList = [
			                      { number: 1, text: 'M/月'}, 
			                      { number: 2, text: 'G/月'}];
		$scope.flowPackage.monthFlowUnit={number:1,text:"M/月"};
		
		$scope.validCycleUnitList = [
			                      { number: 0, text: '天'}, 
			                      { number: 1, text: '月'}];
		$scope.flowPackage.validCycleUnit={number:0,text:"天"};
		
		$scope.overFlowOp = function(value) {
			if(value == 0){
				return "维持现状"
			}else if(value == 1){
				return "停用"
			}else{
				return "变更通讯计划"
			}
			$uibModalInstance.dismiss('cancel');
		};
		
		$scope.changePackageType = function(item) {
			//如果套餐分类是开卡套餐 移动联通
			item = item || $scope.flowPackage.packageType;
			if(item.number == 0){
				$scope.monthFlowCategoryHide = false;
				$scope.unlimitFlowTypeHide = false;
				$scope.monthFlowHide = true;
				$scope.unlimitFlowHide = false;
				$scope.flowUseHide = false;
				$scope.priceHide = false;
				$scope.flowPackage.flowservType = 0;
				$scope.flowPackage.isUnlimitFlow = 0;
				$scope.flowPackage.packagePrice = "";
			}else{//套餐分类是白卡套餐套餐
				$scope.monthFlowCategoryHide = true;
				$scope.unlimitFlowTypeHide = true;
				$scope.monthFlowHide = true;
				$scope.unlimitFlowHide = true;
				$scope.flowUseHide = true;
				$scope.priceHide = true;
				$scope.overFlowAccessIdHide = true;
				$scope.totalFlowHide = false;
				$scope.unlimitFlowHide = false;
				$scope.flowPackage.flowservType = 0;
				$scope.flowPackage.isUnlimitFlow = 0;
				$scope.flowPackage.packagePrice = 0;
				$scope.flowPackage.overFlowOp = "";
			}
		};
		
		$scope.checkPackageName = function(value) {/*asyncCallback*/
			var obj={};
			obj.packageName = value;
			return pkgService.existsByName(obj);
		}
		
		$scope.flowservType = function(value) {
			if(value == 0){
				$scope.totalFlowHide = false;
				$scope.monthFlowHide = true;
				
				$scope.totalFlowRequired = true;
				
				$scope.perCycleFlowRequired = false;
				$scope.chargeCycleRequired = false;
				$scope.flowservPayDateRequired = false;
				
			}else{
				$scope.totalFlowHide = true;
				$scope.monthFlowHide = false;
				
				$scope.totalFlowRequired = false;
				
				$scope.perCycleFlowRequired = true;
				$scope.chargeCycleRequired = true;
				$scope.flowservPayDateRequired = true;

				$scope.flowPackage.validCycleUnit={number:1,text:"月"};
			}
			$scope.flowPackage.chargeCycle = null;
		};
		
		$scope.isUnlimitFlow = function(value) {
			if(value == 0){
				$scope.unlimitFlowHide = false;
				
				$scope.totalFlowRequired = true;
				
			}else{
				$scope.unlimitFlowHide = true;
				
				$scope.totalFlowRequired = false;
			}
			$scope.perCycleFlowRequired = false;
			$scope.chargeCycleRequired = false;
			$scope.flowservPayDateRequired = false;
		};
		
		$scope.changeOverFlowOp = function(item) {
			if(item.number == 2){
				$scope.overFlowAccessIdRequired = true;
				$scope.overFlowAccessIdHide = false;
			}else{
				$scope.overFlowAccessIdRequired = false;
				$scope.overFlowAccessIdHide = true;
			}
		};
		
		$scope.changeOverFlowAccessId = function(item) {
			if(item.number == null){
				$scope.overFlowAccessIdRequired = true;
			}else{
				$scope.overFlowAccessIdRequired = false;
			}
		};
		
		$scope.asyncCallback = function(value) {
			var obj={};
//			obj.flowpoolName = value;
//			return cardService.existsByName(obj);
			return false;
		}

		$scope.checkValidCycle = function(value) {
			var chargeCycle = parseInt($scope.flowPackage.chargeCycle);
			var validCycle = parseInt(value);//$scope.flowPackage.validCycle;
			var validCycleUnit = $scope.flowPackage.validCycleUnit.number;

			if(validCycleUnit == 0){
				validCycle = validCycle / 30;
				if(validCycle < chargeCycle){
					return {
						result: false
					};
				}
			}else{
				if(validCycle < chargeCycle){
					return {
						result: false
					};;
				}
			}
			return {
				result: true
			};;
		}
		
		//移动卡
		$scope.changeFlowPackage = function(value){
			//移动卡的月付流量不可选
			if(value.number == 1){
				//默认勾选总流量
				$scope.flowPackage.flowservType = 0;
				
				$scope.showMonthFlow = false;
				$scope.totalFlowHide = false;
				$scope.monthFlowHide = true;
				$scope.totalFlowRequired = true;
				$scope.perCycleFlowRequired = false;
				$scope.chargeCycleRequired = false;
				$scope.flowservPayDateRequired = false;
			}else{
				$scope.showMonthFlow = true;
			}
		}
		
		// 关闭弹窗
		$scope.cancel = function() {
			$uibModalInstance.dismiss('cancel');
		};
	}
	angular.module('pkg').controller('createFlowPackageCtrl', createFlowPackageCtrl);
})(angular);
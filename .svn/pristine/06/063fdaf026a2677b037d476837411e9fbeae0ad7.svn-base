(function(angular){
	
	function mobileOpenCardListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,mobileOpenCardService,spService,pkgService){
		//搜索关键字
		$scope.openCardQuery={
				keyWork:'',
				activeDaysSmall:'',
				activeDaysBig :'',
				activeRestDaysSmall:'',
				activeRestDaysBig :''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([{
			text : '导出',
			className: 'btn-outline btn-primary',
			action : function(e, dt, node, config) {
				$scope.exportOpenCardFile();
			}
		}])
		.withFixedColumns({
            leftColumns: 0,
            rightColumns: 0
        });
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : mobileOpenCardService.getOpenCardList
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 7;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column .renderWith(setMerchantName)
		$scope.dtColumns = [
		        DTColumnBuilder.newColumn('iccid').withOption('width',columnWidth + 36).withTitle('ICCID'),
		        DTColumnBuilder.newColumn('imsi').withOption('width',columnWidth + 36).withTitle('IMSI'),
		        DTColumnBuilder.newColumn('cardNo').withOption('width',columnWidth + 36).withTitle('网卡号'),
		        DTColumnBuilder.newColumn('spName').withOption('width',columnWidth + 66).withTitle('服务商名称').renderWith(setSpName),
		        DTColumnBuilder.newColumn('cardType').withOption('width',128).withTitle('卡类型').renderWith(setCardType),
		        DTColumnBuilder.newColumn('cardStatus').withOption('width',64).withTitle('卡状态').renderWith(setCardStatus),
		        DTColumnBuilder.newColumn('pkName').withOption('width',columnWidth + 66).withTitle('开卡套餐').renderWith(setPkName),
		        DTColumnBuilder.newColumn('packagePrice').withOption('width',64).withTitle('价格(元)'),
		        DTColumnBuilder.newColumn('autoactivePackageDays').withOption('width',128).withTitle('激活宽限期').renderWith(setActivePackageDays),
		        DTColumnBuilder.newColumn('activePackageRestDays').withOption('width',128).withTitle('激活宽限剩余天数').renderWith(setActivePackageRestDays)
				];
		
		function setSpName(e, dt, node, config){
			if(node.spCode!=null && node.spName!=null){
				return node.spCode+"/"+node.spName;
			}else{
				return "";
			}
		}
		
		function setCardType(e, dt, node, config){
			//1:工业贴片卡/2:工业大卡/3:双切卡
			if(node.cardType==1){
				return "工业贴片卡";
			}else if(node.cardType==2){
				return "工业大卡";
			}else if(node.cardType==3){
				return "双切卡";
			}
			return '--';
		}
		
		function setCardStatus(e, dt, node, config){
			if(node.cardStatus==0){
				return '<span style="color:orange;">测试期</span>'
			}else if(node.cardStatus==1){
				return '<span style="color:gray;">库存期</span>'
			}else if(node.cardStatus==2){
				return '<span style="color:orange;">沉默期</span>'
			}else if(node.cardStatus==4){
				return '<span style="color:green;">正使用</span>'
			}else if(node.cardStatus==5){
				return '<span style="color:red;">停机</span>'
			}else if(node.cardStatus==3){
				return '<span style="color:red;">预约销户</span>'
			}else if(node.cardStatus==6){
				return '<span style="color:red;">销户</span>'
			}
			return '--';
		}
		
		function setPkName(e, dt, node, config){
			if(node.packageCode!=null && node.packageName!=null){
				return node.packageCode+"/"+node.packageName;
			}else{
				return "";
			}
		}
		
		function setActivePackageDays(e, dt, node, config){
			if(node.autoactivePackageDays!=null){
				return node.autoactivePackageDays+"天";
			}else{
				return "";
			}
		}
		
		function setActivePackageRestDays(e, dt, node, config){
			if(node.activePackageRestDays!=null && node.activePackageRestDays>0){
				return node.activePackageRestDays+"天";
			}else if(node.activePackageRestDays!=null && node.activePackageRestDays<=0){
				return "0天";
			}else{
				return "";
			}
		}
		
		//简单搜索
		$scope.openCardSearchForm=function(){
			//查询
			//清空高级搜索内容
			$scope.resetForm();
			$scope.dtInstance.query($scope.openCardQuery);
		}
		
		//卡类型
		$scope.cardTypeList=[
		                     {number:'',text:"全部"},
		                     {number:1,text:"工业贴片卡"},
		                     {number:2,text:"工业大卡"},
		                     {number:3,text:"双切卡"}]
		
		//卡状态
		$scope.cardStatusList=[
			                   { number: null, text: '全部'}, 
					           { number: 0, text: '测试期'}, 
					           { number: 2, text: '沉默期'}, 
					           { number: 1, text: '库存期'}, 
					           { number: 4, text: '正使用'}, 
					           { number: 5, text: '停机'},
					           { number: 3, text: '预约销户'},
					           { number: 6, text: '销户'}];
		
		$scope.activeDaysEqualList=[
		                            {number:0,text:"介于之间"},
		                            {number:1,text:"大于等于"},
		                            {number:2,text:"小于等于"}]
		
		$scope.activeRestDaysEqualList=[
		                            {number:0,text:"介于之间"},
		                            {number:1,text:"大于等于"},
		                            {number:2,text:"小于等于"}]
		
		//默认是介于之间
		$scope.Between=true;
		$scope.NotBetween=false;
		$scope.RestBetween=true;
		$scope.RestNotBetween=false;
		
		$scope.changeEquals=function(){
			var activeDaysEqual=$scope.openCardQuery.activeDaysEqual.number;
			if(activeDaysEqual==0){
				//介于之间
				$scope.Between=true;
				$scope.NotBetween=false;
			}else{
				//大于等于  小于等于
				$scope.Between=false;
				$scope.NotBetween=true;
			}
			
		}
		$scope.changeRestEquals=function(){
			var activeRestDaysEqual=$scope.openCardQuery.activeRestDaysEqual.number;
			if(activeRestDaysEqual==0){
				//介于之间
				$scope.RestBetween=true;
				$scope.RestNotBetween=false;
			}else{
				//大于等于  小于等于
				$scope.RestBetween=false;
				$scope.RestNotBetween=true;
			}
			
		}
		//服务商名称
		spService.getSp(function(data){
			var list=data.data;
			var spNameList=[];
			spNameList.push({
				number:null,
				text:"全部"
			})
			
			for(var i=0;i<list.length;i++){
				spNameList.push({
					number : list[i].spCode,
					text : list[i].spCode+"/"+list[i].spName
				})
			}
			$scope.spNameList=spNameList;
		})
		
		//开卡套餐
		pkgService.getFlowPackageAll(function(datas) {
			var list= datas.data;
			var pkgServiceList = [];
			pkgServiceList.push({
				packageCode : null,
				text : '全部'
			});
			for (var i = 0; i < list.length; i++) {
				pkgServiceList.push({
					packageCode : list[i].packageCode,
					text : list[i].packageCode+"/"+list[i].packageName
				});
			}
			$scope.pkNameList = pkgServiceList;
		});
		
		//高级搜索
		$scope.openCardHighSearchForm=function(){
			var openCardQuery=angular.extend({},$scope.openCardQuery);
			
			$scope.openCardQuery.spName && (openCardQuery.spName=$scope.openCardQuery.spName.number)
			$scope.openCardQuery.packageName && (openCardQuery.packageName=$scope.openCardQuery.packageName.packageCode)
			$scope.openCardQuery.cardType && (openCardQuery.cardType=$scope.openCardQuery.cardType.number)
			$scope.openCardQuery.cardStatus && (openCardQuery.cardStatus=$scope.openCardQuery.cardStatus.number)
			//激活宽限天数
			if( $scope.openCardQuery.activeDaysEqual !=null && $scope.openCardQuery.activeDaysEqual.number==1){
				//大于等于
				openCardQuery.activeDaysBig=$scope.openCardQuery.autoactivePackageDays;
				openCardQuery.autoactivePackageDays='';
			}else if($scope.openCardQuery.activeDaysEqual !=null && $scope.openCardQuery.activeDaysEqual.number==2){
				//小于等于
				openCardQuery.activeDaysSmall=$scope.openCardQuery.autoactivePackageDays;
				openCardQuery.autoactivePackageDays='';
			}
			
			//激活宽限剩余天数
			if($scope.openCardQuery.activeRestDaysEqual !=null && $scope.openCardQuery.activeRestDaysEqual.number==1){
				//大于等于
				openCardQuery.activeRestDaysBig=$scope.openCardQuery.activePackageRestDays;
				openCardQuery.activePackageRestDays='';
			}else if($scope.openCardQuery.activeRestDaysEqual !=null && $scope.openCardQuery.activeRestDaysEqual.number==2){
				//小于等于
				openCardQuery.activeRestDaysSmall=$scope.openCardQuery.activePackageRestDays;
				openCardQuery.activePackageRestDays='';
			}
			
			//查询
			$scope.dtInstance.query(openCardQuery);
			$scope.advanceExpand=true;
			//关闭高级搜索框
			$scope.advanceExpandShow = !$scope.advanceExpandShow;
		}
		
		//高级搜索层控制
		$scope.toggleClose=function(){
			$scope.advanceExpand = false;
			$scope.advanceExpands = false;
			$scope.advanceExpandShow = false;
			$scope.openCardQuery.keyWork= $scope.advanceExpand ? "已启用高级搜索" : "";
			//清空高级搜索
			$scope.resetForm();
			//重新查询
			$scope.dtInstance.query();
		}
		
		$scope.toggleAdvance=function(){
			$scope.advanceExpand=true;
			$scope.advanceExpands=true;
			$scope.advanceExpandShow = true;
			$scope.openCardQuery.keyWork= $scope.advanceExpand ? "已启用高级搜索" : "";
		}
		
		//将高级搜索的内容清空
		$scope.resetForm=function(){
			var openCardQuery=$scope.openCardQuery;
			openCardQuery.ICCID=null;
			openCardQuery.IMSI=null;
			openCardQuery.cardNo=null;
			openCardQuery.spName=null;
			openCardQuery.packageName=null;
			openCardQuery.cardType=null;
			openCardQuery.cardStatus=null;
			openCardQuery.activeDaysEqual=null;
			openCardQuery.autoactivePackageDays=null;
			openCardQuery.activeRestDaysEqual=null;
			openCardQuery.activePackageRestDays=null;
			openCardQuery.activeDaysBetweenSmall=null;
			openCardQuery.activeDaysBetweenBig =null;
			openCardQuery.autoactivePackageDays=null;
			openCardQuery.activeRestDaysBetweenSmall=null;
			openCardQuery.activeRestDaysBetweenBig=null;
			openCardQuery.activePackageRestDays=null;
			//默认是介于之间
			$scope.Between=true;
			$scope.NotBetween=false;
			$scope.RestBetween=true;
			$scope.RestNotBetween=false;
			//.....................................
		}
		
		//导出列表
		$scope.exportOpenCardFile=function(){
			var openCardQuery=angular.extend({},$scope.openCardQuery);
			
			$scope.openCardQuery.spName && (openCardQuery.spName=$scope.openCardQuery.spName.number)
			$scope.openCardQuery.packageName && (openCardQuery.packageName=$scope.openCardQuery.packageName.packageCode)
			$scope.openCardQuery.cardType && (openCardQuery.cardType=$scope.openCardQuery.cardType.number)
			$scope.openCardQuery.cardStatus && (openCardQuery.cardStatus=$scope.openCardQuery.cardStatus.number)
			
			//激活宽限天数
			if( $scope.openCardQuery.activeDaysEqual !=null && $scope.openCardQuery.activeDaysEqual.number==1){
				//大于等于
				openCardQuery.activeDaysBig=$scope.openCardQuery.autoactivePackageDays;
				openCardQuery.autoactivePackageDays='';
			}else if($scope.openCardQuery.activeDaysEqual !=null && $scope.openCardQuery.activeDaysEqual.number==2){
				//小于等于
				openCardQuery.activeDaysSmall=$scope.openCardQuery.autoactivePackageDays;
				openCardQuery.autoactivePackageDays='';
			}
			
			//激活宽限剩余天数
			if($scope.openCardQuery.activeRestDaysEqual !=null && $scope.openCardQuery.activeRestDaysEqual.number==1){
				//大于等于
				openCardQuery.activeRestDaysBig=$scope.openCardQuery.activePackageRestDays;
				openCardQuery.activePackageRestDays='';
			}else if($scope.openCardQuery.activeRestDaysEqual !=null && $scope.openCardQuery.activeRestDaysEqual.number==2){
				//小于等于
				openCardQuery.activeRestDaysSmall=$scope.openCardQuery.activePackageRestDays;
				openCardQuery.activePackageRestDays='';
			}
			
			mobileOpenCardService.exportOpenCardFile(openCardQuery,function(data){
				if(data.returnCode==0){
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
		}
	}
	
	angular.module('mobileCard')
	.controller('mobileOpenCardListCtrl', mobileOpenCardListCtrl)
})(angular);
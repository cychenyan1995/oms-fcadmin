(function(angular) {
	function taskListCtrl($scope, $http, DTOptionsBuilder, DTColumnBuilder,
			$state, $rootScope, $compile, downloadService, $templateRequest,
			$uibModal,$interval) {
		swal.close();
	
		
		// 搜索关键字
		$scope.taskQuery = {
				keyWork:''
		};
		
		// 定义DataTables选项
		$scope.dtOptions = DTOptionsBuilder.newOptions()
		.withButtons([])
		.withFixedColumns({
            leftColumns: 2,
            rightColumns: 0
        }).withOption("num",true);
		
		// 定义DataTables选项
		$scope.dtInstance = {
				serverData : downloadService.getTaskAll
		};
		
		// 定义DataTables选项
		$scope.dtSelect = {
				
		};
		
		var screenWidth = $(window).width() - 512;
		var percent = 4;
		var columnWidth = screenWidth/percent;
		
		// 定义表头Column
		$scope.dtColumns = [
				DTColumnBuilder.newColumn('option').withOption('width',64).withTitle('操作').renderWith(operate),
				DTColumnBuilder.newColumn('taskName').withOption('ellipsis',true).withTitle('下载名称'),
				DTColumnBuilder.newColumn('taskType').withOption('width',columnWidth).withTitle('下载类型').renderWith(downloadType),
				DTColumnBuilder.newColumn('isDownload').withOption('width',64).withTitle('下载状态').renderWith(downloadStatus),
				DTColumnBuilder.newColumn('taskCreatetimeFormat').withOption('width',columnWidth).withOption('ellipsis',true).withTitle('创建时间'),
				];
		
		//操作
		function operate(e, dt, node, config) {
			var operateHtml = '';
			//if(node.status == 1){
			operateHtml = '<a href="javascript:;" ng-click="delFile(\''+ node.taskId + '\')">删除</a> /';
			operateHtml += '<a href="javascript:;" ng-click="downloadFile(\''+ node.taskId + '\')">下载</a>';
			//}
			return operateHtml;
		};
		
		function downloadType(e, dt, node, config) {
			var html = '';
			if(node.taskType == 0){
				html = '订单数据导出';
			}else if(node.taskType == 1){
				html = '联通卡数据导出';
			}else if(node.taskType == 2){
				html = '购卡订单数据导出';
			}else if(node.taskType == 4){
				html = '联通库存卡数据导出';
			}else if(node.taskType == 5){
				html = '续费订单导出';
			}else if(node.taskType == 6){
				html = '联通待开卡列表导出';
			}else if(node.taskType == 7){
				html = '移动待开卡列表导出';
			}else if(node.taskType == 8){
				html='移动卡数据导出';
			}else if(node.taskType == 9){
				html = '移动库存卡数据导出';
			}
			return html;
		};
		
		function downloadStatus(e, dt, node, config) {
			var html = '';
			if(node.isDownload == 0){
				html = '<span download_id="'+ node.taskId + '" style="color: green;">未下载</span>';
			}
			if(node.isDownload == 1){
				html = '<span download_id="'+ node.taskId + '">已下载</span>';
			}
			return html;
		};
		
		// 搜索按钮
		$scope.taskSearchForm = function() {
			$scope.dtInstance.query($scope.taskQuery);
		};
		
		// 删除记录
		$scope.delFile = function(id){
			swal({
				title: "",  
		        text: "确定要删除这条数据？",  
		        type: "warning", 
		        showCancelButton: true, 
		        closeOnConfirm: false, 
		        confirmButtonText: "确定", 
		        cancelButtonText:"取消",  
		        animation:"slide-from-top",
		        showLoaderOnConfirm: true 
			},function() { 
				downloadService.delTask({
					id : id
				}, function(data) {
					if (data.returnCode == 0) {
						swal({
						  title: "",
						  text: "已成功删除数据!",
						  timer: 1500,
						  type: "success",
						  showConfirmButton: false
						});
						
						if('未下载'==$('span[download_id='+id+']').text()){
							var msgCount = $('.count-info').find("span").text();
							$('.count-info').find("span").text(msgCount-1);
						}
						
						
						// 删除之后重新查询列表
						$scope.dtInstance.query({});
					} else {
						swal({
						  title: "",
						  text: "删除操作失败!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
						});
					}
				});
			});
		};
		
		// 下载
		$scope.downloadFile = function(id){
			downloadService.exportTaskFile({
				taskId : id
			}, function(data) {
				if (data.returnCode == 0) {
					$("body").after('<a id="download"></a>');
					$("#download").attr('href',data.data.fileDownloadUrl);
					$("#download").attr('target','_blank');
					
					//$("#download").click()无效,只能使用document.getElementById('download')
					//$("#download").click();
					var download = document.getElementById('download');
					download.click();
					$("#download").remove();
					
					if('未下载'==$('span[download_id='+id+']').text()){
						var msgCount = $('.count-info').find("span").text();
						$('.count-info').find("span").text(msgCount-1);
					}
					
					$scope.dtInstance.query($scope.taskQuery);
				} else {
					swal({
						  title: "",
						  text: "下载失败!",
						  timer: 1500,
						  type: "error",
						  showConfirmButton: false
					});
				}
			});
		};
	}

	angular.module('download').controller('taskListCtrl', taskListCtrl);
})(angular);

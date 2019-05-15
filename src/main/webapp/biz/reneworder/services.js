angular.module('reneworder', [ 'ngResource' ])	
		.factory('renewCountService',['$resource', function($resource) {
			return $resource('', null, {
				// 获取续费订单统计信息
				getRenewInfo : {
						url : 'renewOrder/getRenewInfo',
						method : 'GET'
				},
			});
		}])
		.factory('renewOrderService',['$resource', function($resource) {
			return $resource('', null, {
				// 续费订单
				findList : {
						url : 'renewOrder/findList',
						method : 'GET'
				},
				//导出文件
				exportRenewOrderFile :{
						url : 'renewOrder/exportRenewOrderFile',
						method : 'POST'
				}
				
			});
		}]).factory(
				'flowPackageService', [ '$resource', function($resource) {
					return $resource('', null, {
						//获取续费套餐列表
						getFlowPkg : { url : 'pkg/getFlowPkg', method : 'GET', isArray: false},
				 });
		}]);
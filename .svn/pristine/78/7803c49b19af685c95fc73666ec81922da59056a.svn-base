angular.module('renewal', [ 'ngResource' ])	
		.factory('renewCountService',['$resource', function($resource) {
			return $resource('', null, {
				// 获取续费订单统计信息
				getRenewInfo : {
						url : 'renewOrder/getRenewInfo',
						method : 'GET'
				},
			});
		}]);
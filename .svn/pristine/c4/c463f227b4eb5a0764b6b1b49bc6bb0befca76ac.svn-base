angular.module('order', [ 'ngResource' ]).factory(
		'orderService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getOutOrder : {
						url : 'order/outorder/',
						method : 'GET'
				},
				// 删除实体
				delOutOrder : {
						url : 'order/outorder/:id',
						method : 'DELETE'
				},
				// 获取分页
				getOutOrderAll : {
						url : 'order/outorder',
						method : 'GET'
				},
				// 保存实体
				saveOutOrder : {
						url : 'order/outorder',
						method : 'POST'
				},
				// 导出文件
				exportOutOrderFile : {
						url : 'order/outorder/exportFile',
						method : 'POST'
				},
				// 导出文件
				addDeliveryResult : {
						url : 'order/outorder/addDeliveryResult',
						method : 'POST'
				},
			});
		} ]);
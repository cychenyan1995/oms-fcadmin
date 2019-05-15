angular.module('recharge', [ 'ngResource' ]).factory(
		'rechargeService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getRechargeOrder : {
						url : 'recharge/rechargeorder/',
						method : 'GET'
				},
				// 删除实体
				delRechargeOrder : {
						url : 'recharge/rechargeorder/:id',
						method : 'DELETE'
				},
				// 获取分页
				getRechargeOrderAll : {
						url : 'recharge/rechargeorder',
						method : 'GET'
				},
				// 保存实体
				saveRechargeOrder : {
						url : 'recharge/rechargeorder',
						method : 'POST'
				},
				// 导出文件
				exportRechargeOrderFile : {
						url : 'recharge/rechargeorder/exportFile',
						method : 'POST'
				},
			});
		} ]);
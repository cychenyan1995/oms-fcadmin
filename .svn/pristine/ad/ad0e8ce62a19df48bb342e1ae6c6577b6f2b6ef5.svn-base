angular.module('op', [ 'ngResource' ]).factory(
		'opService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getNetworkAccess : {
						url : 'op/networkaccess/',
						method : 'GET'
				},
				// 删除实体
				delNetworkAccess : {
						url : 'op/networkaccess/:id',
						method : 'DELETE'
				},
				// 获取分页
				getNetworkAccessAll : {
						url : 'op/networkaccess',
						method : 'GET'
				},
				// 保存实体
				saveNetworkAccess : {
						url : 'op/networkaccess',
						method : 'POST'
				},
				// 导出文件
				exportNetworkAccessFile : {
						url : 'op/networkaccess/exportFile',
						method : 'POST'
				},
				// 获取实体
				getPostagePlan : {
						url : 'op/postageplan/',
						method : 'GET'
				},
				// 删除实体
				delPostagePlan : {
						url : 'op/postageplan/:id',
						method : 'DELETE'
				},
				// 获取分页
				getPostagePlanAll : {
						url : 'op/postageplan',
						method : 'GET'
				},
				// 保存实体
				savePostagePlan : {
						url : 'op/postageplan',
						method : 'POST'
				},
				// 导出文件
				exportPostagePlanFile : {
						url : 'op/postageplan/exportFile',
						method : 'POST'
				},
				// 获取分页
				getOpAll : {
						url : 'op/op',
						method : 'GET'
				},
				// 获取分页
				getMOpAll : {
					url : 'op/mop',
					method : 'GET'
			},
				//获取实体
				getOp :{
					url : 'op/op/',
					method : 'GET'
				},
				// 保存实体
				saveOp : {
						url : 'op/op',
						method : 'POST'
				},
				existsByName : {
					    url :'op/existsByName',
					    method : 'POST'
				}
			});
		} ]);
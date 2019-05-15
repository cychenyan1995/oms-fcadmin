angular.module('auth', [ 'ngResource' ]).factory(
		'authService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getNameauth : {
						url : 'auth/nameauth/',
						method : 'GET'
				},
				// 删除实体
				delNameauth : {
						url : 'auth/nameauth/:id',
						method : 'DELETE'
				},
				// 获取分页
				getNameauthAll : {
						url : 'auth/nameauth',
						method : 'GET'
				},
				// 保存实体
				saveNameauth : {
						url : 'auth/nameauth',
						method : 'POST'
				},
				// 导出文件
				exportNameauthFile : {
						url : 'auth/nameauth/exportFile',
						method : 'POST'
				},
				// 保存实体
				approveAuth : {
						url : 'auth/approveAuth',
						method : 'POST'
				},
			});
		} ]);
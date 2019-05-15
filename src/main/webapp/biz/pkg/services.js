angular.module('pkg', [ 'ngResource' ]).factory(
		'pkgService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getFlowPackage : {
						url : 'pkg/flowpackage/',
						method : 'GET'
				},
				// 删除实体
				delFlowPackage : {
						url : 'pkg/flowpackage/:id',
						method : 'DELETE'
				},
				// 获取分页
				getFlowPackageAll : {
						url : 'pkg/flowpackage',
						method : 'GET'
				},
				// 保存实体
				saveFlowPackage : {
						url : 'pkg/flowpackage',
						method : 'POST'
				},
				// 上下架
				changePackageStatus : {
						url : 'pkg/changePackageStatus',
						method : 'POST'
				},
				// 导出文件
				exportFlowPackageFile : {
						url : 'pkg/flowpackage/exportFile',
						method : 'POST'
				},
				
				
				// 获取实体
				getRenewPackage : {
						url : 'pkg/renewpackage/',
						method : 'GET'
				},
				// 删除实体
				delRenewPackage : {
						url : 'pkg/renewpackage/:id',
						method : 'DELETE'
				},
				// 获取分页
				getRenewPackageAll : {
						url : 'pkg/renewpackage',
						method : 'GET'
				},
				// 保存实体
				saveRenewPackage : {
						url : 'pkg/renewpackage',
						method : 'POST'
				},
				// 上下架
				changeRenewPackageStatus : {
						url : 'pkg/changeRenewPackageStatus',
						method : 'POST'
				},
				// 导出文件
				exportRenewPackageFile : {
						url : 'pkg/renewpackage/exportFile',
						method : 'POST'
				},
				
				existsByName : { 
						url : 'pkg/flowpackage/existsByName', 
						method : 'POST' },
			});
		} ]);
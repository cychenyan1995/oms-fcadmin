angular.module('download', [ 'ngResource' ]).factory(
		'downloadService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getTask : {
						url : 'download/task/',
						method : 'GET'
				},
				// 删除实体
				delTask : {
						url : 'download/task/:id',
						method : 'DELETE'
				},
				// 获取分页
				getTaskAll : {
						url : 'download/task',
						method : 'GET'
				},
				// 保存实体
				notify : {
						url : 'download/task/notify',
						method : 'GET'
				},
				// 导出文件
				exportTaskFile : {
						url : 'download/task/exportFile',
						method : 'POST'
				},
			});
		} ]);
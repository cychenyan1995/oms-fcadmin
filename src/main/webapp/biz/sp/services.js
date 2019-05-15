angular.module('sp', [ 'ngResource' ]).factory(
		'spService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getSp : {
						url : 'sp/sp/',
						method : 'GET'
				},
				// 删除实体
				delSp : {
						url : 'sp/sp/:id',
						method : 'DELETE'
				},
				// 获取分页
				getSpAll : {
						url : 'sp/sp',
						method : 'GET'
				},
				// 保存实体
				saveSp : {
						url : 'sp/sp',
						method : 'POST'
				},
				// 导出文件
				exportSpFile : {
						url : 'sp/sp/exportFile',
						method : 'POST'
				},
				// 获取实体
				getFlowService : {
						url : 'sp/flowservice/',
						method : 'GET'
				},
				// 删除实体
				delFlowService : {
						url : 'sp/flowservice/:id',
						method : 'DELETE'
				},
				// 获取分页
				getFlowServiceAll : {
						url : 'sp/flowservice',
						method : 'GET'
				},
				// 保存实体
				saveFlowService : {
						url : 'sp/flowservice',
						method : 'POST'
				},
				// 导出文件
				exportFlowServiceFile : {
						url : 'sp/flowservice/exportFile',
						method : 'POST'
				},
				// 获取实体
				getFlowPackageList : {
						url : 'sp/flowpackagelist/',
						method : 'GET'
				},
				// 删除实体
				delFlowPackageList : {
						url : 'sp/flowpackagelist/:id',
						method : 'DELETE'
				},
				// 获取分页
				getFlowPackageListAll : {
						url : 'sp/flowpackagelist',
						method : 'GET'
				},
				// 保存实体
				saveFlowPackageList : {
						url : 'sp/flowpackagelist',
						method : 'POST'
				},
				// 导出文件
				exportFlowPackageListFile : {
						url : 'sp/flowpackagelist/exportFile',
						method : 'POST'
				},
				//得到sp列表
				getSpList : {
					url : 'sp/getSpList',
					method : 'GET'
				},
				//删除列表
				deleteSpById : {
					url : 'sp/deleteSpById',
					method : 'DELETE'
				},
				//编辑时得到详情
				getSpdetail : {
					url : 'sp/getSpdetail',
					method : 'GET'
				},
				//更新商户信息
				updateSp : {
					url : 'sp/updateSp',
					method : 'POST'
				},
				//商户名称是否存在
				existBySpName : {
					url : 'sp/existBySpName',
					method : 'POST'
				},
				//根据级别得到商户名
				getSpNameByLevel : {
					url : "sp/getSpNameByLevel",
					method : "GET"
				},
				//得到省
				getProvinceList : {
					url : "sp/getProvinceList",
					method : "GET"
				},
				//得到市
				getCityList : {
					url : "sp/getCityList",
					method : "GET"
				}
			});
		} ]);
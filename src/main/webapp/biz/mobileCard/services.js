angular.module(flowcardModel, ['ngResource']).factory('flowcardService',
		[ '$resource', function($resource) {
			return $resource('', null, {
				//获取卡列表
				getAll : {url : 'cardmanage/findAll',method : 'GET'},
				//单卡停用
				stopCards:{ url: 'cardmanage/stopCards', method: 'POST', isArray: false},
				//单卡启用
				openCards:{ url: 'cardmanage/openCards', method: 'POST', isArray: false},
				//导入卡
				importCards:{ url: 'cardmanage/importCards', method: 'POST'},
				// 下载模板
				downloadTemplate : { url : 'cardmanage/downloadTemplate/', method : 'GET', isArray: false},
				// 获取分页
				getLifeCycleAll : { url : 'stock/lifecycle', method : 'GET'},
				// 保存实体
				saveLifeCycle : { url : 'stock/lifecycle',	method : 'POST'	},
				// 导出文件
				exportLifeCycleFile : {	url : 'stock/lifecycle/exportFile',	method : 'POST'	},
				// 卡出卡操作
				stockCard:{ url: 'stock/lifecycle/stockCard', method: 'POST'},
				//移动卡导出
				exportFlowCardFile : { url : 'cardmanage/exportFile', method : 'POST'},
				//获取卡详情
				getCardDetail :{url : 'cardmanage/getCardDetail', method : 'GET'},
			});

		}]).factory(
				'spService', [ '$resource', function($resource) {
					return $resource('', null, {
						// 获取实体
						getSp : {url : 'sp/sp/',method : 'GET'}
					
				 });
			}]).factory(
				'mobileOpenCardService', [ '$resource', function($resource) {
					return $resource('', null, {
						//获取待开卡信息列表
						getOpenCardList : { url : 'mobileopencard/getOpenCardList', method : 'GET', isArray: false},
						exportOpenCardFile :{url : 'mobileopencard/exportOpenCardFile', method : 'POST', isArray: false}
				 });
		}]);

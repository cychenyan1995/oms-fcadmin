angular.module('card', [ 'ngResource' ]).factory(
		'cardService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取实体
				getFlowCard : { url : 'card/flowcard/', method : 'GET'},
				// 获取卡详情
				getCardDetail : { url : 'card/getCardDetail/', method : 'GET'},
				//单卡停用
				stopCards:{ url: 'card/stopCards', method: 'POST', isArray: false},
				//单卡启用
				openCards:{ url: 'card/openCards', method: 'POST', isArray: false},
				// 下载模板
				downloadTemplate : { url : 'card/downloadTemplate/', method : 'GET', isArray: false},
				// 获取当前卡套餐信息
				getCurPackage : { url : 'card/getCurPackage/', method : 'GET', isArray: false},
				//获取可续费套餐列表
				getValidFlowPkg : { url : 'card/getValidFlowPkg', method : 'POST', isArray: false},
				//单卡续费
				renewCards:{ url: 'card/renewCards', method: 'POST', isArray: false},
				//导入卡
				importCards:{ url: 'card/importCards', method: 'POST'},
				//启用、停用导入卡
				batchImport:{ url: 'card/batchImport', method: 'POST', isArray: false},
				//批量启用、停用卡
				batchOpCards:{ url: 'card/batchOpCards', method: 'POST', isArray: false},
				//批量续费卡
				batchOpRenewCards:{ url: 'card/batchOpRenewCards', method: 'POST', isArray: false},
				// 删除实体
				delFlowCard : {	url : 'card/flowcard/:id', method : 'DELETE'},
				// 获取分页
				getFlowCardAll : { url : 'card/flowcard', method : 'GET'},
				// 保存实体
				saveFlowCard : { url : 'card/flowcard', method : 'POST'},
				// 导出文件
				exportFlowCardFile : { url : 'card/flowcard/exportFile', method : 'POST'},
				// 获取实体
				getLifeCycle : { url : 'card/lifecycle/', method : 'GET'},
				// 删除实体
				delLifeCycle : { url : 'card/lifecycle/:id', method : 'DELETE'},
				// 获取分页
				getLifeCycleAll : { url : 'card/lifecycle', method : 'GET'},
				// 保存实体
				saveLifeCycle : { url : 'card/lifecycle',	method : 'POST'	},
				// 导出文件
				exportLifeCycleFile : {	url : 'card/lifecycle/exportFile',	method : 'POST'	},
				// 卡出卡操作
				stockCard:{ url: 'card/lifecycle/stockCard', method: 'POST'},
				// 获取实体
				getOrderInfo : { url : 'card/orderinfo/',	method : 'GET' },
				// 删除实体
				delOrderInfo : { url : 'card/orderinfo/:id', method : 'DELETE'	},
				// 获取分页
				getOrderInfoAll : {	url : 'card/orderinfo', method : 'GET'	},
				// 保存实体
				saveOrderInfo : { url : 'card/orderinfo',	method : 'POST' },
				// 导出文件
				exportOrderInfoFile : {	url : 'card/orderinfo/exportFile',	method : 'POST'	},
				// 获取实体
				getFlowPool : {	url : 'card/flowpool/', method : 'GET' },
				// 删除实体
				delFlowPool : {	url : 'card/flowpool/:id',	method : 'DELETE'},
				
				existsByName : { url : 'card/flowpool/existsByName', method : 'POST' },
				// 获取分页
				getFlowPoolAll : {url : 'card/flowpool',method : 'GET' },
				// 获取分页
				getFlowPoolMonthDetail : {url : 'card/flowPoolMonthDetail',method : 'GET' },
				// 保存实体
				saveFlowPool : { url : 'card/flowpool', method : 'POST' },
				// 导出文件
				exportFlowPoolFile : { url : 'card/flowpool/exportFile', method : 'POST' },
				// 获取实体
				getPostage : { url : 'card/postage/:id', method : 'GET' },
				getByPostageId : { url : 'card/postage/getByPostageId/:postageId', method : 'GET' },
				// 删除实体
				delPostage : { url : 'card/postage/:id', method : 'DELETE'},
				// 获取分页
				getPostageAll : { url : 'card/postage', method : 'GET' },
				// 保存实体
				savePostage : { url : 'card/postage', method : 'POST'},
				// 导出文件
				exportPostageFile : { url : 'card/postage/exportFile', method : 'POST'},
				// 获取实体
				getChangeLog : { url : 'card/changelog/', method : 'GET'},
				// 删除实体
				delChangeLog : { url : 'card/changelog/:id', method : 'DELETE' },
				// 获取分页
				getChangeLogAll : { url : 'card/changelog', method : 'GET'},
				// 保存实体
				saveChangeLog : { url : 'card/changelog', method : 'POST'},
				// 导出文件
				exportChangeLogFile : { url : 'card/changelog/exportFile', method : 'POST'},
			});
		}]).factory(
			'poolService', [ '$resource', function($resource) {
				return $resource('', null, {
					// 获取实体
					getPoolList : { url : 'card/flowpool/', method : 'GET' },
					/*existsByName : { url : 'card/existsByName/:flowpoolName', method : 'GET' }*/
				
			 });
		}]).factory(
				'flowPackageService', [ '$resource', function($resource) {
					return $resource('', null, {
						//获取续费套餐列表
						getFlowPkg : { url : 'pkg/getFlowPkg', method : 'GET', isArray: false},
				 });
		}]).factory(
				'postageNetworkService', [ '$resource', function($resource) {
					return $resource('', null, {
						//获取资费计划列表
						getpostageNetworkList : { url : 'postagenetwork/getpostageNetworkList', method : 'GET', isArray: false},
						//编辑得到资费计划的详情
						getPostageDetail : {url : 'postagenetwork/getPostageDetail' , method : 'GET'},
						//删除资费计划
						deletePostage : {url : 'postagenetwork/deletePostage' , method : 'DELETE'},
						//获取通信计划列表
						getNetworkList : { url : 'postagenetwork/getNetworkList' , method : 'GET'},
						//删除通信计划
						delNetwork : {url : 'postagenetwork/delNetwork' , method : 'POST'},
						//添加通信计划
						saveNetwork : {url : 'postagenetwork/saveNetwork' , method : 'POST'},
						//编辑资费计划
						updatePostage : {url : 'postagenetwork/updatePostage' , method : 'POST'},
						//判断通信计划的code 和name是否已存在
						existsByCodeName : {url : 'postagenetwork/existsByCodeName' , method : 'POST'},
						//判断资费计划的name是否已经存在
						existsByPostName : {url : 'postagenetwork/existsByPostName' , method : 'POST'}
				 });
		}]).factory(
				'openCardService', [ '$resource', function($resource) {
					return $resource('', null, {
						//获取待开卡信息列表
						getOpenCardList : { url : 'opencard/getOpenCardList', method : 'GET', isArray: false},
						exportOpenCardFile :{url : 'opencard/exportOpenCardFile', method : 'POST', isArray: false}
				 });
		}]);
angular.module('recovery', [ 'ngResource' ]).factory(
		'recoveryService', [ '$resource', function($resource) {
			return $resource('', null, {
				// 获取分页
				getTransferAll : {
						url : 'recovery/transferRecord',
						method : 'GET'
				},
				// 跳到迁移界面
				toTransferingOp : {
						url : 'recovery/toTransferingOp/:id',
						method : 'GET'
				},
				// 迁移操作
				transferingOp : {
						url : 'recovery/transferingOp/',
						method : 'GET'
				},
				// 保存实体
				saveTransfer : {
						url : 'recovery/transferRecord',
						method : 'POST'
				},
				existsByTransferCard: {
					url : 'recovery/existsByTransferCard',
					method : 'POST'
				},
				// 获取分页
				getRecycleAll : {
					url : 'recovery/recycleRecord',
					method : 'GET'
				},
				// 跳到回收界面
				toRecyclingOp : {
						url : 'recovery/toRecyclingOp/:id',
						method : 'GET'
				},
				// 回收操作
				recyclingOp : {
						url : 'recovery/recyclingOp/',
						method : 'GET'
				},
				//查看需要回收的卡信息
				queryRecycleCard : {
					url : 'recovery/queryRecycleCard/',
					method : 'GET'
			    },
				// 保存实体
				saveRecycle : {
					url : 'recovery/recycleRecord',
					method : 'POST'
				},
				existsByRecycleCard : {
					url : 'recovery/existsByRecycleCard',
					method : 'POST'
				}
			});
		} ]);
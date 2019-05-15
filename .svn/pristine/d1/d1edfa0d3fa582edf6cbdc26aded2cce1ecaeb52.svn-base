/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'recovery',
			icon : 'refresh',
			menuTitle : '回收／迁移卡',
			services : [{
				name: 'sp',
				files: ['biz/sp/services.js']
			},{
				name: 'recovery',
				files: ['biz/recovery/services.js']
			}],
			children : [
					{
						pageTitle : '回收卡管理',
						url : 'recycle',
						controller : {
							name : 'recycleListCtrl',
							nameAs : 'recycleListCtrl',
							files : [
									'biz/recovery/recycle/controller/listCtrl.js',
									'biz/recovery/recycle/controller/createCtrl.js',
									'biz/recovery/recycle/controller/recycleCtrl.js' ]
						},
						templateUrl : "biz/recovery/recycle/view/list.html",
						plugins : [ 'ngJsTree', 'ngDatatables',
								'daterangepicker', 'ui.select', 'sweet_alert',
								'fileupload', 'localytics.directives' ]
					},
					{
						pageTitle : '迁移卡管理',
						url : 'transfer',
						controller : {
							name : 'transferListCtrl',
							nameAs : 'transferListCtrl',
							files : [
									'biz/recovery/transfer/controller/listCtrl.js',
									'biz/recovery/transfer/controller/createCtrl.js',
									'biz/recovery/transfer/controller/transferCtrl.js' ]
						},
						templateUrl : "biz/recovery/transfer/view/list.html",
						plugins : [ 'ngJsTree', 'ngDatatables',
								'daterangepicker', 'ui.select', 'sweet_alert',
								'fileupload', 'localytics.directives' ]
					} ]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

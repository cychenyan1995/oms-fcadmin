/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'sp',
			icon : 'group',
			menuTitle : '服务商管理',
			services : [ 'biz/sp/services.js' ],
			children : [ 
			    {
				pageTitle : '服务商管理',
				url : 'sp',
				controller : {
					name : 'spListCtrl',
					nameAs : 'spListCtrl',
					files : [
					        'biz/sp/sp/controller/listCtrl.js',
							'biz/sp/sp/controller/createCtrl.js',
							'biz/sp/sp/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/sp/sp/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   }/*,
			    {
				pageTitle : '流量服务包',
				url : 'flowservice',
				controller : {
					name : 'flowServiceListCtrl',
					nameAs : 'flowServiceListCtrl',
					files : [
					        'biz/sp/flowservice/controller/listCtrl.js',
							'biz/sp/flowservice/controller/createCtrl.js',
							'biz/sp/flowservice/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/sp/flowservice/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },
			    {
				pageTitle : '服务套歺关联表',
				url : 'flowpackagelist',
				controller : {
					name : 'flowPackageListListCtrl',
					nameAs : 'flowPackageListListCtrl',
					files : [
					        'biz/sp/flowpackagelist/controller/listCtrl.js',
							'biz/sp/flowpackagelist/controller/createCtrl.js',
							'biz/sp/flowpackagelist/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/sp/flowpackagelist/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   }*/
			]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

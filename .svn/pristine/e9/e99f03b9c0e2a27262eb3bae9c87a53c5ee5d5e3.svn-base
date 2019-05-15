/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'pkg',
			icon: 'sitemap',
			menuTitle : '套餐管理',
			services : [{
				name: 'op',
				files: ['biz/op/services.js']
			},{
				name: 'sp',
				files: ['biz/sp/services.js']
			},{
				name: 'pkg',
				files: ['biz/pkg/services.js']
			}],
			children : [ 
			    {
				pageTitle : '开卡套餐管理',
				url : 'flowpackage',
				controller : {
					name : 'flowPackageListCtrl',
					nameAs : 'flowPackageListCtrl',
					files : [
					        'biz/pkg/flowpackage/controller/listCtrl.js',
							'biz/pkg/flowpackage/controller/createCtrl.js',
							'biz/pkg/flowpackage/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/pkg/flowpackage/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives','icheck' ]
			   },
			   {
					pageTitle : '续费套餐管理',
					url : 'renewpackage',
					controller : {
						name : 'renewPackageListCtrl',
						nameAs : 'renewPackageListCtrl',
						files : [
						        'biz/pkg/renewpackage/controller/listCtrl.js',
								'biz/pkg/renewpackage/controller/createCtrl.js',
								'biz/pkg/renewpackage/controller/editCtrl.js'
						]
					},
					templateUrl : "biz/pkg/renewpackage/view/list.html",
					plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
							'ui.select', 'sweet_alert', 'fileupload',
							'localytics.directives','icheck' ]
				   },
			]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'op',
			icon : 'globe',
			menuTitle : '运营商管理',
			services : [ 'biz/op/services.js' ],
			children : [ 
/* {
				pageTitle : '通讯计划定义',
				url : 'networkaccess',
				controller : {
					name : 'networkAccessListCtrl',
					nameAs : 'networkAccessListCtrl',
					files : [
					        'biz/op/networkaccess/controller/listCtrl.js',
							'biz/op/networkaccess/controller/createCtrl.js',
							'biz/op/networkaccess/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/op/networkaccess/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },,
			    {
				pageTitle : '资费计划',
				url : 'postageplan',
				controller : {
					name : 'postagePlanListCtrl',
					nameAs : 'postagePlanListCtrl',
					files : [
					        'biz/op/postageplan/controller/listCtrl.js',
							'biz/op/postageplan/controller/createCtrl.js',
							'biz/op/postageplan/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/op/postageplan/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },*/
			    {
				pageTitle : '运营商账号',
				url : 'op',
				controller : {
					name : 'opListCtrl',
					nameAs : 'opListCtrl',
					files : [
					        'biz/op/op/controller/listCtrl.js',
							'biz/op/op/controller/createLtCtrl.js',
					        'biz/op/op/controller/createYdCtrl.js'
					]
				},
				templateUrl : "biz/op/op/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert',
						'localytics.directives' ]
			   },
			]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

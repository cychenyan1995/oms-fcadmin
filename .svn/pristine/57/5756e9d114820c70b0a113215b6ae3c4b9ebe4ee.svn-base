/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'card',
			icon: 'cubes',
			menuTitle : '联通卡',
			services : [{
				name: 'op',
				files: ['biz/op/services.js']
			},{
				name: 'sp',
				files: ['biz/sp/services.js']
			},{
				name: 'card',
				files: ['biz/card/services.js']
			},{
				name: 'pkg',
				files: ['biz/pkg/services.js']
			}],
			children : [ 
			{
				pageTitle : '资费计划管理',
				url : 'postagenetwork',
				controller : {
					name : 'postageNetworkCtrl',
					nameAs : 'postageNetworkCtrl',
					files : [
					        'biz/card/postagenetwork/controller/listCtrl.js',
							'biz/card/postagenetwork/controller/createCtrl.js',
							'biz/card/postagenetwork/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/card/postagenetwork/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
							'ui.select', 'sweet_alert', 'fileupload',
							'localytics.directives' ]
			   },
			    {
				pageTitle : '联通卡片管理',
				url : 'flowcard',
				controller : {
					name : 'flowCardListCtrl',
					nameAs : 'flowCardListCtrl',
					files : [
					        'biz/card/flowcard/controller/listCtrl.js',
							'biz/card/flowcard/controller/createCtrl.js',
							'biz/card/flowcard/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/card/flowcard/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },{
				pageTitle : '库存卡管理',
				url : 'lifecycle',
				controller : {
					name : 'lifeCycleListCtrl',
					nameAs : 'lifeCycleListCtrl',
					files : [
					        'biz/card/lifecycle/controller/listCtrl.js',
							// 'biz/card/lifecycle/controller/createCtrl.js',
							'biz/card/lifecycle/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/card/lifecycle/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },
			   {
				pageTitle : '待开卡管理',
				url : 'opencard',
				controller : {
					name : 'openCardListCtrl',
					files : [
					        'biz/card/opencard/controller/listCtrl.js',
					]
				},
				templateUrl : "biz/card/opencard/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
				   },
			   /*{
				pageTitle : '卡入库',
				url : 'orderinfo',
				controller : {
					name : 'orderInfoListCtrl',
					nameAs : 'orderInfoListCtrl',
					files : [
					        'biz/card/orderinfo/controller/listCtrl.js',
							'biz/card/orderinfo/controller/createCtrl.js',
							'biz/card/orderinfo/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/card/orderinfo/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },*/
			    {
				pageTitle : '流量池管理',
				url : 'flowpool',
				controller : {
					name : 'flowPoolListCtrl',
					files : [
					        'biz/card/flowpool/controller/listCtrl.js',
							'biz/card/flowpool/controller/createCtrl.js',
							'biz/card/flowpool/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/card/flowpool/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },
			    /*,
			    {
				pageTitle : '卡变更列表',
				url : 'changelog',
				controller : {
					name : 'changeLogListCtrl',
					nameAs : 'changeLogListCtrl',
					files : [
					        'biz/card/changelog/controller/listCtrl.js',
							'biz/card/changelog/controller/createCtrl.js',
							'biz/card/changelog/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/card/changelog/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },*/
			   
			]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

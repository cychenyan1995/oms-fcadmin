/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'order',
			icon: 'shopping-cart',
			menuTitle : '购卡订单管理',
			services : [{
				name: 'sp',
				files: ['biz/sp/services.js']
			},{
				name: 'pkg',
				files: ['biz/pkg/services.js']
			},{
				name: 'order',
				files: ['biz/order/services.js']
			}],
			children : [ 
			    {
				pageTitle : '购卡订单管理',
				url : 'outorder',
				controller : {
					name : 'outOrderListCtrl',
					nameAs : 'outOrderListCtrl',
					files : [
					        'biz/order/outorder/controller/listCtrl.js',
							'biz/order/outorder/controller/createCtrl.js',
							'biz/order/outorder/controller/editCtrl.js',
							'biz/order/outorder/controller/deliveryCtrl.js'
					]
				},
				templateUrl : "biz/order/outorder/view/list.html",
				plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						'ui.select', 'sweet_alert', 'fileupload',
						'localytics.directives' ]
			   },
			]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

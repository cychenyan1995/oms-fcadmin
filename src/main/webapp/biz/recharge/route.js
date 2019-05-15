/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'recharge',
			menuTitle : '流量',
			services : [ 'biz/recharge/services.js' ],
			children : [ 
			    {
				pageTitle : '续费明细',
				url : 'rechargeorder',
				controller : {
					name : 'rechargeOrderListCtrl',
					nameAs : 'rechargeOrderListCtrl',
					files : [
					        'biz/recharge/rechargeorder/controller/listCtrl.js',
							'biz/recharge/rechargeorder/controller/createCtrl.js',
							'biz/recharge/rechargeorder/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/recharge/rechargeorder/view/list.html",
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

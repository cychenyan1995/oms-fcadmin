/* global angular */
var flowcardModel = "mobileCard";
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			// 卡片管理
			url : flowcardModel,
			menuTitle : '移动卡',
			services : [{
				name: 'mobileCard',
				files: ['biz/mobileCard/services.js']
			},{
				name: 'sp',
				files: ['biz/sp/services.js']
			},{
				name: 'pkg',
				files: ['biz/pkg/services.js']
			},{
				name: 'op',
				files: ['biz/op/services.js']
			}],
			children : [
					{
						pageTitle : '移动卡片管理',
						url : 'flowcardList',
						controller : {
							name : 'flowcardListCtrl',
							nameAs : 'scCtrl',
							files : [ 
							          'biz/mobileCard/cardManage/controller/flowcardListCtrl.js',
							          'biz/mobileCard/cardManage/controller/operateActiveCtrl.js',
							          'biz/mobileCard/cardManage/controller/importCardCtrl.js',
							          'biz/mobileCard/cardManage/controller/operateStopCtrl.js',
							          'biz/mobileCard/cardManage/controller/operateCardDetailCtrl.js',
							]
						},
						templateUrl : "biz/mobileCard/cardManage/view/flowcardList.html",
						plugins : [ 'ngJsTree', 'ngDatatables','fileupload',
								'daterangepicker', 'ui.select', 'sweet_alert','loading_buttons']
					},{
						pageTitle : '库存卡管理',
						url : 'stockcard',
						controller : {
							name : 'stockCardListCtrl',
							files : [
							        'biz/mobileCard/stockcard/controller/listCtrl.js',
							]
						},
						templateUrl : "biz/mobileCard/stockcard/view/list.html",
						plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
								'ui.select', 'sweet_alert', 'fileupload',
								'localytics.directives' ]
					},{
						pageTitle : '待开卡管理',
						url : 'opencard',
						controller : {
							name : 'mobileOpenCardListCtrl',
							files : [
							         'biz/mobileCard/opencard/controller/listCtrl.js',
							         ]
						},
						templateUrl : "biz/mobileCard/opencard/view/list.html",
						plugins : [ 'ngJsTree', 'ngDatatables', 'daterangepicker',
						        'ui.select', 'sweet_alert', 'fileupload',
						        'localytics.directives' ]
					}
			]
		} ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'auth',
			icon: 'id-card',
			menuTitle : '实名认证',
			services : [{
				name: 'op',
				files: ['biz/op/services.js']
			},{
				name: 'auth',
				files: ['biz/auth/services.js']
			}],
			children : [ 
			    {
				pageTitle : '实名认证',
				url : 'nameauth',
				controller : {
					name : 'nameauthListCtrl',
					nameAs : 'nameauthListCtrl',
					files : [
					        'biz/auth/nameauth/controller/listCtrl.js',
							'biz/auth/nameauth/controller/createCtrl.js',
							'biz/auth/nameauth/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/auth/nameauth/view/list.html",
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

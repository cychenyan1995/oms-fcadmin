/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [ {
			url : 'download',
			icon: 'download',
			menuTitle : '附加功能',
			services : [ 'biz/download/services.js' ],
			children : [ 
			    {
				pageTitle : '下载列表',
				url : 'task',
				controller : {
					name : 'taskListCtrl',
					nameAs : 'taskListCtrl',
					files : [
					        'biz/download/task/controller/listCtrl.js',
							'biz/download/task/controller/createCtrl.js',
							'biz/download/task/controller/editCtrl.js'
					]
				},
				templateUrl : "biz/download/task/view/list.html",
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

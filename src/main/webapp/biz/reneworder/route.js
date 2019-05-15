/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [{            
            url: 'reneworder',
            icon: 'rmb',
            menuTitle: '续费管理',
            services: [{
				name: 'sp',
				files: ['biz/sp/services.js']
			},{
				name: 'pkg',
				files: ['biz/pkg/services.js']
			},{
				name: 'reneworder',
				files: ['biz/reneworder/services.js']
			},{
				name: 'card',
				files: ['biz/card/services.js']
			}],
            children: [{
                    pageTitle: '续费统计',
                    url: 'renewcount',
                    controller: {
                        name: 'renewCountListCtrl',
                        nameAs: 'renewCountListCtrl',
                        files: ['biz/reneworder/controller/renewCountlistCtrl.js']
                    },
                    templateUrl: "biz/reneworder/view/renewCountlist.html",
                    plugins: ['ngDatatables','ui.select', 'sweet_alert']
                },
                {
                    pageTitle: '续费订单',
                    url: 'renewalorder',
                    controller: {
                        name: 'renewOrderListCtrl',
                        nameAs: 'renewOrderListCtrl',
                        files: ['biz/reneworder/controller/renewOrderListCtrl.js']
                    },
                    templateUrl: "biz/reneworder/view/renewOrderlist.html",
                    plugins: ['ngJsTree', 'ngDatatables', 'daterangepicker',
       						'ui.select', 'sweet_alert', 'fileupload',
    						'localytics.directives' ]
                }
            ]
        } ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

/* global angular */
(function() {
	function config(routeConfigProvider) {
		var routeList = [{            
            url: 'renewal',
            menuTitle: '续费订单管理',
            services: ['biz/renewal/services.js'],
            children: [{
                    pageTitle: '续费统计',
                    url: 'renewcount',
                    controller: {
                        name: 'renewCountListCtrl',
                        nameAs: 'renewCountListCtrl',
                        files: ['biz/renewal/renewcount/controller/renewCountlistCtrl.js']
                    },
                    templateUrl: "biz/renewal/renewcount/view/renewCountlist.html",
                    plugins: ['ngDatatables','ui.select', 'sweet_alert']
                }
            ]
        } ];

		routeConfigProvider.addRoute(routeList);
	}
	angular.module('inspinia').config(config);
})(angular)

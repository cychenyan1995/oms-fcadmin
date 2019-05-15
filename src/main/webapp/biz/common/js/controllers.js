/* global angular */
(function(angular) {

    /**
     * MainCtrl - controller
     */
    function MainCtrl($scope, routeConfig, $stateParams) {

        this.userName = '张三';
        $scope.routeParams = $stateParams;
        // this.helloText = '欢迎访问广联运营平台';
        // this.descriptionText = '系统功能描述';

        $scope.menuList = routeConfig.menuList;

        $scope.safeApply = function (fn) {
            var phase = this.$root.$$phase;
            if (phase == '$apply' || phase == '$digest') {
                if (fn && (typeof(fn) === 'function')) {
                    fn();
                }
            } else {
                this.$apply(fn);
            }
        }

    }


    angular
        .module('inspinia')
        .controller('MainCtrl', MainCtrl);

})(angular);

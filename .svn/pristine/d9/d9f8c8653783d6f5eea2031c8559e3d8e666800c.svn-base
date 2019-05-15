(function(angular) {
    angular
        .module('oitozero.ngSweetAlert')
        .service('SweetAlertX',function(SweetAlert) {
            var defaultConfirm = {
                title: '',
                text: '',
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确认",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: true 
            };
            this.alert = function(title,content,type) {
                SweetAlert.swal(title,content,type);
            };
            this.confirm = function(opt,confirmCbk,cancelCbk) {
                var option = angular.extend({},defaultConfirm,opt);
                SweetAlert.swal(option, function (isConfirm) {
                        if(isConfirm){     
                            confirmCbk();
                        } else {
                            (cancelCbk || angular.noop)();
                        }
                    }
                );
            };
            this.swal = function() {
                Function.prototype.apply.call(SweetAlert.swal, SweetAlert, arguments);
            };
        });
})(angular);

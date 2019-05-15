/**
 * 定义常量
 */
/* global inspiniaPath, angular */
(function(angular) {
    angular
        .module('constant', [])
        .constant('CDN', {
            path: cdnPath
        })
        .constant('PLUGINS', {
            // 表格
            'ngDatatables': [{
                serie: true,
                insertBefore: '#resetBefore',
                files: [
                    inspiniaPath + 'js/plugins/dataTables/0.5.6/datatables.min.js',
                    inspiniaPath + 'css/plugins/dataTables/0.5.6/datatables.min.css'
                ]
            }, {
                serie: true,
                name: 'datatables',
                files: [inspiniaPath + 'js/plugins/dataTables/0.5.6/angular-datatables.min.js']
            }, {
                serie: true,
                name: 'datatables.buttons',
                files: [inspiniaPath + 'js/plugins/dataTables/0.5.6/angular-datatables.buttons.min.js']
            }, {
                serie: true,
                name: 'datatables.scroller',
                files: [
                    'js/plugins/dataTables/dataTables.scroller.js',
                    'js/plugins/dataTables/angular-datatables.scroller.min.js',
                    'css/plugins/dataTables/dataTables.scroller.css'
                ]
            }, {
                serie: true,
                name: 'datatables.fixedcolumns',
                files: [
                    'js/plugins/dataTables/dataTables.fixedColumns.min.js',
                    'js/plugins/dataTables/angular-datatables.fixedcolumns.min.js',
                    'css/plugins/dataTables/fixedColumns.dataTables.css'
                ]
            }, {
                serie: true,
                files: ['js/plugins/dataTables/fnStandingRedraw.js']
            }, {
                serie: true,
                name: 'datatables.config',
                files: ['js/plugins/dataTables/angular-datatables-configs.js']
            }],
            // 日期范围选择
            'daterangepicker': [{
                serie: true,
                files: [inspiniaPath+'js/plugins/moment/moment.min.js']
            }, {
                serie: true,
                files: ['js/plugins/daterangepicker/daterangepicker.js',
                        'css/plugins/daterangepicker/daterangepicker.css'
                ]
            }, {
                serie: true,
                name: 'daterangepicker',
                files: [inspiniaPath+'js/plugins/daterangepicker/angular-daterangepicker.js',
                        'js/plugins/daterangepicker/angular-daterangepicker-config.js'
                ]
            }],
            // 树列表
            'ngJsTree': [{
                files: [inspiniaPath+'css/plugins/jsTree/style.min.css',
                        inspiniaPath+'js/plugins/jsTree/jstree.min.js'
                ]
            }, {
                name: 'ngJsTree',
                files: [inspiniaPath+'js/plugins/jsTree/ngJsTree.min.js']
            }],
            // 下拉框
            'ui.select': [{
                serie: true,
                name: 'ui.select',
                files: [inspiniaPath+'js/plugins/ui-select/select.min.js',
                        inspiniaPath+'css/plugins/ui-select/select.min.css'
                ]
            }],
            //再次弹出框
            'sweet_alert': [{
                serie: true,
                name: 'oitozero.ngSweetAlert',
                files: ['js/plugins/sweetalert/sweetalert.min.js',
                        'css/plugins/sweetalert/sweetalert.css',
                        inspiniaPath+'js/plugins/sweetalert/angular-sweetalert.min.js',
                        'js/plugins/sweetalert/angular-sweetalert-config.js'
                ]
            }],
            //checkbox
            'icheck': [{
                files: [
                    inspiniaPath + 'css/plugins/iCheck/custom.css',
                    inspiniaPath + 'js/plugins/iCheck/icheck.min.js'
                ]
            }],
            // 上传文件依赖
            'jasny': [{
                files: [inspiniaPath+'js/plugins/jasny/jasny-bootstrap.min.js',
                        inspiniaPath+'css/plugins/jasny/jasny-bootstrap.min.css'
                ]
            }],
            // 上传文件依赖
            'fileupload': [{
                name: 'angularFileUpload',
                files: [inspiniaPath+'js/plugins/fileupload/angular-file-upload.min.js']
            }],
            'angular-flot': [{
                 serie: true,
                 name: 'angular-flot',
                 files: [ 'js/plugins/flot/jquery.flot.js', 
                          'js/plugins/flot/jquery.flot.time.js', 
                          'js/plugins/flot/jquery.flot.tooltip.min.js', 
                          'js/plugins/flot/jquery.flot.spline.js', 
                          'js/plugins/flot/jquery.flot.resize.js', 
                          'js/plugins/flot/jquery.flot.pie.js', 
                          'js/plugins/flot/curvedLines.js', 
                          'js/plugins/flot/angular-flot.js'
                        ]
             }]
        });
    cdnPath = undefined;
})(angular);

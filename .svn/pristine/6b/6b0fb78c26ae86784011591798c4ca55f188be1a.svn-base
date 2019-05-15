/* global angular */
(function(angular) {
    'use strict';
    // daterangepicker 配置项扩展
    angular
        .module('daterangepicker')
        .constant('daterangepickerCustom', {
            options: {
                language: 'zn-ch',
                locale: {
                    format: 'YYYY-MM-DD',
                    applyLabel: '确定',
                    cancelLabel: '取消',
                    fromLabel: '开始',
                    toLabel: '结束',
                    customRangeLabel: '自定义',
                    monthNames: "一月_二月_三月_四月_五月_六月_七月_八月_九月_十月_十一月_十二月".split("_"),
                    daysOfWeek: "日_一_二_三_四_五_六".split("_")
                },
                autoApply: true,
                // valueFormat: 'YYYY-MM-DD 00:00:00'
                valueFormat: false,
                autoUpdateInput: false,
                ranges: {
                    '今天': [moment().format('YYYY-MM-DD 00:00:00'), moment().format('YYYY-MM-DD 23:59:59')],
                    '昨天': [moment().subtract(1, 'days').format('YYYY-MM-DD 00:00:00'), moment().subtract(1, 'days').format('YYYY-MM-DD 23:59:59')],
                    '最近7天': [moment().subtract(7, 'days').format('YYYY-MM-DD 00:00:00'), moment().subtract(1, 'days').format('YYYY-MM-DD 23:59:59')],
                    '最近30天': [moment().subtract(30, 'days').format('YYYY-MM-DD 00:00:00'), moment().subtract(1, 'days').format('YYYY-MM-DD 23:59:59')],
                    '最近60天': [moment().subtract(60, 'days').format('YYYY-MM-DD 00:00:00'), moment().subtract(1, 'days').format('YYYY-MM-DD 23:59:59')]
                },
                alwaysShowCalendars: true,
                showCustomRangeLabel: false
            }
        })
        .decorator('dateRangePickerDirective', ['$delegate', 'daterangepickerCustom', '$timeout', function($delegate, daterangepickerCustom, $timeout) {
            var directive = $delegate[0];
            var originalLinkFn = directive.link;

            // 修改opts为可选
            directive.$$isolateBindings.opts.optional = true;
            // 默认opts的值
            directive.compile = function() {
                return function newLinkFn(scope, element, attr, modelCtrl) {
                    var opt = scope.$eval(attr.option) || {};
                    var _opts = scope.opts = scope.opts || {};
                    // _opts.ranges = _opts.ranges && daterangepickerCustom.options.ranges;
                    var temp = angular.merge({}, daterangepickerCustom.options, _opts);
                    // merge 默认配置项
                    angular.merge(_opts, temp);
                    _opts.ranges = opt.range && daterangepickerCustom.options.ranges;

                    // 初始化model
                    var copyModel = scope.model || {};
                    copyModel = scope.model = {
                        startDate: copyModel.startDate ? moment(copyModel.startDate) : null,
                        endDate: copyModel.endDate ? moment(copyModel.endDate) : null
                    };
                    modelCtrl.$render();
                    // true: 手动清空
                    var key = false;

                    // 重置link
                    originalLinkFn.apply($delegate[0], arguments);
                    modelCtrl.$parsers.push(function(val) {
                        if (element.val() === '') {
                            key = true;
                            return scope.model = {
                                startDate: null,
                                endDate: null
                            };
                        }
                        key = false;
                        if (!_opts.valueFormat) {
                            return val;
                        }
                        if (angular.isObject(val) && angular.isObject(val.startDate) && angular.isObject(val.endDate)) {
                            val.startDate = val.startDate.format(_opts.valueFormat);
                            val.endDate = val.endDate.format(_opts.valueFormat);
                            return val;
                        }
                        return val;
                    });

                    // 初始无选择直接apply时，同步值
                    element.on('apply.daterangepicker', function(e, picker) {
                        return scope.$apply(function() {
                            return scope.model = {
                                startDate: picker.startDate,
                                endDate: picker.endDate
                            };
                        });
                    });

                    // 清除
                    element.on('hide.daterangepicker', function(e, picker) {
                        return scope.$apply(function() {
                            if (element.val() === '' && key) {
                                scope.model = {
                                    startDate: null,
                                    endDate: null
                                };
                            } else {
                                scope.model = {
                                    startDate: picker.startDate,
                                    endDate: picker.endDate
                                };
                            }
                            return scope.model;
                        });
                    });

                    // model 无初始化值时，自动初始化并同步
                    $timeout(function() {
                        // setViewValue 非严格比较更新
                        return modelCtrl.$setViewValue(angular.copy(copyModel, {}));
                    });
                };

            };

            delete $delegate[0].link;
            return $delegate;
        }]);
})(angular);

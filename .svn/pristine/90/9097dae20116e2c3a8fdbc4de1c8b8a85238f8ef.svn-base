(function(angular) {
    angular
        .module('datatables.config', ['datatables'])
        .run(function(DTDefaultOptions) {
            DTDefaultOptions.setLanguageSource('js/plugins/dataTables/language.json');
            DTDefaultOptions.setOption('bFilter', false); // 禁用搜索框
            DTDefaultOptions.setOption('info', false);
            DTDefaultOptions.setOption('autoWidth', false);
            DTDefaultOptions.setOption('pagingType', 'full_numbers');
            DTDefaultOptions.setOption("lengthMenu", [10, 20, 30, 40]);
        });
})(angular);

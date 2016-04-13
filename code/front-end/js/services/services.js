'use strict';

angular.module('koginity').service('productService', function($http) {
    var productService = {};

    productService.data = {};

    //Gets the list of products
    productService.getList = function() {
        $http.get('data/products.json')
            .success(function(data) {
                ProductService.data = data;
            });

        return ProductService.data;
    };
    return productService;
});
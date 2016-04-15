'use strict';

angular.module('koginity').service('productService', function($timeout, $http) {
    var productService = {
        getList: function() {
            return $timeout(function() {
                return $http.get('http://localhost/products.json').then(function(response) {
                    return response.data;
                });
            }, 30);
        }
    }
    
    return productService;
    
});
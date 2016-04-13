'use strict';

angular.module('koginity')
  .controller('ProductListController',function(productService) {
    var products = productService.getList();
  });
'use strict';

angular.module('koginity')
  .controller('ProductListController',function($q, $scope, productService) {

  	$scope.orderByField = 'price';
  	$scope.reverseSort = false;
	$scope.layoutSize = 'medium';
	$scope.orderByFields = ['price', 'title'];

  	$scope.changeLayout = function(size){
  		$scope.layoutSize  = size;
  	};

    productService.getList().then(function(data) {
    	$scope.products = data;
	});


     $scope.modalShown = false;
	 $scope.toggleModal = function() {
	 	$scope.modalShown = !$scope.modalShown;
	 };
  });
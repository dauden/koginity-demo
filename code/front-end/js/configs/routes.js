'use strict';

// Setting up route
angular.module('app', ['koginity']).config(['$stateProvider',
	function($stateProvider) {
		// product state routing
		$stateProvider.
		state('list', {
			url: '/',
			templateUrl: 'views/list.view.html'
		}).
		state('detail', {
			url: '/detail',
			templateUrl: 'views/detail.view.html'
		});
	}
]);

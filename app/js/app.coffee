angular.module('app', ['ngRoute']).run ->

	console.log 'RUNNING APP'
	
routes = 
	'/':
		templateUrl:'landing.html'
		controller:'LandingCtrl'
		requireLogin:false
	'/dashboard':
		templateUrl:'dashboard.html'
		controller:'DashboardCtrl'
		requireLogin:true


angular.module('app').config ['$locationProvider', '$routeProvider', '$logProvider', ($locationProvider, $routeProvider, $logProvider) ->

	$locationProvider.html5Mode(false)


	for path,config of routes
		$routeProvider.when(path, config)
]

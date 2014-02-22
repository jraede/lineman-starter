angular.module('app', ['ngRoute']).run ->

	console.log 'RUNNING APP'
	Parse.initialize("EwIQ4Ho6Q2rgIF4TBVEiqeCY3t2bs6Gi0knGrcuQ", "WTsPfdPYFW8L7bI2dZS4LYLk8T1Tuy3bh4mJYGWj")
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

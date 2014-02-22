angular.module('app').controller 'LandingCtrl', ['$scope', '$models', '$auth', ($scope, $models, $auth) ->
	console.log 'loaded controller'

	$auth.login('raede', 'frannie329').then ->
		alert 'You are logged in!'
		console.log $auth.user()
	, (err) ->
		alert 'Login error!'
		console.log err

]
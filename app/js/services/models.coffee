# Service for "active model" for modals and subviews
angular.module('app').factory '$models', [->
	obj = 
		test:Parse.Object.extend('Test')

	return obj
]
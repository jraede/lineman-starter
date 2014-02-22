# Service for "active model" for modals and subviews
angular.module('app').factory '$auth', ['$q', ($q) ->
	obj = 
		signup:(data) ->
			deferred = $q.defer()

			user = new Parse.User()
			for key,val of data
				user.set(key, val)
			user.signUp null,
				success: (user) ->
					deferred.resolve(user)
				error: (user, error) ->
					deferred.reject(error)
			return deferred.promise

		login:(username, password) ->
			deferred = $q.defer()

			Parse.User.logIn username, password,
				success:(user) ->
					deferred.resolve(user)
				error: (user, error) ->
					deferred.reject(error)
			return deferred.promise

		user: ->
			return Parse.User.current()


	return obj
]

module.exports = require(process.env['LINEMAN_MAIN']).config.extend 'files', 
	coffee: 
		app:[

			'app/js/app.coffee', 
			'app/js/services/**/*.coffee',
			'app/js/directives/**/*.coffee',
			'app/js/filters/**/*.coffee',
			'app/js/controllers/**/*.coffee'
		]
	
	js: 
		vendor: [

			
			"vendor/js/**/*.js"
		]
		minified: "dist/js/app.js"
		minifiedWebRelative: "js/app.js"

	# concat:
	# 	js:
	# 		src: ["<%= files.js.vendor %>", "<%= files.ngtemplates.dest %>", "<%= files.coffee.generated %>", "<%= files.js.app %>"]
	css:
		vendor: "vendor/css/**/*.css"
		app: "app/css/main.css"
		concatenated: "generated/css/app.css"
		minified: "dist/css/app.css"
		minifiedWebRelative: "css/app.css"
	less:
		app: "app/css/main.less"
		vendor: [
			"vendor/css/**/*.less"
		]
		generatedApp: "generated/css/app.less.css"
		generatedVendor: "generated/css/vendor.less.css"

	templates:
    	source: "app/templates/**/*.html"

	

# module.exports = (lineman) ->
# 	config:
# 		removeTasks:
#       		common: lineman.config.application.removeTasks.common.concat("jshint")
# 		prependTasks:
# 			common: ["copy:templates"].concat(lineman.config.application.prependTasks.common)
# 			dist:['copy:templatesDist']
# 		copy:
# 			templates:
# 				files: [

# 						expand:true
# 						cwd:'app/templates'
# 						src:['*', '**/*']
# 						dest:'generated/templates/'
# 				]
# 			templatesDist:
# 				files: [

# 						expand:true
# 						cwd:'app/templates'
# 						src:['*', '**/*']
# 						dest:'dist/templates/'
# 				]

# 		watch:
# 			templates:
# 				files: ["app/templates/*", "app/templates/**/*"]
# 				tasks: ["copy:templates"]
# 			less:
# 				files: ["<%= files.less.vendor %>", "app/css/**/*.less"]
# 				tasks: ["less", "concat_sourcemap:css"]
# 				
module.exports = (lineman) ->
	config:
		loadNpmTasks: lineman.config.application.loadNpmTasks.concat("grunt-angular-templates")

		removeTasks:
			common: lineman.config.application.removeTasks.common.concat("handlebars", "jst", "jshint")

		prependTasks:
			common: lineman.config.application.prependTasks.common.concat("ngtemplates")
		concat_sourcemap:
			options:
				sourcesContent: true

			js:
				src: [
					"<%= files.js.vendor %>"
					
					"<%= files.js.app %>"
					"<%= files.coffee.generated %>"
					"<%= files.ngtemplates.dest %>"
				]
				dest: "<%= files.js.concatenated %>"
		ngtemplates:
			app:
				options:
					base: "app/templates"
					url: (url) ->
						return url.replace('app/templates/', '')
			
				src: "app/templates/**/*.html"
				dest: "<%= files.ngtemplates.dest %>"

		watch:
			ngtemplates:
				files: "app/templates/**/*.html",
				tasks: ["ngtemplates", "coffee", "concat_sourcemap:js"]

		files:
			ngtemplates:
				dest: "generated/angular/template-cache.js"
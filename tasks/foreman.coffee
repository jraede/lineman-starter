fs = require 'fs'

module.exports = (grunt) ->
	_ = grunt.util._
	grunt.loadNpmTasks('grunt-exec')

	grunt.config.set 'exec.foreman', 
		cmd:'foreman start'
	grunt.registerTask 'foreman', ->

		# Load environment variables from .env like foreman would
		if fs.existsSync('.env')
			data = fs.readFileSync('.env').toString()
			lines = data.split(/\n/)
			for line in lines
				if line.length
					config = line.split('=')
					process.env[config[0]] = config[1]


		require '../server'

		

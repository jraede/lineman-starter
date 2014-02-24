express = require 'express'
app = express()
if 'development' is app.get('env') or 'test' is app.get('env')
	app.use(express.errorHandler())
	app.use(express.logger('dev'))
else
	console.log = ->
		return

PORT = 8000

app.configure 
app.set('port', PORT)
app.use(express.favicon())
app.use(express.bodyParser())

app.use(express.methodOverride())
app.use(express.cookieParser())

localPath = require('fs').realpathSync('')

publicPath = if app.get('env') is 'development' then localPath + '/generated/' else localPath + '/dist/'


# Send static files from either dist or generate
if app.get('env') is 'development'
	
	app.get '/', (req, res) ->
		res.sendfile 'generated/index.html'

else
	app.get '/', (req, res) ->
		res.sendfile 'dist/index.html'


app.use(express.static(publicPath))

app.listen PORT, ->
	console.log 'Express server listening on port ' + app.get('port')

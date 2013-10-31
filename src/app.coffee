
###
 # Module dependencies.
###

express = require('express');
routes = require('./../routes');
http = require('http');
path = require('path');
BeGlobal = require('node-beglobal');

app = express();

# all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/../views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, '../public')));

#initialize the BeGlobal API
beglobal = new BeGlobal.BeglobalAPI({
	api_token: '%2FxBNOQ97cfhhUBCDYpVq0A%3D%3D'
});

# development only
if ('development' == app.get('env'))
	app.use(express.errorHandler());


app.get('/', routes.index);
app.get '/quiz', (req, res) -> 
	return res.render('quiz', {
		title: 'Quiz'
	});
app.get '/progress', (req, res) ->

	return res.render('progress', {
		title: 'Progress'
	});

app.post '/translate', (req, res) ->
	data = req.body


	console.log('clicked')
	if (data.errorCode)
		data.text = "Please Enter Text for Translation"

	beglobal.translations.translate data, (err, results) ->
		if (err)
			return console.log(err);

		res.send({serverData: results})
		return

	##############GET ERROR MESSAGE TO READ!!!!

	


	return


http.createServer(app).listen app.get('port'), () ->
	console.log('Express server listening on port ' + app.get('port'));


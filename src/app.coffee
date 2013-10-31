
###
 # Module dependencies.
###

express = require('express');
routes = require('./../routes');
user = require('./../routes/user');
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

# development only
if ('development' == app.get('env'))
	app.use(express.errorHandler());


app.get('/', routes.index);
app.get('/users', user.list);


app.post '/translate', (req, res) ->
	data = {text: req.body['translate-text'], from: 'eng', to: 'fra'}


	console.log('clicked')
	if (data.text == "")
		data.text = "Please Enter Text for Translation"

	beglobal.translations.translate data, (err, results) ->
		if (err)
			return console.log(err);

		res.send({serverData: results})
		return


	


	return

#initialize the BeGlobal API
beglobal = new BeGlobal.BeglobalAPI({
	api_token: '%2FxBNOQ97cfhhUBCDYpVq0A%3D%3D'
});


http.createServer(app).listen app.get('port'), () ->
	console.log('Express server listening on port ' + app.get('port'));


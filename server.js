var express = require('express'),
    employees = require('./routes/employees'),
    path = require('path'),
    app = express();

var serveStatic = require('serve-static')
app.use(express.static(path.join(__dirname, 'www')));
app.use('/' + process.env['NODE_ENV'], serveStatic('www'));
// CORS (Cross-Origin Resource Sharing) headers to support Cross-site HTTP requests
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next();
});

app.get('/' + process.env['NODE_ENV'] + '/employees', employees.findAll);
app.get('/' + process.env['NODE_ENV'] + '/employees/:id', employees.findById);
app.get('/' + process.env['NODE_ENV'] + '/employees/:id/reports', employees.findReports);

app.set('port', process.env.PORT || 5000);

app.listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
});

exports.app = app;

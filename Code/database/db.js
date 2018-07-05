var DbConfig = require('./dbconfig');
var mysql = require('mysql');

var connection = mysql.createConnection(DbConfig);
connection.connect(function(err){
    if(err)
    {
         console.log('error while connecting to mysql!');
         throw err;
    }
});

module.exports = connection;

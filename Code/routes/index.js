var express = require('express');
var router = express.Router();
var mysql = require('mysql');

var path = require('path');
//router.use('/images', express.static('images'));


router.get(['/', '/index'], function (req, res) {

    req.app.locals.PageName = 'index';
    var MoviesList = null;

    //get the whole movies list from the database
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'admin',
        database: 'moviesheep'
    });

    connection.connect(function (err) {
        if (err)
            console.log('error @' + err);
        console.log('connected to mysql');

        console.log(req.url);
        console.log('executing select query');
        connection.query("select m.id as movie_id,m.Certificate,m.Language,m.name as movie_name,m.duration_in_min,m.cast_and_crew,m.description,m.image_path,t.id as theatre_id,t.name as theatre_name,t.address,t.zipcode,t.price,t.seating_capacity,t.runningmovie_id from theatres t inner join movies m where t.runningmovie_id = m.id", function (err, result, feilds) {
            if (err)
                throw err;
            console.log(result.length);

                res.render('index', {
                    Movies: result
                });
        });
        connection.end();
    });
    //res.render(path.resolve(__dirname+'/../index.ejs'));
    //console.log(MoviesList);

});

module.exports = router;
var express = require('express');
var router = express.Router();
var db = require('../database/db');

router.get('/Search', function (req, res) {
    console.log('searching for movie :' + req.query.MovieName);

    var searchMovieName = req.query.MovieName;
    var searchQuery = "select m.id as movie_id,m.Certificate,m.Language,m.name as movie_name,m.duration_in_min,m.cast_and_crew,m.description,m.image_path,t.id as theatre_id,t.name as theatre_name,t.address,t.zipcode,t.price,t.seating_capacity,t.runningmovie_id from theatres t inner join movies m where t.runningmovie_id = m.id and m.name like '%" + searchMovieName + "%'";
    db.query(searchQuery, function (err, result) {
        if (err) {
            console.log('Error while running the SELECT Query!');
            throw err;
        }

        console.clear();
        console.log(result);
        res.render('index', {
            Movies: result
        });
    });

});

module.exports = router;
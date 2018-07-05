var mysql = require('mysql');
var express = require('express');
var router = express.Router();
var db = require('../database/db');

//following route will handle urls like => www.mywebsite.com/MovieDetails?23
router.get('/BookingDetails', function (req, res) {
    var movieId = req.url.id;
    var getMovieDetailsQuery = "select m.Rating,m.id as movie_id,m.Certificate,m.Language,m.name as movie_name,m.duration_in_min,m.cast_and_crew,m.description,m.image_path,t.id as theatre_id,t.name as theatre_name,t.address,t.zipcode,t.price,t.seating_capacity,t.runningmovie_id from theatres t inner join movies m where t.runningmovie_id = m.id and t.runningmovie_id="+req.query.id;
    db.query(getMovieDetailsQuery, function (err, result) {
        if (err) {
            console.log('Error while running the SELECT Query!');
            throw err;
        }
        if (result.length > 0) {
            console.log(result);
            res.render('MovieDetails',{
                MovieDetails : result
            });
        }
    });
});

//following route will handle urls like => www.mywebsite.com/MovieDetails/23
//router.get('/MovieDetails/:id',function(req,res){
//    res.send('prepapring response for movie id : '+req.params.id);
//});

module.exports = router;
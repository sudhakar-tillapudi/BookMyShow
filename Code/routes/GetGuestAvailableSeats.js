var mysql = require('mysql');
var express = require('express');
var router = express.Router();
var db = require('../database/db');

//following route will handle urls like => www.mywebsite.com/MovieDetails?23
router.get('/GetGuestAvailableSeats', function (req, res) {
    var movieId = req.query.movieId;
    console.log(req.query);
    var getSeatsAvailabilityQuery = "select (select t.seating_capacity from theatres t where runningmovie_id = "+movieId+") - (select COALESCE(sum(g.totalSeats),0) from guestbookinghistory g inner join movies m inner join theatres t where g.movieId= m.id and t.runningmovie_id = "+movieId+" and g.movieId = "+movieId+" and g.BookingDate = '"+req.query.BookingDate+"' and g.isCancelled = 0) as availableSeats";
    console.log(getSeatsAvailabilityQuery);
    db.query(getSeatsAvailabilityQuery, function (err, result) {
        if (err) {
            console.log('Error while running the SELECT Query!');
            throw err;
        }
        if (result.length > 0) {
            console.log(result);
            res.json({
                SeatsAvailable : result[0].availableSeats
            });
        }
    });
});

//following route will handle urls like => www.mywebsite.com/MovieDetails/23
//router.get('/MovieDetails/:id',function(req,res){
//    res.send('prepapring response for movie id : '+req.params.id);
//});

module.exports = router;
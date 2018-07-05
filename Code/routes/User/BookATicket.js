var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var path = require('path');
var db = require('../../database/db');
router.get('/User/BookATicket', function (req, res) {
    req.app.locals.PageName = 'BookATicket';
    var MoviesList = null;
    console.log('executing select query');
    db.query("select m.id as movie_id,m.Certificate,m.Language,m.name as movie_name,m.duration_in_min,m.cast_and_crew,m.description,m.image_path,t.id as theatre_id,t.name as theatre_name,t.address,t.zipcode,t.price,t.seating_capacity,t.runningmovie_id from theatres t inner join movies m where t.runningmovie_id = m.id", function (err, result, feilds) {
        if (err)
            throw err;
        console.log(result.length);

        res.render('User/BookATicket', {
            Movies: result
        });
    });
});

module.exports = router;
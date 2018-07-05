//import all required modules
var mysql = require('mysql');
var express = require('express');
var db = require('../database/db');
var dateTime = require('node-datetime');

//create a miniapp (router) to configure the incoming requests to handle seperatly
var miniapp = express.Router();

miniapp.post('/BookMyTicket', function (req, res) {
    var RupeeSymbol = '/- Rs';
    req.app.locals.PageName = 'index';
    //Step 1: subtract the total seats from seating_capacity
    var emailId = req.body.txtEmailId;

    var movieName = req.body.movieName;
    var language = req.body.language;
    var theatreName = req.body.theatreName;
    var address = req.body.address;
    var imagePath = req.body.imagePath;

    var showTime = req.body.selShow;
    var bookingDate = req.body.dtBookingDate;
    var totalTickets = req.body.txtTicketsCount;
    var totalFare = req.body.txtTotalFare.replace(RupeeSymbol, '');
    console.log('total : ' + totalFare);
    var theatreId = req.body.theatreId;
    var movieId = req.body.movieId;
    var movieName = req.body.movieName;
    var booking_Time = dateTime.create();
    booking_Time = booking_Time.format('m-d-Y H:M');


    //bookingDate comes in YYYY-MM-DD format from html5 datetime controller asper ISO format
    //but we are storing date in DB as MM-dd-YYYY as per our own format, so we need to convert here
    var month = bookingDate.substring(5,7);
    var dt = bookingDate.substring(8,10);
    var year = bookingDate.substring(0,4);
    var bookingDateCustom = month +'-'+ dt +'-'+ year;
    var bookingData = {
        emailid: emailId,
        movieid: movieId,
        BookingTime: booking_Time,
        BookingShow: showTime,
        BookingDate: bookingDateCustom,
        TotalSeats: totalTickets,
        TotalFare: totalFare,
        isCancelled: 0
    };

    //Step 1: create an entry in the guestbookinghistory table
    var insertQuery = "insert into guestbookinghistory set ?";
    db.query(insertQuery, bookingData, function (err, result) {
        if (err)
            throw err;
        //console.log(result);
        if (result.affectedRows > 0) {
            var displayDate = new Date(parseInt(year),parseInt(month)-1,parseInt(dt));
            var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            res.render('../views/BookingConfirmation', {
                MovieName: movieName,
                Language: language,
                TheatreName: theatreName,
                TheatreAddress: address,
                ShowDate: displayDate.toLocaleDateString("en-US", options),
                ShowTime: showTime,
                TotalTickets: totalTickets,
                TotalFare: totalFare,
                ImagePath: imagePath
            });
        }
    });
});
module.exports = miniapp;


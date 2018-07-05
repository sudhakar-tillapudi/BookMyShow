//import all required modules
var mysql = require('mysql');
var express = require('express');
var db = require('../database/db');
var date = require('node-datetime');

//create a miniapp (router) to configure the incoming requests to handle seperatly
var miniapp = express.Router();

miniapp.get('/CancelTicket', function (req, res) {
    req.app.locals.PageName = 'CancelTicket';
    var emailId = req.query.EmailId;
    var myTickets = [];
    var today = date.create();
    
    var today1 = parseInt(today.format('m'))+"-"+parseInt(today.format('d'))+"-"+parseInt(today.format('Y'));
    console.log('today1'+today1);
    var dbDate = new Date();
    db.query("select g.TicketId,g.isCancelled,g.BookingTime BookingTime,g.BookingDate ShowDate,g.BookingShow ShowTime, g.TotalSeats TotalTickets,g.TotalFare TotalFare, m.id as movie_id,m.Certificate,m.Language,m.name as movie_name,m.duration_in_min,m.cast_and_crew,m.description,m.image_path,t.id as theatre_id,t.name as theatre_name,t.address,t.zipcode,t.price,t.seating_capacity,t.runningmovie_id from theatres t inner join movies m inner join guestbookinghistory g where t.id=m.id and g.movieId = m.id and g.isCancelled=0 and g.emailId = '" + emailId + "' order by STR_TO_DATE(BookingDate, '%m-%d-%Y') desc", function (err, result, feilds) {
        if (err)
            throw err;

        today1 = new Date(parseInt(today1.substring(6, 10)), parseInt(parseInt(today1.substring(0, 2)-1), parseInt(parseInt(today1.substring(3, 5)))));
        for (var i = 0; i < result.length; i++) {
            var dt = result[i].ShowDate;
            console.log(dt.substring(6, 10));
            console.log(dt.substring(0, 2)-1);
            console.log(dt.substring(3,5));
            dbDate = new Date(parseInt(dt.substring(6, 10)), parseInt(parseInt(dt.substring(0, 2)-1), parseInt(parseInt(dt.substring(3, 5)))));
            console.log(' dbdate : ' + dbDate);
            console.log(' today : ' + today1);

            var bookingDate =result[i].BookingTime;
            var displayDate = new Date(parseInt(dt.substring(6,10)),parseInt(dt.substring(0,2))-1,parseInt(dt.substring(3,5)));
            var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            var displayBookingDate = new Date(parseInt(bookingDate.substring(6,10)),parseInt(bookingDate.substring(0,2))-1,
            parseInt(bookingDate.substring(3,5)));
            
            myTickets.push({
                TicketId : result[i].TicketId,
                MovieName: result[i].movie_name,
                Language: result[i].Language,
                TheatreName: result[i].theatre_name,
                TheatreAddress: result[i].address,
                ShowDate: displayDate.toLocaleDateString("en-US",options),
                ShowTime: result[i].ShowTime,
                TotalTickets: result[i].TotalTickets,
                TotalFare: result[i].TotalFare,
                ImagePath: result[i].image_path,
                BookingDate: displayBookingDate.toLocaleDateString("en-US",options),
                IsCancelled: result[i].isCancelled == 0 ? 'No' : 'Yes'
            });
        };


        res.render('../views/CancelTicket', {
            MyTickets: myTickets,
            EmailId: emailId
        });
    });
});

module.exports = miniapp;

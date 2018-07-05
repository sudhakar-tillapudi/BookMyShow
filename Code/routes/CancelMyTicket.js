//import all required modules
var mysql = require('mysql');
var express = require('express');
var db = require('../database/db');

//create a miniapp (router) to configure the incoming requests to handle seperatly
var miniapp = express.Router();

miniapp.post('/CancelMyTicket', function (req, res) {
    //console.log(req.body.split[0]);
    var ticketId = req.body.TicketId;
    console.log('ticketid : '+ticketId);
    req.app.locals.PageName = 'CancelTicket';
    var updateQuery = "update guestbookinghistory set isCancelled=1 where TicketId=" + ticketId;
    console.log(updateQuery);
    db.query(updateQuery, function (err, result, feilds) {
        if (err)
            throw err;
        res.redirect('/CancelTicket');
    });
});

module.exports = miniapp;

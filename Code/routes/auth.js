var express = require('express');
var router = express.Router();
var passportGoogle = require('./auth/google');

router.get('/login', function(req, res, next) {
  req.app.locals.PageName = 'login';
  res.render('login', { title: 'Please Sign In with:' });
});

/* GOOGLE ROUTER */
router.get('/google',
  passportGoogle.authenticate('google', { scope: 'https://www.google.com/m8/feeds' }));

router.get('/google/callback',
  passportGoogle.authenticate('google', { failureRedirect: '/login' }),
  function(req, res) {
    res.redirect('/');
  });

  module.exports = router;

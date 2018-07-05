var passport = require('passport');
var GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;
//var User = require('../models/User');

passport.use(new GoogleStrategy({
    clientID: "961920969142-1isq5m20ije4blga9moslprgtaif8ite.apps.googleusercontent.com",
    clientSecret: "rEYTvdawAR7J07SOznUeyP1q",
    callbackURL: "http://127.0.0.1:3000/auth/google/callback"
  },
  //save following data in mysql instead of mongose
   function(accessToken, refreshToken, profile, done) {
       //User.findOrCreate({ userid: profile.id }, { name: profile.displayName,userid: profile.id }, function (err, user) {
        //  return done(err, user);
       // });
   }
));

module.exports = passport;
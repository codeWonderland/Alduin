var express = require('express');
var router = express.Router();
var mysql = require('mysql');

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('creators/index', { title: 'Creators' });
});

// GET all creators
router.get('/getCreators', function(req, res, next) {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "AlduinDB"
    });
    
    con.connect(function(err) {
        if (err) throw err;
        con.query("SELECT DisplayName, _Id FROM User", function (err, result, fields) {
            if (err) throw err;
            res.send(result);
        });
    });
});

// GET Specific Creator AND Render their Page
router.get('/:id', function(req, res, next) {
    var userToFetch = req.params.id;
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "AlduinDB"
    });
    
    con.connect(function(err) {
        if (err) throw err;
        con.query("select DisplayName, City, PrimaryGame, SecondaryGame, Bio, LastLoggedIn, ProfilePicture from User where _Id='" + userToFetch + "'", function (err, result, fields) {
            if (err) throw err;
            res.render('creators/profile', { user: result});
        });
    });
});

module.exports = router;
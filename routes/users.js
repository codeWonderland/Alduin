var express = require('express');
var router = express.Router();
var mysql = require('mysql');

///* GET users listing. */
//router.get('/', function(req, res, next) {
//    res.render('users/index', { title: '' });
//});

// POST new user
// todo: Next Steps:
// - On client side we should be encrypting sensitive information locally
// - Then on the server side we decrypt it
// - This way packet sniffing will prove ineffective and will add a layer of security
// - My suggestion would be to translate the password to binary and use XOR encryption
// - We should also check to see if there is already a person with this username in our database
// - Furthermore we should be adding the user's mac address to their profile as well as their email
router.post('/addUser', function(req, res, next) {
    var UserName = req.body.UserName;
    var Password = req.body.Password;
    var DisplayName = req.body.DisplayName;
    var DOB = req.body.DOB;
    var City = req.body.City;
    var PrimaryGame = req.body.PrimaryGame;
    var SecondaryGame = req.body.SecondaryGame;
    var Bio = req.body.Bio;
    var LastLoggedIn = req.body.LastLoggedIn;
    var ProfilePicture = req.body.ProfilePicture; //This will be the filename of the profile picture that will exhist in /images/avatars
    var Email = req.body.Email;
    if (!((UserName === null || UserName === '') || (Password === null || Password === '') || DOB === null || LastLoggedIn === null || Email === null)) {
        if (DisplayName === null)
            DisplayName = UserName;
        if (City === null)
            City = '';
        if (PrimaryGame === null)
            PrimaryGame = '';
        if (SecondaryGame === null)
            SecondaryGame = '';
        if (Bio === null)
            Bio = '';
        if (ProfilePicture === null || ProfilePicture === '')
            ProfilePicture = 'images/avatars/default.png';
        
        if (typeof(UserName) === 'string' && typeof(Password) === 'string' && typeof(DisplayName) === 'string' && typeof(DOB) === 'number' && typeof(City) === 'string' && typeof(PrimaryGame) === 'string' && typeof(SecondaryGame) === 'string' && typeof(Bio) === 'string' && typeof(LastLoggedIn) === 'number' && typeof(ProfilePicture) === 'string') {
            var con = mysql.createConnection({
                host: "localhost",
                user: "root",
                password: "password",
                database: "AlduinDB"
            });
            
            con.connect(function(err) {
                if (err) throw err;
                var sql = 'INSERT INTO User (UserName, Password, DisplayName, DOB, City, PrimaryGame, SecondaryGame, Bio, LastLoggedIn, ProfilePicture, Email) VALUES (\'' +
                    UserName + '\', \'' + Password + '\', \'' + DisplayName + '\', ' + DOB + ', \'' + City + '\', \'' + PrimaryGame + '\', \'' + SecondaryGame + '\', \'' + Bio + '\', ' + LastLoggedIn + ', \'' + ProfilePicture + '\', \'' + Email + '\')';
                console.log(sql);
                con.query(sql, function (err, result) {
                    if (err) throw err;
                    else console.log("1 record inserted");
                });
            });
        }
    }
    res.send('OK')
});

// GET all users
router.get('/getUsers', function(req, res, next) {
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

// GET all usernames
// Would be used mainly to compare upon account creation to stop
// multiple people from having the same username
router.get('/getUsernames', function(req, res, next) {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "AlduinDB"
    });
    
    con.connect(function(err) {
        if (err) throw err;
        con.query("SELECT UserName FROM User", function (err, result, fields) {
            if (err) throw err;
            res.send(result);
        });
    });
});

// GET all emails
// Would be used mainly to compare upon account creation to stop
// multiple people from having the same email
router.get('/getEmails', function(req, res, next) {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "AlduinDB"
    });
    
    con.connect(function(err) {
        if (err) throw err;
        con.query("SELECT Email FROM User", function (err, result, fields) {
            if (err) throw err;
            res.send(result);
        });
    });
});

// todo: GET logged in state
// Would be used mainly to maintain a logged in state
router.get('/getLoggedInState', function(req, res, next) {
    var username = req.body.UserName;
    var macAddress = req.body.macAddress;
    var currentTime = req.body.currentTime;
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "AlduinDB"
    });
    
    // here we want to check the macAddress against the most recent mac address used in the database,
    // this will be changed every time the user logs in on a new computer
    // if it matches we want to return false to the user
    // we also want to check to see that the last logged in time was less than 5 minutes previous
    con.connect(function(err) {
        if (err) throw err;
        con.query("SELECT MAC FROM User WHERE UserName='" + username + "'", function (err, result, fields) {
            if (err) throw err;
            res.send(result);
        });
    });
});

// GET Specific User AND Render their Page
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
            res.render('users/profile', { user: result});
        });
    });
});

// GET Specific User AND return data to the requester
router.get('/userInfo/:id', function(req, res, next) {
    var userToFetch = req.params.id;
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

// TODO: DELETE user
// We want the id of the user to be deleted in the params
// And the authentication to exist in the request body
// For the record we could do all of this in a post request instead, but this makes things cleaner
// Because in theory we could overload routes like this, we could have a get request to deletUser/:id that gets
// The date that the user was deleted, etc., etc.
router.delete('/deleteUser/:id', function(req, res, next) {
    var userToDelete = req.params.id;
    var UserName = req.body.UserName;
    var Password = req.body.Password;
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "AlduinDB"
    });
    
    con.connect(function(err) {
        if (err) throw err;
        // You can make as many queries inside of con.connect as you wish
        // I suggest seeing if the username and password match the admin
        // account or the user who is trying to delete themselves
        var sql = '';
        con.query(sql, function (err, result, fields) {
            if (err) throw err;
            // remember, only res.send() the information that you want to go back to the client
            // I would say that you could return the result to a variable that you parse through
            // then if the authentication succeeds, send a second query that deletes the user
            res.send(result);
        });
    });
});

// TODO: Update User is almost identical to DELETE user
router.put('/updateUser/:id', function (req, res, next) {
    var userToDelete = req.params.id;
    var UserName = req.body.UserName;
    var Password = req.body.Password;
    var Changes = req.body.Changes; // this should be a json object nested inside of the outer json object that is the req body
    
    con.connect(function(err) {
        if (err) throw err;
        var sql = '';
        con.query(sql, function (err, result, fields) {
            if (err) throw err;
            res.send(result.affectedRows + " record(s) updated");
        });
    });
});

function decrypt(message) {
    var values = message.split(' ');
    var key = values[values.length - 1];
    var output = [];
    for(var i = 0; i < values.length - 1; i++) {
        var enc = values[i] ^ key;
        output.push(('00000000' + enc).slice(-8));
    }
    output.push(key);
    return binToText(output.join(' '));
}

function binToText(str) {
    return str.split(' ').reduce(function(x, y){
        x.push(String.fromCharCode(parseInt(y, 2)));
        return x;
    }, []).join('');
}

module.exports = router;

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('art/index', { title: 'Art',  message: 'hello world' });
});

module.exports = router;
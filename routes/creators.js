var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('creators/index', { title: 'Creators' });
});

module.exports = router;
const express = require('express');
const router = express.Router();
const akaController = require('./../controllers/akaController');

router.route('/').get(akaController.getAllData);
router.route('/get-favorite').get(akaController.getFavotiteData);

module.exports = router;
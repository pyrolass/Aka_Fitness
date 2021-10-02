const express = require('express');
const router = express.Router();
const akaController = require('./../controllers/akaController');


router.route('/get-favorite').get(akaController.getFavotiteData);
router.route('/:workout').get(akaController.getWorkout);
router.route('/').get(akaController.getAllData);

module.exports = router;
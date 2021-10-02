const mongoose = require('mongoose');

const akaSchema = new mongoose.Schema({
    workouts: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    data: [{
        title: String,
        isFavorite: Boolean
    }]
})

const AKA = mongoose.model('workouts', akaSchema);
//workouts is the collection name!

module.exports = AKA;
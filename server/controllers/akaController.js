const Aka = require('./../models/akaModel');
const { query } = require('express');
const AKA = require('./../models/akaModel');


exports.getAllData = async (req, res) => {
    try {
        const aka = await Aka.find();
        res.json({
            lenght: aka.length,
            data: aka
        });
    }
    catch (err) {
        res.json({
            status: err
        });
    }
}

exports.getWorkout = async (req, res) => {
    try {
        const aka = await Aka.aggregate([
            {
                $match: {
                    workout: req.params.workout
                },
            }
        ])
        res.json({
            lenght: aka.length,
            meta: aka
        });
    }
    catch (err) {
        res.json({
            status: err
        });
    }
}

exports.getFavotiteData = async (req, res) => {
    try {
        let aka = await Aka.find(
        )
        var data = [];

        aka.forEach(el => data.push(el.data.find(ele => ele.isFavorite == true)));
        data = data.filter(a => a);

        res.json({
            lenght: aka.length,
            data: data
        })
    }
    catch (err) {
        res.json({
            status: err
        });
    }
}


const express = require('express');
const app = express();
const morgan = require('morgan');
const akaRouter = require('./routes/akaRoutes');

app.use(morgan('dev'));
app.use(express.json());
app.use('/api/v1/aka', akaRouter);

module.exports = app;
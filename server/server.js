const app = require('./app');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
dotenv.config({ path: './config.env' });

const db = process.env.DATABASE;
const port = process.env.PORT || 3000;

mongoose.connect(db, {
    useUnifiedTopology: true
}).then((con) => {
    // console.log(con.connections);
});

app.listen(port, () => {
    console.log('running')
})
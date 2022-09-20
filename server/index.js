// package imports
const express = require('express');
const mongoose = require('mongoose');
const http = require('http');

// project imports
const authRouter = require('./routes/auth');


// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = 'mongodb+srv://admin:admin@cluster0.atgq92g.mongodb.net/?retryWrites=true&w=majority';

//  middleware
app.use(express.json());
app.use(authRouter);

// connections
mongoose.connect(DB)
    .then(() => {
        console.log("DB connection Successfull");
    })
    .catch((e) => {
        console.log(e)
    });

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is running on port ${PORT}`);
})


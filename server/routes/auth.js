const e = require('express');
const express = require('express');
const bcryptjs = require('bcryptjs');

const User = require('../models/user');

const authRouter = express.Router();


// SIGN UP
authRouter.post('/api/signup', async (req, res) => {

    try {
        // get data from client
        const { name, email, password } = req.body;

        // save to db
        const excistingUser = await User.findOne({ email }); // search by field
        if (excistingUser) {
            return res.status(400).json({ msg: "User with same email already excits" })
        }
        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            name,
            email,
            password : hashedPassword,
        });

        user = await user.save(); // update to DB

        // return data to user
        return res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = authRouter;
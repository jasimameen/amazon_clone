const express = require('express');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

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
            password: hashedPassword,
        });

        user = await user.save(); // update to DB

        // return data to user
        return res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// SIGN IN
authRouter.post('/api/signin', async (req, res) => {

    try {
        // get data from client
        const { email, password } = req.body;

        // find user
        const user = await User.findOne({ email });

        if (!user) return res.status(400).json({ msg: "No User Found!" });

        const isValidPassword = await bcryptjs.compare(password, user.password);

        if (!isValidPassword) return res.status(400).json({ msg: 'Login Credentials does not Match' })

        const token = jwt.sign({ id: user._id }, "passwordKey");

        res.json({ token, ...user._doc });

    } catch (error) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;
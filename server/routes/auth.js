const express = require('express');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

const User = require('../models/user');
const auth = require('../middlewares/auth');

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

authRouter.post('/api/token/verify', async (req, res) => {
    try {

        // get the token from headers
        const token = req.header('x-auth-token');
        if (!token) return res.json(false); // token is empty


        // checks is token is valid or not
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) res.json(false); // not a valid token

        // 
        // may be token be a random by hacker
        // verify user signed with the jwt token excits
        const user = await User.findById(verified.id);
        if (!user) return res.json(false); // no user fount

        // verified user
        res.json(true); 


    } catch (error) {
        res.status(500).json({ error: error.message });eo
    }
});

// GET user Data
authRouter.get('/user', auth, async(req, res) => {
    try {
        const user = await User.findById(req.user);
        res.json({...user._doc, token: req.token});

    } catch (err) {
        res.status(500).json({error: err.message});
    }
}) ;

module.exports = authRouter;
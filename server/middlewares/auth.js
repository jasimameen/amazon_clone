const jwt = require('jsonwebtoken');

const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.status(401).json({msg: "No Auth token, Access Denied!!"});

        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.status(401).json({msg: "User Not Authorized!"});
    
        req.user = verified.id;
        req.token = token;
        
        // callback fuction
        next();

    } catch (err) {
        res.status(500).json({error: err.message})
    }
 }

module.exports = auth;
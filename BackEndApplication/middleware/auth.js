const jwt = require('jsonwebtoken');

function auth(req, res, next){
    // check weather there exist a jwt token
    const token = req.header('x-auth-token');
    if(!token) return res.status(401).send('Access denied. No token provided');

    // validating signature
    try {
        const decoded = jwt.verify(token, 'smartLocker_jwtPrivateKey');
        req.fromUser = decoded;
        next();
    } catch (error) {
        res.status(400).send('Invalid Token');
    }    
}

module.exports = auth;
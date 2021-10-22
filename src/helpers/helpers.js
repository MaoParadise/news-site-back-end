const bcrypt = require('bcryptjs')

const helpers = {};

helpers.encryptPassword = async (password) =>{
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(password, salt);
    return hash;
};


helpers.matchPassword = async (password, savedPassword) =>{
    try{
        return await bcrypt.compare(password, savedPassword);
    } catch(e){
        console.log(e);
    }
};

helpers.isAuthenticated = (req, res, next) =>{
    if(req.isAuthenticated()){
        return next();
    }
    return res.json({
        status : 'Not Logged',
        success : false
    })
}



module.exports = helpers;
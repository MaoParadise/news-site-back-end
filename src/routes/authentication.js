const express = require('express');
const router = express.Router();
const passport = require('passport');

const {isLoggedIn} = require('../helpers/auth');

const pool = require('../database');

router.get('/signup', (req, res) => {
    res.json({
        status : 'SIGNUP',
        success : false
    });
})

/* router.post('/signup', passport.authenticate('local.signup', {
    successRedirect: '/api/auth/profile/'+req.body.username,
    failureRedirect: '/api/auth/signup'
})) */

router.post('/signup', (req, res, next) =>{
    passport.authenticate('local.signup', {
        successRedirect: '/api/auth/profile/'+req.body.username,
        failureRedirect: '/api/auth/signup'
    })(req, res, next);  
});
 


router.get('/signin', (req, res) => {
    return res.json({
        status : 'Not Logged',
        success : false
    });  
});


router.post('/signin', (req, res, next) =>{
    console.log(req.body);
    passport.authenticate('local.signin', {
        successRedirect: '/api/auth/profile/'+req.body.username,
        failureRedirect: '/api/auth/signin'
    })(req, res, next);  
});

router.get('/profile/:username', async (req, res) => {
    const { username } = req.params;
    const rows =  await pool.query(`SELECT * FROM helper WHERE USERNAMEHELPER = '${username}'`);
    if(rows.length > 0){
        return res.json({
            status : 'Profile',
            success : true,
            _bodyInfo: {
                _crtU: rows[0].USERNAMEHELPER,
                _crtTp: rows[0].IDHELPERTYPE,
                _email: rows[0].EMAILHELPER,
                _crtNm: rows[0].NAMEHELPER,
                _crtLNm: rows[0].LASTNAMEHELPER
            }
        }); 
    }else{
        return res.json({
            status : `Not Logged`,
            success : false
        });
    }

    
})

router.get('/logout', (req, res) =>{
    req.logOut();
    return res.json({
        status : 'Not Logged',
        success : false
    });  
})




module.exports = router;
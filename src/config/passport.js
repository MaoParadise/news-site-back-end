const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../helpers/helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) =>{
    const rows =  await pool.query(`SELECT * FROM helper WHERE USERNAMEHELPER = '${username}'`);
    if(rows.length > 0){
        const user = rows[0];
        const validPassword = await helpers.matchPassword(password, user.PASSWORDHELPER);
        if(validPassword){
            done(null, user)
        } else{
            done(null, false)
        }
    }else{
        return done(null, false)
    }
}));


passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) =>{
    const { name, lastName, email } = req.body;
    const newHelper = {
        USERNAMEHELPER: username, 
        IDHELPERTYPE: 2,
        NAMEHELPER: name,
        LASTNAMEHELPER: lastName,
        EMAILHELPER: email,
        PASSWORDHELPER: password
    }
    newHelper.PASSWORDHELPER = await helpers.encryptPassword(password);
    const result = await pool.query('INSERT INTO helper SET ?', [newHelper]);
    console.log(result);
    return done(null, newHelper);
}));




passport.serializeUser((user, done) =>{ 
    done(null, user.USERNAMEHELPER);
});

passport.deserializeUser( async( id, done ) =>{
    const rows = await pool.query('SELECT * FROM helper WHERE USERNAMEHELPER = ?', [id]);
    done(null, rows[0]); 
})


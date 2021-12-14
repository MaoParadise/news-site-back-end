const express = require('express');
const morgan = require('morgan');
const path = require('path');
const cors = require('cors');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const MYSQLStore = require('express-mysql-session')
const { database } = require('./keys');

// validar si el entorno no es produccion



const passport = require('passport');

//Initializations

const app = express();
require('./config/passport');

// Settings

app.set('port', process.env.PORT || 3000);
app.set('json spaces', 4);

// Middlewares
// app.use(cors({
//     origin: ['http://localhost:8000','http://localhost','http://192.168.8.102','http://192.168.8.102','http://localhost:4200', 'http://127.0.0.1:4200','http://localhost:4210', 'http://127.0.0.1:4210'],
//     credentials: true
// }))
app.use(cors());


app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}));
app.use(express.json()); 

app.use(cookieParser());

app.use(session({
    name: '-tak-id',
    secret: 'BakoParadise57145894',
    resave: false,
    saveUninitialized: false,
    cookie:{
        maxAge: 36000000*10,
        httpOnly: false,
        secure: false
    },
    store: new MYSQLStore(database)
}))



app.use(passport.initialize());
app.use(passport.session());

// Global Variables
app.use((req, res, next) => {
    next();
});

// Routes
app.use(require('./routes/index'));
app.use('/api/auth', require('./routes/authentication'));
app.use('/api/release', require('./routes/releaseRoutes'));

// Public 


// Starting the server
app.listen(app.get('port'), () =>{
    console.log(process.env.HOST);
    console.log(process.env.BDUSER);
    console.log(process.env.PASSWORD);
    console.log(process.env.DATABASE);
    console.log('Server on port', app.get('port'));
});
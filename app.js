const express = require('express');
const morgan = require('morgan');

const participantRouter = require('./routes/participantRoutes');

const app = express();


// middlewares
if (process.env.NODE_ENV === 'development') {
    app.use(morgan('dev'));
}

app.use(express.json());
app.use(express.static(`${__dirname}/public`))

app.use((req, res, next) => {
    req.requestTime = new Date().toISOString();
    next();
})

// routes
app.use('/api/vi/participants', participantRouter);


// start server
module.exports = app;
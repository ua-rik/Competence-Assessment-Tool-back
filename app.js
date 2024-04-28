const express = require('express');

const participantRouter = require('./routes/participantRoutes')

const app = express();


// middlewares
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
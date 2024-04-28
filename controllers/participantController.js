

//
exports.checkID = (req, res, next, val) => {
    console.log(`participant id is: ${val}`);
    if (req.param.id === 'a') {
        return res.status(404).json({
            status: 'fail',
            message: 'Invalid ID'
        });
    }
    next()
}

exports.checkBody = (req, res, next) => {
    if(!req.body.name) {
        return res.status(400).json({
            status: 'fail',
            message: 'Missing participant name'
        })
    }
    next()
}

exports.getAllParticipants = (req, res) => {
    console.log(req.requestTime);

    res.status(200).json({
        status: 'Ok',
        requestedAt: req.requestTime,
        result: 'result'
    })
}

exports.createParticipant = (req, res) => {
    console.log(req.requestTime);

    res.status(200).json({
        status: 'Ok',
        requestedAt: req.requestTime,
        result: 'result'
    })
}
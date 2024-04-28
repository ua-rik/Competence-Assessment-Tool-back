const express = require('express');

const participantController = require('./../controllers/participantController')
const router = express.Router();

// мідлваре тільки якщо присутній параметр в УРЛ
router.param('id', participantController.checkID)

router
    .route('/')
    .get(participantController.getAllParticipants)
    .post(participantController.checkBody,
          participantController.createParticipant);

router
    .route('/:id')
    // .get(participantController.getParticipant)
    // .patch(participantController.updateParticipant)
    // .delete(participantController.deleteParticipant);

module.exports = router;
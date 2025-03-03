const express = require('express');
const { getUserProfile, updatePreferences, loginUser, registerUser } = require('../controllers/userController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/register', registerUser);
router.post('/login', loginUser);
router.get('/profile', authMiddleware, getUserProfile);
router.put('/preferences', authMiddleware, updatePreferences);
// export
module.exports = router;
// module 
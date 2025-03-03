const express = require('express');
const router = express.Router();

// In-memory user storage
const users = [];

router.post('/register', (req, res) => {
  const { name, email, password } = req.body;

  // Check if email already exists
  const userExists = users.find(user => user.email === email);
  if (userExists) {
    return res.status(400).json({ message: 'User already exists' });
  }

  // Create new user
  const newUser = {
    id: users.length + 1,
    name,
    email,
    password,
    profilePicture: 'https://via.placeholder.com/150',
    bio: '',
    preferences: {
      enableNotifications: true,
      anonymousMode: false,
      allowDataSharing: true,
      enableEncryption: true
    }
  };

  users.push(newUser);

  res.status(201).json({
    message: 'User registered successfully',
    user: newUser
  });
});

module.exports = router;

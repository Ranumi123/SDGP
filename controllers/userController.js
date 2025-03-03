const jwt = require('jsonwebtoken');

let users = [
    {
        id: 1,
        name: "John Doe",
        email: "john@example.com",
        password: "password123",
        profilePicture: "https://via.placeholder.com/150",
        bio: "Mental Health Advocate | Lover of Mindfulness",
        preferences: {
            enableNotifications: true,
            anonymousMode: false,
            allowDataSharing: true,
            enableEncryption: true
        }
    }
];

const generateToken = (id) => {
    return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: '1h' });
};

// Register User
exports.registerUser = (req, res) => {
    const { name, email, password } = req.body;
    if (users.find(user => user.email === email)) {
        return res.status(400).json({ message: "User already exists" });
    }
    const newUser = {
        id: users.length + 1,
        name,
        email,
        password,
        profilePicture: "https://via.placeholder.com/150",
        bio: "",
        preferences: {
            enableNotifications: true,
            anonymousMode: false,
            allowDataSharing: true,
            enableEncryption: true
        }
    };
    users.push(newUser);
    res.status(201).json({
        message: "User registered successfully",
        token: generateToken(newUser.id),
        user: newUser
    });
};

// Login User
exports.loginUser = (req, res) => {
    const { email, password } = req.body;
    const user = users.find(user => user.email === email && user.password === password);
    if (!user) {
        return res.status(400).json({ message: "Invalid credentials" });
    }
    res.status(200).json({
        token: generateToken(user.id),
        user
    });
};

// Get User Profile
exports.getUserProfile = (req, res) => {
    const user = users.find(user => user.id === req.user.id);
    if (!user) {
        return res.status(404).json({ message: "User not found" });
    }
    res.status(200).json(user);
};

// Update Preferences
exports.updatePreferences = (req, res) => {
    const user = users.find(user => user.id === req.user.id);
    if (!user) {
        return res.status(404).json({ message: "User not found" });
    }
    user.preferences = { ...user.preferences, ...req.body };
    res.status(200).json({ message: "Preferences updated", preferences: user.preferences });
};

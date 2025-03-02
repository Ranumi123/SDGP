const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Check if the route is correctly set up
app.post("/api/auth/login", (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ msg: "Please provide email and password" });
    }

    if (email === "test@example.com" && password === "password123") {
        return res.json({ msg: "Login successful", token: "fake-jwt-token" });
    } else {
        return res.status(401).json({ msg: "Invalid credentials" });
    }
});

// Start Server
const PORT = 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

// Import required modules
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Dummy user database (for testing purposes)
const users = [];

// Health check route
app.get("/", (req, res) => {
  res.send("Server is running!");
});

// Sign-Up Route
app.post("/api/auth/signup", (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ msg: "Please provide email and password" });
  }

  const userExists = users.find((user) => user.email === email);
  if (userExists) {
    return res.status(400).json({ msg: "User already exists" });
  }

  const newUser = { email, password };
  users.push(newUser);

  res.status(201).json({ msg: "User registered successfully", user: newUser });
});

// Login Route
app.post("/api/auth/login", (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ msg: "Please provide email and password" });
  }

  const user = users.find((user) => user.email === email && user.password === password);

  if (user) {
    res.status(200).json({ msg: "Login successful", token: "fake-jwt-token" });
  } else {
    res.status(401).json({ msg: "Invalid credentials" });
  }
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ msg: "Something went wrong!" });
});

// Start the server
const PORT = process.env.PORT || 5001;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

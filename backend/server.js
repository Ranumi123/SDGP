require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { GoogleGenerativeAI } = require("@google/generative-ai");
const authRoutes = require("./routes/authRoutes");
const profileRoutes = require("./routes/profileRoutes");

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Google Generative AI Setup
const genAI = new GoogleGenerativeAI(process.env.GOOGLE_API_KEY);
const model = genAI.getGenerativeModel({ model: "gemini-2.0-flash" });

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/profile", profileRoutes);

// Health check route
app.get("/", (req, res) => {
  res.send("Server is running!");
});

// Chat route
app.post('/chat', async (req, res) => {
  try {
    const { message } = req.body; // Get message from request

    if (!message) {
      return res.status(400).json({ error: "Message is required" });
    }

    const result = await model.generateContent(message);
    const response = await result.response;
    const text = response.candidates[0]?.content?.parts[0]?.text;

    res.json({ reply: text });
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Internal Server Error" });
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
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { GoogleGenerativeAI } = require("@google/generative-ai");

const app = express();
app.use(cors());
app.use(bodyParser.json());

const genAI = new GoogleGenerativeAI(process.env.GOOGLE_API_KEY);
const model = genAI.getGenerativeModel({ model: "gemini-2.0-flash" });

app.post('/chat', async (req, res) => {
    try {
        const { message } = req.body;  // Get message from request

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

app.listen(5000, () => console.log("Server running on port 5000"));
// require('dotenv').config();
// const express = require('express');
// const cors = require('cors');
// const bodyParser = require('body-parser');
// const { ChatGoogleGenerativeAI } = require("langchain/chat_models/googlegenerativeai");

// const app = express();
// app.use(cors());
// app.use(bodyParser.json());

// // Initialize LangChain with Gemini AI
// const model = new ChatGoogleGenerativeAI({
//     apiKey: process.env.GOOGLE_API_KEY, // Load from .env
//     model: "gemini-2.0-flash",  // Use the correct Gemini model
// });

// app.post('/chat', async (req, res) => {
//     try {
//         const { message } = req.body;
//         const response = await model.call(message);
//         res.json({ reply: response });
//     } catch (error) {
//         res.status(500).json({ error: error.message });
//     }
// });

// app.listen(5000, () => console.log('Server running on port 5000'));

// const { GoogleGenerativeAI } = require("@google/generative-ai");

// const genAI = new GoogleGenerativeAI("AIzaSyAZztqIvyy1K3LXEVBjyV-qcnWY0LK5_Nw");
// const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

// const prompt = "Explain how AI works";

// const result = await model.generateContent(prompt);
// console.log(result.response.text());

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
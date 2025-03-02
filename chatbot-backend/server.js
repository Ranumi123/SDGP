require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Simple AI-like response function
function generateResponse(userMessage) {
    const lowerCaseMessage = userMessage.toLowerCase();
    
    if (lowerCaseMessage.includes('hello') || lowerCaseMessage.includes('hi')) {
        return "Hello! How can I assist you today?";
    } else if (lowerCaseMessage.includes('how are you')) {
        return "I'm just a bot, but I'm here to help!";
    } else if (lowerCaseMessage.includes('help')) {
        return "Sure! Let me know how I can assist you.";
    } else {
        return "I'm a simple chatbot. Try saying 'hello' or 'help'.";
    }
}

// API endpoint to handle chat requests
app.post('/chat', (req, res) => {
    const { message } = req.body;
    
    if (!message) {
        return res.status(400).json({ error: 'Message is required' });
    }

    const botResponse = generateResponse(message);
    res.json({ response: botResponse });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

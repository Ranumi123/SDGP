// Import required modules
const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');

// Load environment variables from .env file into process.env
dotenv.config();
const app = express();

// Initialize the Express application
app.use(cors());
app.use(express.json());

// Enable CORS to allow requests from different origins (useful for API communication)
app.use('/api/users', userRoutes);


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});

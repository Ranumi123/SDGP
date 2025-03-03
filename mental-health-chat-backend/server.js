const express = require("express");
const cors = require("cors");
const messageRoutes = require("./routes/messages");

const app = express();
app.use(cors());
app.use(express.json());

// Routes
app.use("/messages", messageRoutes);

const PORT = process.env.PORT || 5001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

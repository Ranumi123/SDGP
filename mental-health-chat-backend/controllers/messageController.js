let messages = [];

async function sendMessage(req, res) {
  const { message, userId } = req.body;
  if (!message || !userId) return res.status(400).json({ error: "Message and userId are required" });

  const newMessage = {
    id: messages.length + 1,
    message,
    userId,
    timestamp: new Date(),
  };

  messages.push(newMessage);
  res.status(201).json({ message: "Message sent", data: newMessage });
}

async function getMessages(req, res) {
  res.json(messages);
}

module.exports = { sendMessage, getMessages };

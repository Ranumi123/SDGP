class Message {
  final String role; // 'user' or 'bot'
  final String content;

  Message({required this.role, required this.content});
}
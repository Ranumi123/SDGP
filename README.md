# Chat App

## Overview

This is a Flutter-based chat application that includes several mental wellness features, such as a mood tracker, NLP filtering, a chat forum, a chatbot, an alert system, and a personalized feed.

## Features

### Mood Tracker

- Allows users to log their mood using an **emoji-based scale** or a numerical scale.
- Stores data locally or in the cloud (**Hive, SQLite, or Firebase**).
- Displays mood trends over time using **charts and analytics**.

### NLP Filter

- Uses **LangChain** and sentiment analysis to detect **pessimistic, harmful, or sensitive messages**.
- Prevents or warns users about potentially negative messages.
- Provides an option to **override false positives**.

### Chat Forum

- Enables users to create **posts and comments**.
- Supports **upvotes/downvotes** for community moderation.
- Allows **anonymous posting** for user privacy.

### Chat Bot

- Integrates with **Dialogflow, OpenAI API, or a custom NLP model**.
- Provides guided mental wellness conversations.
- Personalizes responses based on **user mood data**.

### Alert System

- Sends **push notifications** for new messages, forum replies, and chatbot interactions.
- Detects extreme negative sentiment and can send **emergency alerts**.

### Feed

- Displays **community posts, motivational quotes, and mental wellness resources**.
- Personalizes the feed based on **mood trends**.
- Implements **infinite scrolling** with Firebase pagination.

## Getting Started

### Prerequisites

Ensure you have Flutter installed. If not, follow the official [Flutter installation guide](https://docs.flutter.dev/get-started/install).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/chat-app.git
   cd chat-app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## How to Flutter

If you are new to Flutter, here are some essential resources to get started:

- [Flutter Official Documentation](https://docs.flutter.dev/)
- [Dart Programming Language](https://dart.dev/)
- [Flutter Codelabs](https://docs.flutter.dev/codelabs)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Flutter YouTube Channel](https://www.youtube.com/c/flutterdev)

## Dependencies

The app uses the following Flutter packages:

- **firebase\_core** – Firebase integration
- **cloud\_firestore** – Firestore for database
- **provider** – State management
- **flutter\_local\_notifications** – Push notifications
- **fl\_chart** – Charts for mood tracking
- **dialogflow\_flutter** – Chatbot integration
- **langchain\_flutter** – NLP filtering

## Contribution

Feel free to contribute! Fork the repo, make changes, and submit a pull request.

## License

This project is licensed under the MIT License.

---

For more details, check the [Flutter documentation](https://docs.flutter.dev/) and [Firebase documentation](https://firebase.google.com/docs).


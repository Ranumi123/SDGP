import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mental_app1/main.dart'; // Adjust the import based on your project structure

void main() {
  testWidgets('WelcomePage UI Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the welcome message is displayed.
    expect(find.text('Welcome to Serenity'), findsOneWidget);

    // Verify that the description text is displayed.
    expect(
      find.text(
        'Your journey to mental wellness starts here. Take the first step towards a healthier mind and a happier you.',
      ),
      findsOneWidget,
    );

    // Verify that the "Get Started" button is displayed.
    expect(find.text('Get Started'), findsOneWidget);

    // Verify that the logo/image is displayed.
    expect(find.byType(Image), findsOneWidget);

    // Tap the "Get Started" button and trigger a frame.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that the app navigates to the home page.
    expect(find.text('Welcome to the Home Page!'), findsOneWidget);
  });
}
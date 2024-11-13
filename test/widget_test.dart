import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_list_manager_task/list_manage.dart';
import 'package:item_list_manager_task/main.dart';

void main() {
  group('ListView Task Tests', () {
    testWidgets('Should add item to list and clear TextField',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Enter item to text field
      const testText = 'Item';
      await tester.enterText(find.byType(TextField), testText);

      // Verify text was entered
      expect(find.text(testText), findsOneWidget);
      print('Text entered in TextField.');

      // Tap add button
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      print('Add Button clicked.');

      // Verify item was added to list
      expect(find.text(testText), findsOneWidget);
      expect(itemsNotifier.value.contains(testText), isTrue);
      expect(itemsNotifier.value.length, 1);
      print('Item added to list.');

      // Verify TextField was cleared
      final textFieldWidget = tester.widget<TextField>(find.byType(TextField));
      expect(textFieldWidget.controller!.text, isEmpty);
      print('TextField cleared.');
    });

    testWidgets('Should not add empty string to list',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Try to add empty string
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();

      // Verify nothing was added
      expect(itemsNotifier.value.isEmpty, isTrue);
      print('Empty string not added to list.');
    });

    setUp(() {
      // Reset the ValueNotifier before each test
      itemsNotifier.value = [];
    });
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pratikum/navigasi_lanjutan.dart' as navigasi;

void main() {
  testWidgets('kategori membuka halaman detail yang tepat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const navigasi.MyApp());

    const categories = {
      'Pantai': Colors.teal,
      'Gunung': Colors.brown,
      'Budaya': Colors.deepOrange,
      'Kuliner': Colors.amber,
    };

    for (final category in categories.entries) {
      await tester.ensureVisible(find.text(category.key));
      await tester.pumpAndSettle();
      await tester.tap(find.text(category.key));
      await tester.pumpAndSettle();

      expect(find.text(category.key), findsOneWidget);
      expect(
        tester.widget<AppBar>(find.byType(AppBar)).backgroundColor,
        category.value,
      );

      await tester.tap(find.text('Kembali'));
      await tester.pumpAndSettle();
      expect(find.text('Beranda'), findsOneWidget);
    }
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'test_widget.dart';

void main() {
  late ScrollController scrollController;

  setUp(() => scrollController = ScrollController());

  group('Hidable Widget', () {
    testWidgets(
      'should work correctly as default',
      (WidgetTester tester) async {
        await tester.pumpWidget(TestWidget(scrollController: scrollController));

        expect(find.byType(Align), findsOneWidget);
        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Opacity), findsOneWidget);

        scrollController.jumpTo(10);
      },
    );

    testWidgets(
      'should work correctly with [PreferredSizeWidget]',
      (WidgetTester tester) async {
        await tester.pumpWidget(TestWidget(
          wAppBar: true,
          scrollController: scrollController,
          visibility: (position, current) {
            return 1;
          },
        ));

        expect(find.byType(Align), findsNWidgets(2));
        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Opacity), findsOneWidget);

        scrollController.jumpTo(10);
      },
    );
  });
}

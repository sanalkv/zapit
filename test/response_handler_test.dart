import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapit/core/model/coin_model.dart';
import 'package:zapit/ui/widget/loader.dart';
import 'package:zapit/ui/widget/response_handler.dart';

void main() {
  group(
    'Testing Response Handler Widget\n',
    () {
      testWidgets('Check whether text widget is displayed with error message when error occured', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ResponseHandler(
            isBusy: false,
            error: 'Failed to load',
            hasError: true,
            child: SizedBox.shrink(),
          ),
        ));

        final errorMessageFinder = find.text('Failed to load');
        expect(errorMessageFinder, findsOneWidget);
      });

      testWidgets('Check whether Loader widget is displayed when ui is loading', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ResponseHandler(
            isBusy: true,
            error: null,
            hasError: false,
            child: SizedBox.shrink(),
          ),
        ));

        final loaderWidgetFinder = find.byType(Loader);
        expect(loaderWidgetFinder, findsOneWidget);
      });

      testWidgets('Check whether child widget is displayed when ui finished loading without any error', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: const ResponseHandler(
            isBusy: false,
            error: null,
            hasError: false,
            child: SizedBox.shrink(),
          ),
        ));

        final loaderWidgetFinder = find.byType(SizedBox);
        expect(loaderWidgetFinder, findsOneWidget);
      });
    },
  );
}

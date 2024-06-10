// test/ui/pages/counter_page_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/counter_bloc.dart';
import 'package:flutter_bloc_example/blocs/counter_event.dart';
import 'package:flutter_bloc_example/ui/pages/counter_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CounterBloc(),
          child: CounterPage(),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Contador: 0'), findsOneWidget);
    expect(find.text('Contador: 1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Contador: 0'), findsNothing);
    expect(find.text('Contador: 1'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('Contador: 1'), findsNothing);
    expect(find.text('Contador: 0'), findsOneWidget);
  });
}

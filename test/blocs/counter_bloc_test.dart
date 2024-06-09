// test/blocs/counter_bloc_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_example/blocs/counter_bloc.dart';
import 'package:flutter_bloc_example/blocs/counter_event.dart';
import 'package:flutter_bloc_example/blocs/counter_state.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc.close();
    });

    test('initial state is CounterState(0)', () {
      expect(counterBloc.state, CounterState(0));
    });

    blocTest<CounterBloc, CounterState>(
      'emits [CounterState(1)] when CounterIncremented is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterIncremented()),
      expect: () => [CounterState(1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterState(-1)] when CounterDecremented is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterDecremented()),
      expect: () => [CounterState(-1)],
    );
  });
}

// lib/ui/pages/counter_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/counter_bloc.dart';
import '../../blocs/counter_event.dart';
import '../../blocs/counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contador usando BLoC'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              'Contador: ${state.counterValue}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Incrementar',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecremented());
            },
            tooltip: 'Decrementar',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

import 'package:counter_app_flutter_bloc/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App(Flutter BLoC)',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: BlocProvider(create: (context) => CounterBloc(), child: CounterPage(title: 'Counter App(Flutter BLoC)')),
      // home: Home(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(child: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) => Text('Value: ${state.value}', style: TextStyle(fontSize: 32)))),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(heroTag: 'dec', onPressed: () => bloc.add(Decrement()), child: Icon(Icons.remove)),
            SizedBox(width: 20),
            FloatingActionButton(heroTag: 'reset', onPressed: () => bloc.add(Reset()), child: Icon(Icons.loop)),
            SizedBox(width: 20),
            FloatingActionButton(heroTag: 'inc', onPressed: () => bloc.add(Increment()), child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}

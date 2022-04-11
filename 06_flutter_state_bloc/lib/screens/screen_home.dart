import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_bloc/blocs/counter/bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previous, current) => previous.count != current.count,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Count : ' + state.count.toString()),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter');
                  },
                  child: Text('Go to CounterScreen'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

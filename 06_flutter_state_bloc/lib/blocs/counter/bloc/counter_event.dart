part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrement extends CounterEvent {
  const CounterIncrement();

  @override
  String toString() => '[+] CounterIncrement';
}

class CounterDecrement extends CounterEvent {
  const CounterDecrement();

  @override
  String toString() => '[-] CounterDecrement';
}

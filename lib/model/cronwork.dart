part of cronwork;

class CronworkStates<T> {
  T state;
  Function callback;

  CronworkStates({
    @required this.state,
    @required this.callback
  });
}

class CronworkConfiguration<T> {
  Duration delay;
  List<CronworkStates<T>> states;

  CronworkConfiguration(this.delay, this.states);
}
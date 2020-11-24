part of cronwork;

class CronWork<T> {
  Timer _timer;
  T currentStatus;
  CronworkConfiguration<T> _configuration;

  startCron(T state) {
    currentStatus = state;
    stopCron();
    CronworkStates _selectedState = _configuration.states.firstWhere((element) => element.state == state, orElse: () => null);

    if(_selectedState != null) {
      _selectedState.callback();
      _cronFunc(_selectedState.callback);  
    } else {
      throw "The selected state is null";
    }
  }

  _cronFunc(Function callback) {
    _timer = new Timer(_configuration.delay, () {
      callback();
      _cronFunc(callback);
    });
  }

  stopCron() {
    _timer?.cancel();
  }

  resumeCron() {
    if(currentStatus != null) {
      startCron(currentStatus);
    } else {
      throw "Current Status is null";
    }
  }

  CronWork(CronworkConfiguration configuration) {
    _configuration = configuration;
  }
}
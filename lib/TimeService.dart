class TimeService {
  final List<TimeValue> _times = [];

  TimeService addTime(TimeValue time){
    this._times.add(time);
    print('time added $time');
    print('total: $this');
    return this;
  }

  TimeValue total() => this._times
      .reduce((total, value) => total.sum(value));

  List<TimeValue> times() => this._times.toList();

  @override
  String toString() {
    return this._times
        .map((TimeValue time) => '$time+')
        .reduce((string, time)=> '$string\n$time');
  }
}

class TimeValue {
  final int hours;
  final int minutes;

  TimeValue({this.hours=0, this.minutes=0});

  TimeValue sum(TimeValue time) => new TimeValue(
    hours: this.hours + time.hours,
    minutes: this.minutes + time.minutes,
  );

  @override
  String toString() {
    return '${this.hours}:${this.minutes}';
  }
}

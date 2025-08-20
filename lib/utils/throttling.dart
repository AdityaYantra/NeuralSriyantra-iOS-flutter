import 'dart:async';

class Throttler {
  Throttler({required this.interval});
  final Duration interval;
  Timer? _timer;

  void call(void Function() action) {
    if (_timer?.isActive ?? false) return;
    action();
    _timer = Timer(interval, () {});
  }
}

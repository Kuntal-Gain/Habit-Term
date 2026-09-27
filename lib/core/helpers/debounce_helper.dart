import 'dart:async';

/// Debounces rapid, repeated calls (e.g. search input) into a single
/// invocation after [duration] has elapsed with no further calls.
class DebounceHelper {
  DebounceHelper({this.duration = const Duration(milliseconds: 300)});

  final Duration duration;
  Timer? _timer;

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

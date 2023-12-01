import "dart:async";

import "package:rxdart/rxdart.dart";

class MyBLOCController {
  final BehaviorSubject<int> _counter = BehaviorSubject<int>()..add(0);

  int get counter => _counter.value;
  set counter(int value) => _counter.sink.add(value);

  MergeStream<dynamic> get mergedStream => MergeStream<dynamic>(
        <Stream<dynamic>>[_counter.stream],
      );

  void closeResources() {
    unawaited(_counter.close());
    return;
  }
}

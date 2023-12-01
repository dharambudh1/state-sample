import "package:get/get.dart";

class MyGetXController {
  final RxInt _counter = 0.obs;

  int get counter => _counter.value;
  set counter(int value) => _counter(value);

  void closeResources() {
    _counter.close();
    return;
  }
}

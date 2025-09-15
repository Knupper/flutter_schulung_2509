import 'dart:async';

void main(List<String> args) {
  final NumberGenerator numberGenerator = NumberGenerator();
  late StreamSubscription sub1;
  late StreamSubscription sub2;

  Future.delayed(Duration(seconds: 1), () {
    sub1 = numberGenerator.stream.listen((event) {
      print('sub1: $event');
    });
  });

  Future.delayed(Duration(seconds: 5), () {
    sub1.cancel();
  });
}

class NumberGenerator {
  NumberGenerator() {
    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.add(_counter);
      _counter++;
    });

    Future.delayed(Duration(seconds: 10), () {
      timer.cancel();
      _controller.close();
    });
  }

  int _counter = 0;
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;
}

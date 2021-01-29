import 'dart:async';
import 'dart:io';

import 'package:flutter_beep/flutter_beep.dart';
import 'package:rx_notifier/rx_notifier.dart';

class InitialController {
  final _startCount = RxNotifier<bool>(false);
  final _count = RxNotifier<int>(5);
  Timer _timer;

  bool get startCount => _startCount.value;
  void changeStartCount(bool value) => _startCount.value = value;

  int get decrementCounter => --_count.value;
  int get count => _count.value;

  void startTimer() {
    changeStartCount(!startCount);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (count == 0) {
        await FlutterBeep.beep();
        sleep(Duration(seconds: 1));
        _count.value = 60;
      } else {
        decrementCounter;
      }
    });
  }

  void cancelTimer() {
    _timer.cancel();
    changeStartCount(!startCount);
    _count.value = 5;
  }
}

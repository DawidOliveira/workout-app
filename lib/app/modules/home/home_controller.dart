import 'package:rx_notifier/rx_notifier.dart';

class HomeController {
  final _currentIndex = RxNotifier<int>(0);

  int get currentIndex => _currentIndex.value;

  void changeCurrentIndex(int index) => _currentIndex.value = index;
}

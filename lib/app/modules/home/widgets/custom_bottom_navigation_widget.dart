import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../home_controller.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  const CustomBottomNavigationWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) => BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: controller.changeCurrentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Iniciar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Treinos",
          ),
        ],
      ),
    );
  }
}

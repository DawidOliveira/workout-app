import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:workout_app/app/modules/home/home_controller.dart';
import 'package:workout_app/app/modules/initial/initial_screen.dart';
import 'package:workout_app/app/modules/workout/workout_screen.dart';

import 'widgets/custom_bottom_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationWidget(controller: controller),
      body: RxBuilder(
        builder: (_) =>
            controller.currentIndex == 0 ? InitialScreen() : WorkoutScreen(),
      ),
    );
  }
}

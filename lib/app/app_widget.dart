import 'package:flutter/material.dart';
import 'package:workout_app/app/modules/exercise/exercise_screen.dart';
import 'package:workout_app/app/modules/home/home_screen.dart';
import 'package:workout_app/app/modules/workout/workout_screen.dart';
import 'package:workout_app/app/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => HomeScreen(),
        AppRoutes.WORKOUT: (ctx) => WorkoutScreen(),
        AppRoutes.EXERCISE: (ctx) => ExerciseScreen(),
      },
    );
  }
}

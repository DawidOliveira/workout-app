import 'package:flutter/material.dart';
import 'package:workout_app/app/models/exercise.dart';
import 'package:workout_app/app/modules/exercise/exercise_controller.dart';

class InfoExerciseWidget extends StatelessWidget {
  const InfoExerciseWidget({
    Key key,
    @required this.controller,
    this.exercise,
  }) : super(key: key);

  final ExerciseController controller;
  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Column(
              children: [
                Text("Séries"),
                Text(exercise.series.toString()),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Column(
              children: [
                Text("Repetições"),
                if (exercise.type == "time") Text("${exercise.repeat}'"),
                if (exercise.type == "repeat") Text("${exercise.repeat}")
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Column(
              children: [
                Text("Descanso"),
                Text("${exercise.timeInSeconds.toString()}'"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

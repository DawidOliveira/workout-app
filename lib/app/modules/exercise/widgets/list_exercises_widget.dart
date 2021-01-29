import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:workout_app/app/models/exercise.dart';
import 'package:workout_app/app/modules/exercise/widgets/info_exercise_widget.dart';

import '../exercise_controller.dart';

class ListExercisesWidget extends StatelessWidget {
  const ListExercisesWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ExerciseController controller;

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        if (controller.exercisesList.length == 0)
          return Center(
            child: Text("Sem exercícios cadastrados."),
          );
        return ListView.separated(
          itemBuilder: (context, index) {
            ExerciseModel exercise = controller.exercisesList[index];
            return Visibility(
              visible: exercise != null,
              child: InkWell(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Deseja apagar?"),
                      content:
                          Text("Você realmente deseja apagar este exercício?"),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Não"),
                        ),
                        FlatButton(
                          onPressed: () async {
                            await controller.removeExercise(exercise.id);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Sim",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                          bottom: 0,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          exercise.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Divider(),
                      InfoExerciseWidget(
                        controller: controller,
                        exercise: exercise,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15,
            );
          },
          itemCount: controller.exercisesList.length,
        );
      },
    );
  }
}

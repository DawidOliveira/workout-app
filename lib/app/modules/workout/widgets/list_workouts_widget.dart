import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:workout_app/app/modules/workout/workout_controller.dart';
import 'package:workout_app/app/utils/app_routes.dart';

class ListWorkoutsWidget extends StatelessWidget {
  const ListWorkoutsWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final WorkoutController controller;

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        if (controller.workoutsList.length == 0)
          return Center(
            child: Text("Sem treino cadastrado"),
          );
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.EXERCISE,
                  arguments: controller.workoutsList[index],
                );
              },
              title: Text(controller.workoutsList[index].name),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await controller
                      .removeWorkout(controller.workoutsList[index].id);
                },
              ),
            );
          },
          separatorBuilder: (_, __) {
            return Divider(
              height: 0,
            );
          },
          itemCount: controller.workoutsList.length,
        );
      },
    );
  }
}

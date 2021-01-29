import 'package:flutter/material.dart';
import 'package:workout_app/app/modules/workout/widgets/list_workouts_widget.dart';
import 'package:workout_app/app/modules/workout/workout_controller.dart';
import 'package:workout_app/app/widgets/button_primary_widget.dart';
import 'package:workout_app/app/widgets/button_secondary_widget.dart';

class WorkoutScreen extends StatelessWidget {
  final controller = WorkoutController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Treinos"),
        leading: Icon(Icons.fitness_center),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context);
        },
        child: Icon(Icons.add),
        tooltip: "Adicionar novo treino",
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        child: ListWorkoutsWidget(controller: controller),
      ),
    );
  }

  _showForm(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 5 : 0,
          ),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Adicionar novo treino: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: controller.setWorkoutName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite um nome para seu treino...",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ButtonSecondaryWidget(
                      fn: () {
                        Navigator.of(context).pop();
                      },
                      text: "Cancelar",
                      width: MediaQuery.of(context).size.width / 2 - 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ButtonPrimaryWidget(
                      fn: () async {
                        await controller.setWorkout();
                        Navigator.pop(context);
                      },
                      text: "Adicionar",
                      width: MediaQuery.of(context).size.width / 2 - 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

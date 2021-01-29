import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:workout_app/app/models/workout.dart';
import 'package:workout_app/app/shared/workouts/repositories/local_storage_repository.dart';

class WorkoutController {
  final _ls = LocalStorageRepository();
  final workoutsList = RxList<WorkoutModel>([]);

  final _workoutName = RxNotifier<String>("");

  void setWorkoutName(String value) => _workoutName.value = value;

  WorkoutController() {
    getWorkouts("workouts");
  }

  Future<void> setWorkout() async {
    var aux = WorkoutModel(
      id: UniqueKey().toString().substring(1, 6),
      name: _workoutName.value,
    );
    await _ls.saveData(
      "workouts",
      aux,
    );
    workoutsList.add(aux);
  }

  Future<void> removeWorkout(String id) async {
    await _ls.deleteData("workouts", id);
    workoutsList.removeWhere((element) => element.id == id);
  }

  Future<void> getWorkouts(String key) async {
    final List result = await _ls.getData(key);

    workoutsList.addAll(result == null
        ? []
        : result
            .map((e) => WorkoutModel.fromJson(
                  json: e,
                ))
            .toList());
  }
}

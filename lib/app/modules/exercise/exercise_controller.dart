import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:workout_app/app/models/exercise.dart';
import 'package:workout_app/app/models/workout.dart';
import 'package:workout_app/app/shared/workouts/repositories/local_storage_repository.dart';

class ExerciseController {
  final _ls = LocalStorageRepository();
  final List<ExerciseModel> exercisesList = RxList<ExerciseModel>([]);

  final types = ["time", "repeat"];
  final _name = RxNotifier<String>("");
  final _serie = RxNotifier<int>(0);
  final _repeat = RxNotifier<int>(0);
  final _descanso = RxNotifier<int>(0);

  void setName(String value) => _name.value = value;
  void setSerie(String value) {
    _serie.value = int.parse(value);
  }

  void setRepeat(String value) {
    _repeat.value = int.parse(value);
  }

  void setDescanso(String value) {
    _descanso.value = int.parse(value);
  }

  ExerciseController(BuildContext ctx) {
    getExercises("exercises", ctx);
  }

  Future<void> setExercise(String type, BuildContext context) async {
    final m = ModalRoute.of(context).settings.arguments as WorkoutModel;

    var aux = ExerciseModel(
      id: UniqueKey().toString().substring(1, 6),
      name: _name.value,
      repeat: _repeat.value,
      series: _serie.value,
      timeInSeconds: _descanso.value,
      type: type,
      idWorkout: m.id,
    );
    await _ls.saveData(
      "exercises",
      aux,
    );
    exercisesList.add(aux);
  }

  Future<void> removeExercise(String id) async {
    await _ls.deleteData("exercises", id);
    exercisesList.removeWhere((element) => element.id == id);
  }

  Future<void> getExercises(String key, BuildContext context) async {
    final List result = await _ls.getData(key);
    final m = ModalRoute.of(context).settings.arguments as WorkoutModel;
    exercisesList.addAll(result == null
        ? []
        : result.map((e) {
            if (e["idWorkout"] == m.id) {
              return ExerciseModel.fromJson(
                json: e,
              );
            }
          }).toList());
    if (exercisesList.contains(null)) {
      exercisesList.removeWhere((item) => item == null);
    }
  }
}

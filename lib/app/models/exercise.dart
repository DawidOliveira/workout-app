class ExerciseModel {
  String id;
  String name;
  int series;
  String type;
  int repeat;
  int timeInSeconds;
  String idWorkout;

  ExerciseModel(
      {this.id,
      this.name,
      this.series,
      this.type,
      this.repeat,
      this.timeInSeconds,
      this.idWorkout});

  ExerciseModel.fromJson({Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    series = json['series'];
    type = json['type'];
    repeat = json['repeat'];
    timeInSeconds = json['timeInSeconds'];
    idWorkout = json['idWorkout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['series'] = this.series;
    data['type'] = this.type;
    data['repeat'] = this.repeat;
    data['timeInSeconds'] = this.timeInSeconds;
    data['idWorkout'] = this.idWorkout;
    return data;
  }
}

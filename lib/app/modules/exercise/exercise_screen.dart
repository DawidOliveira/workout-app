import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/app/models/workout.dart';
import 'package:workout_app/app/modules/exercise/exercise_controller.dart';
import 'package:workout_app/app/modules/exercise/widgets/dual_button_widget.dart';
import 'package:workout_app/app/modules/exercise/widgets/list_exercises_widget.dart';
import 'package:workout_app/app/widgets/text_input_widget.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ExerciseController controller;

  @override
  void initState() {
    super.initState();
    controller = ExerciseController(context);
  }

  final _autoCompleteKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final workout = ModalRoute.of(context).settings.arguments as WorkoutModel;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Treino: ${workout.name}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListExercisesWidget(controller: controller),
      ),
    );
  }

  _showForm(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    _scaffoldKey.currentState.showBottomSheet(
      (context) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.grey[300],
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 5 : 20,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Adicionar novo exercício: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextInputWidget(
                    onChanged: controller.setName,
                    label: "Nome do exercício",
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextInputWidget(
                        width: _size.width / 3,
                        label: "Séries",
                        onChanged: controller.setSerie,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      TextInputWidget(
                        width: _size.width / 2,
                        label: "Repetições",
                        onChanged: controller.setRepeat,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextInputWidget(
                        width: _size.width / 3,
                        label: "Intervalo (em segundos)",
                        keyboardType: TextInputType.number,
                        onChanged: controller.setDescanso,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: _size.width / 2,
                        child: AutoCompleteTextField(
                          key: _autoCompleteKey,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                "Tipos: (digite time para tempo ou repeat para repetições)",
                          ),
                          controller: _textController,
                          suggestions: controller.types,
                          itemBuilder: (context, suggestion) => ListTile(
                            title: Text(suggestion),
                          ),
                          itemFilter: (String suggestion, String query) =>
                              suggestion
                                  .toLowerCase()
                                  .startsWith(query.toLowerCase()),
                          itemSorter: (String a, String b) => a.compareTo(b),
                          itemSubmitted: (String data) {
                            _textController.text = data;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DualButtonWidget(
                    primaryFunc: () async {
                      await controller.setExercise(
                          _textController.text, context);
                      Navigator.of(context).pop();
                    },
                    secondaryFunc: () {
                      Navigator.of(context).pop();
                    },
                    textPrimaryButton: "Adicionar",
                    textSecondaryButton: "Cancelar",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Obs.: Nos tipos digite 'time' para tempo ou 'repeat' para repetições.")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

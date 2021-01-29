import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:workout_app/app/modules/initial/initial_controller.dart';

class InitialScreen extends StatelessWidget {
  final controller = InitialController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: RxBuilder(
        builder: (context) {
          if (controller.startCount)
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      controller.count.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          controller.cancelTimer();
                        },
                        color: Colors.purple[900],
                        child: Text("Cancelar"),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            );
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: MaterialButton(
                onPressed: () {
                  controller.startTimer();
                },
                color: Colors.purple[900],
                child: Container(
                  height: 100,
                  width: 70,
                  alignment: Alignment.center,
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

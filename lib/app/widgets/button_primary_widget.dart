import 'package:flutter/material.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final String text;
  final Function fn;
  final double width;
  const ButtonPrimaryWidget({
    Key key,
    this.text,
    this.fn,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: RaisedButton(
        onPressed: fn,
        color: Theme.of(context).primaryColor,
        child: Text(text),
        textColor: Colors.white,
      ),
    );
  }
}

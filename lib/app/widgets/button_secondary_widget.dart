import 'package:flutter/material.dart';

class ButtonSecondaryWidget extends StatelessWidget {
  final String text;
  final Function fn;
  final double width;
  const ButtonSecondaryWidget({
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
        color: Colors.grey,
        child: Text(text),
        textColor: Colors.black,
      ),
    );
  }
}

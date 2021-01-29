import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key key,
    this.width = double.infinity,
    this.label,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
  }) : super(key: key);

  final double width;
  final String label;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
      ),
    );
  }
}

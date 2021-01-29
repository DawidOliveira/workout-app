import 'package:flutter/material.dart';
import 'package:workout_app/app/widgets/button_primary_widget.dart';
import 'package:workout_app/app/widgets/button_secondary_widget.dart';

class DualButtonWidget extends StatelessWidget {
  const DualButtonWidget({
    Key key,
    this.textPrimaryButton,
    this.textSecondaryButton,
    this.primaryFunc,
    this.secondaryFunc,
  }) : super(key: key);

  final String textPrimaryButton;
  final String textSecondaryButton;

  final Function primaryFunc;
  final Function secondaryFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonSecondaryWidget(
          fn: secondaryFunc,
          text: textSecondaryButton,
          width: MediaQuery.of(context).size.width / 2 - 25,
        ),
        SizedBox(
          width: 10,
        ),
        ButtonPrimaryWidget(
          fn: primaryFunc,
          text: textPrimaryButton,
          width: MediaQuery.of(context).size.width / 2 - 25,
        ),
      ],
    );
  }
}

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core/theme/theme_config.dart';

class QButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color? color;
  final Color? textColor;

  const QButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //sizebox
      width: MediaQuery.of(context).size.width, //w10
      height: 42, //heig42
      child: ElevatedButton(
        //button
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryColor,
          shape: RoundedRectangleBorder(
            //shape8
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

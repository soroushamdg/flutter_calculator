import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/themedata.dart';

class KeypadButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool darkTheme;
  final Color labelLightColor;
  final Color labelDarkColor;
  const KeypadButton(
      {this.onPressed,
      this.label,
      this.labelLightColor,
      this.labelDarkColor,
      this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            color: (darkTheme == false)
                ? buttonLightThemeTextColor
                : buttonDarkThemeTextColor),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.red)),
    );
  }
}

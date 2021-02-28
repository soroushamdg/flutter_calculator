import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final bool border;
  final double width;
  final Function onPressed;
  final String label;
  final bool darkTheme;
  final Color labelColor;
  const KeypadButton(
      {this.onPressed,
      this.label,
      this.labelColor,
      this.darkTheme = false,
      this.width = 63.0,
      this.border = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 63.0,
        child: RaisedButton(
            color: (darkTheme) ? Color(0xFF1A1C22) : Color(0xFFE7E7E7),
            elevation: 0.0,
            hoverElevation: 1.0,
            highlightElevation: 1.0,
            highlightColor: Colors.transparent,
            splashColor: (darkTheme) ? Color(0xf2E7E7E7) : Color(0xf21A1C22),
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                  color: (labelColor != null)
                      ? labelColor
                      : (darkTheme)
                          ? Color(0xfff2f2f2)
                          : Color(0xFF22252D)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: (border)
                  ? BorderSide(color: Color(0xffF37B7B), width: 1.0)
                  : BorderSide.none,
            )));
  }
}

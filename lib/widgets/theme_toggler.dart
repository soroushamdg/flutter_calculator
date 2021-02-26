import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/thememodes_bloc.dart';

const Duration animationDuration = Duration(milliseconds: 300);

class ThemeTogglerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeMode>(
        builder: (context, ThemeMode currenttheme) {
      return AnimatedContainer(
        duration: animationDuration,
        height: 36.0,
        width: 90.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: (currenttheme == ThemeMode.light)
                ? Color(0xfff2f2f2)
                : Color(0xff292D36)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: animationDuration,
              curve: Curves.easeIn,
              top: 3.0,
              left: (currenttheme == ThemeMode.light) ? 50.0 : 0.0,
              right: (currenttheme == ThemeMode.light) ? 0.0 : 50.0,
              child: InkWell(
                borderRadius: BorderRadius.circular(14.0),
                splashColor: Colors.white,
                onTap: () {
                  context.read<ThemeModeBloc>().add(ThemeModes.toggle);
                },
                child: AnimatedSwitcher(
                  duration: animationDuration,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: (currenttheme == ThemeMode.light)
                      ? Icon(
                          Icons.wb_sunny_outlined,
                          size: 30.0,
                          key: UniqueKey(),
                          color: (currenttheme == ThemeMode.dark)
                              ? Color(0xffFFFFFF)
                              : Color(0xFF22252D),
                        )
                      : Icon(
                          Icons.nights_stay,
                          size: 30.0,
                          key: UniqueKey(),
                          color: (currenttheme == ThemeMode.dark)
                              ? Color(0xfff2f2f2)
                              : Color(0xff292D36),
                        ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

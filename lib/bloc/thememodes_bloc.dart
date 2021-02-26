import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ThemeModes { dark, light }

class ThemeModeBloc extends Bloc<ThemeModes, ThemeMode> {
  ThemeModeBloc() : super(ThemeMode.light);

  @override
  Stream<ThemeMode> mapEventToState(ThemeModes event) async* {
    switch (event) {
      case ThemeModes.light:
        yield ThemeMode.light;
        break;
      case ThemeModes.dark:
        yield ThemeMode.dark;
        break;
    }
  }
}

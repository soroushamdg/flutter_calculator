import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/thememodes_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeBloc>(
          create: (BuildContext context) => ThemeModeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeModeBloc, ThemeMode>(
          builder: (context, ThemeMode thememode) {
        return MaterialApp(
          theme: ThemeData.light().copyWith(
              buttonColor: Color(0xFF272B33),
              backgroundColor: Color(0xffFFFFFF)),
          darkTheme: ThemeData.dark().copyWith(
              buttonColor: Color(0xFFF7F7F7),
              backgroundColor: Color(0xFF22252D)),
          debugShowCheckedModeBanner: false,
          themeMode: thememode,
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/inoutdisplay_bloc.dart';
import 'package:flutter_calculator/bloc/thememodes_bloc.dart';
import 'package:flutter_calculator/screens/main_screen.dart';
import 'package:flutter_calculator/widgets/theme_toggler.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeBloc>(
          create: (BuildContext context) => ThemeModeBloc(),
        ),
        BlocProvider<InOutDisplayBloc>(
            create: (BuildContext context) => InOutDisplayBloc()),
      ],
      child: BlocBuilder<ThemeModeBloc, ThemeMode>(
          builder: (context, ThemeMode thememode) {
        return MaterialApp(
          theme: ThemeData.light().copyWith(
            textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Lato'),
            backgroundColor: Color(0xffFFFFFF),
          ),
          darkTheme: ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Lato'),
              backgroundColor: Color(0xFF000000),
              scaffoldBackgroundColor: Color(0xFF000000)),
          debugShowCheckedModeBanner: false,
          themeMode: thememode,
          home: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: ThemeTogglerWidget(),
            ),
            body: SafeArea(
              child: MainScreen(),
            ),
          ),
        );
      }),
    );
  }
}

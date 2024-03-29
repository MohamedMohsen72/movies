import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/view/splash_view.dart';
import 'package:netfliex/view/view_model/home_cubit.dart';
import 'package:netfliex/widget/navbar.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => moviesCubit(),
        child: MaterialApp(
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 25,
                    color: AppColor.whiteColor,
                    fontFamily: GoogleFonts.ptSans().fontFamily)),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.black, foregroundColor: Colors.white),
          ),
          home: SplashView(),
        ));
  }
}

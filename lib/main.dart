import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/features/auth/view_model/auth_qubit.dart';
import 'package:netfliex/features/home/view/splash_view.dart';
import 'package:netfliex/features/view_model/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDbbEn2ev6Hme-gdvgJrm9D3be-RHP1Eig',
          appId: 'com.example.netfliex',
          projectId: 'movies-2ccf2',
          messagingSenderId: '37821005998'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return moviesCubit();
        }),
        BlocProvider(create: (context) {
          return AuthCubit();
        }),
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                EdgeInsets.only(left: 25, bottom: 15, right: 20, top: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: AppColor.ScaffoldBG,
            suffixIconColor: AppColor.primarycolor,
            prefixIconColor: AppColor.primarycolor,
            hintStyle: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
          ),
          scaffoldBackgroundColor: Color(0xFF0D253F),
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontSize: 18,
                  color: AppColor.balckColor,
                  fontFamily: GoogleFonts.ptSans().fontFamily)),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF0D253F),
              foregroundColor: Colors.white),
        ),
        home: SplashView(),
      ),
    );
  }
}

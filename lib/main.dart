import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigamusculerator/res/bloc/man_bloc.dart';
import 'package:gigamusculerator/res/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Colors
        colorSchemeSeed: const Color(0xFF4C4C4C),
        brightness: Brightness.dark,
        useMaterial3: true,

        // Other
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      home: BlocProvider(
        create: (_) => ManBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}

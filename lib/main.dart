import 'package:floatingbutton/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        ),
        home: const FloatButton(),
      ),
    );

import 'package:cv/domen/data/data.dart';
import 'package:cv/views/app_const.dart';

import 'package:cv/views/pages/main/main_page.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Data.WEB_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: SUB_COLOR),
      ),
      home: MainPage(),
    );
  }
}

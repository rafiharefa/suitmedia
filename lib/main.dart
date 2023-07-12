import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia/app/data/variables.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 1,
              iconTheme: IconThemeData(color: Vars.cyan),
              titleTextStyle: TextStyle(
                  color: Vars.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
    );
  }
}

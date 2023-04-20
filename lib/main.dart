import 'package:eltracmo_customers/pages/customer/dashboard_page.dart';
import 'package:eltracmo_customers/pages/common/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/app_theme.dart';

void main() {
  runApp(const EltracmoCustomerApp());
}

class EltracmoCustomerApp extends StatelessWidget {
  const EltracmoCustomerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'ELTRACMO',
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.appBarColor,
          centerTitle: true,
          foregroundColor: AppTheme.appBarForegroundColor,
        ),
        textTheme: GoogleFonts.latoTextTheme(textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

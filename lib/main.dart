import 'package:eltracmo_customers/pages/customer/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/app_theme.dart';

void main() {
  runApp(const EltracmoCustomerApp());
}

class EltracmoCustomerApp extends StatelessWidget {
  const EltracmoCustomerApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(backgroundColor: AppTheme.appBarColor),
      primaryColor: Colors.green.shade900,
      scaffoldBackgroundColor: const Color(0xFFF4F4F4),
    );

    return baseTheme;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'ELTRACMO',
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1390d8),
          centerTitle: true,
          foregroundColor: Color(0xFFe2e2e2),
        ),
        textTheme: GoogleFonts.latoTextTheme(textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}

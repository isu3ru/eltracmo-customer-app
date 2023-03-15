import 'package:eltracmo_customers/pages/auth/login.dart';
import 'package:eltracmo_customers/pages/common/loading_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}

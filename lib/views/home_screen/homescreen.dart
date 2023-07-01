import 'package:employee_ri/utils/responsive_layout.dart';
import 'package:employee_ri/views/home_screen/mobile_homescreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileHomeScreen(),
    );
  }
}
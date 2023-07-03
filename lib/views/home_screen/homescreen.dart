import 'package:employee_ri/views/home_screen/mobile_homescreen.dart';
import 'package:employee_ri/views/not_for_other_devices.dart';
import 'package:employee_ri/widgets/responsive_layout/responsive_layout.dart';
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
      desktop: NoOtherDevice(),
      tablet: MobileHomeScreen(),
    );
  }
}

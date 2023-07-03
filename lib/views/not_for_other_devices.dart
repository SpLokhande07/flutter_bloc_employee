import 'package:employee_ri/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NoOtherDevice extends StatefulWidget {
  const NoOtherDevice({super.key});

  @override
  State<NoOtherDevice> createState() => _NoOtherDeviceState();
}

class _NoOtherDeviceState extends State<NoOtherDevice> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CustomText(
        title: "Not Designed for this Device",
      )),
    );
  }
}

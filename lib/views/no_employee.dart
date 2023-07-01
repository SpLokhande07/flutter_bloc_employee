import 'package:flutter/material.dart';

class NoEmployee extends StatelessWidget {
  const NoEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'asset/no_employee.png',
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: MediaQuery.sizeOf(context).height * 0.25,
    ));
  }
}

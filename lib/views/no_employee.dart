
import 'package:flutter/material.dart';

class NoEmployee extends StatelessWidget {
  const NoEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(child: Image.asset('/assets/no_employee.png',height: MediaQuery.sizeOf(context).height*0.2, width: MediaQuery.sizeOf(context).height*0.2,)),
    );
  }
}
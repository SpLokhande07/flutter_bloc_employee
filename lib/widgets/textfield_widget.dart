import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  // TextEditingController controller;
  
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
// controller: widget.controller,

    );
  }
}